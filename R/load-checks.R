#' @title Load and parse checks in a yaml file, and return a list
#' of useful objects.
#' @param path_checks The file path to the yaml file specifying the smells
#' and rules.  Required.
#' @param origin The origin of the dataset.
#' Currently supports "csv" and "REDCap". Required.
#'
#' @examples
#' # Step 0: define paths.
#' #   So this package example executes on every machine, temp files are used.
#'
#' # Replace the two paths for your specific project
#' path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")
#'
#' # Step 1: load the check definitions and the dataset to test
#' load_checks(path_checks, origin = "REDCap")
#'
#' @export
load_checks <- function(path_checks, origin ) { # = c("csv", "REDCap")
  # origin <- base::match.arg(origin)
  checkmate::assert_file_exists(path_checks, extension = c("yml", "yaml"))
  checkmate::assert_character(origin, any.missing = FALSE, len = 1, pattern = "^(?:csv|REDCap)$")

  checks <-
    yaml::read_yaml(
      file      = path_checks,
      eval.expr = FALSE
    )

  new_trawler_checks(checks, origin)
}

new_trawler_checks <- function(checks, origin) {
  checkmate::assert_list(checks, any.missing = FALSE, null.ok = FALSE)
  checkmate::assert_character(origin, any.missing = FALSE, len = 1, pattern = "^(?:csv|REDCap)$")

  misc        <- load_misc(   checks, origin)
  smells_all  <- load_smells( checks, origin)
  rules_all   <- load_rules(  checks, origin)

  if (origin == "csv") {
    structure(
      list(
        github_file_prefix  = misc$github_file_prefix,
        record_id_name      = misc$record_id_name,
        record_id_link      = misc$record_id_link,
        baseline_date_name  = misc$baseline_date_name,

        smells            = smells_all$smells,
        smells_inactive   = smells_all$smells_inactive,
        smell_names_md    = smells_all$smell_names_md,

        rules             = rules_all$rules,
        rules_inactive    = rules_all$rules_inactive
      ),
      class = "trawler_checks_definition"
    )
  } else if (origin == "REDCap") {
    structure(
      list(
        github_file_prefix  = misc$github_file_prefix,
        record_id_name      = misc$record_id_name,
        record_id_link      = misc$record_id_link,
        baseline_date_name  = misc$baseline_date_name,
        redcap_project_id   = misc$redcap_project_id,
        redcap_version      = misc$redcap_version,
        redcap_default_arm  = misc$redcap_default_arm,
        redcap_codebook     = misc$redcap_codebook,
        redcap_record_link  = misc$redcap_record_link,

        smells            = smells_all$smells,
        smells_inactive   = smells_all$smells_inactive,
        smell_names_md    = smells_all$smell_names_md,

        rules             = rules_all$rules,
        rules_inactive    = rules_all$rules_inactive
      ),
      class = "trawler_checks_definition"
    )
  } else {
    stop("The value of `origin` was not recognized.")
  }
}

load_misc <- function(checks, origin) {
  checkmate::assert_integerish(checks$trawler_version  , lower = 1     , len = 1, any.missing = FALSE)
  checkmate::assert_character(origin, any.missing = FALSE, len = 1, pattern = "^(?:csv|REDCap)$")

  if (as.integer(checks$trawler_version) != 1L) {
    warning(
      "This yaml file is marked as trawler version `",
      checks$trawler_version,
      "`.  But you are running v1.  Some functions may not operate as expected."
    )
  }

  checkmate::assert_character(checks$github_file_prefix, min.chars = 10, len = 1, any.missing = FALSE)

  if (origin == "REDCap") {
    checkmate::assert_character(checks$record_id_name    , min.chars =  1, len = 1, any.missing = FALSE)
    checkmate::assert_character(checks$baseline_date_name, min.chars =  1, len = 1, any.missing = FALSE)
    checkmate::assert_character(checks$record_id_link    , min.chars = 10, len = 1, any.missing = FALSE)
    checkmate::assert_integer(  checks$redcap_project_id , lower = 1     , len = 1, any.missing = FALSE)
    checkmate::assert_character(checks$redcap_version    , min.chars =  5, len = 1, any.missing = FALSE)
    checkmate::assert_integer(  checks$redcap_default_arm, lower = 1     , len = 1, any.missing = FALSE)
    checkmate::assert_character(checks$redcap_codebook   , min.chars = 10, len = 1, any.missing = FALSE)
    checkmate::assert_character(checks$redcap_record_link, min.chars = 50, len = 1, any.missing = FALSE)
  }

  l <-
    list(
      record_id_name          = checks$record_id_name,
      record_id_link          = checks$record_id_link,
      github_file_prefix      = checks$github_file_prefix,
      baseline_date_name      = checks$baseline_date_name
    )

  if (origin == "REDCap") {
    l$redcap_project_id       = checks$redcap_project_id
    l$redcap_version          = checks$redcap_version
    l$redcap_default_arm      = checks$redcap_default_arm
    l$redcap_codebook         = checks$redcap_codebook
    l$redcap_record_link      = checks$redcap_record_link
  }

  l
}

load_smells <- function(checks, origin) {
  checkmate::assert_character(origin, any.missing = FALSE, len = 1, pattern = "^(?:csv|REDCap)$")

  active <- baseline_date <- bound_lower <- bound_upper <- bounds_template <- NULL
  check_name <- data_collector <- error_message <- pass <- priority <- record_id <- NULL
  redcap_instrument <- results <- violation_count <- NULL

  ds_smell_all <-
    checks$smells |>
    purrr::map_df(tibble::as_tibble) |>
    fill_column("active") |>
    fill_column("debug")

  smells <-
    ds_smell_all |>
    dplyr::filter(active) |>
    dplyr::select(
      -active
    )

  smells_inactive <-
    ds_smell_all |>
    dplyr::filter(!active) |>
    dplyr::select(
      -active
    )

  # The smell columns (in the yaml checks file) should be correct.
  checkmate::assert_subset(
    colnames(smells),
    c("check_name", "description", "priority", "debug", "bound_lower", "bound_upper", "bounds_template", "value_template", "equation")
  )

  testit::assert(
    "The count of distinct rule columns (in the yaml checks file) should be 9, after removing `active`.",
    ncol(smells) == 9L
  )

  smells <-
    smells |>
    dplyr::mutate(
      boundaries            = sprintf(bounds_template, bound_lower, bound_upper),
    )

  # table(smells$check_name)
  # OuhscMunge::verify_value_headstart(smells)
  checkmate::assert_character(smells$check_name      , any.missing = FALSE , pattern = "^.{2,99}$"  , unique = TRUE)
  checkmate::assert_character(smells$description     , any.missing = FALSE , pattern = "^.{4,255}$" , unique = TRUE)
  checkmate::assert_integer(  smells$priority        , any.missing = FALSE , lower = 1, upper = 5   )
  checkmate::assert_logical(  smells$debug           , any.missing = FALSE                          )
  checkmate::assert_numeric(  smells$bound_lower     , any.missing = FALSE                          )
  checkmate::assert_numeric(  smells$bound_upper     , any.missing = FALSE                          )
  checkmate::assert_character(smells$bounds_template , any.missing = FALSE , pattern = "^.{2,255}$" )
  checkmate::assert_character(smells$value_template  , any.missing = FALSE , pattern = "^.{2,255}$" )
  checkmate::assert_character(smells$equation        , any.missing = FALSE , pattern = "^.{5,}$"    , unique = TRUE)
  checkmate::assert_character(smells$boundaries      , any.missing = FALSE , pattern = "^.{6,}$"    )

  # Run through each function to make sure it can be parsed successfully.
  #   It's not used until the `execute_checks()` functions
  for (i in seq_len(nrow(smells))) { # i <- 2L
    if (smells$debug[i]) {
      browser() #nocov
    }

    fx_test <- convert_equation(smells$equation[i], smells$check_name[i])
    rm(fx_test)
  }

  smell_names_md <-
    paste0(
      sprintf(
        "%i smells have been defined:\n\n",
        nrow(smells)
        # checks$github_file_prefix,
        # path_checks
      ),
      # glue::glue("{nrow(smells)} smells [have been defined]({checks$github_file_prefix}/{path_checks}):\n\n"),
      paste0(
        smells |>
          tibble::rowid_to_column() |>
          {\(d)
            sprintf("%i. %s;", d$rowid, d$check_name)
          }(),
          # glue::glue_data(, "1. {check_name};\n"),
        collapse = "\n"
      ),
      sep = "\n"
    )

  list(
    smells              = smells,
    smells_inactive     = smells_inactive,
    smell_names_md      = smell_names_md
  )
}

convert_equation <- function(equation, check_name) {
  tryCatch({
    eval(parse(text = equation))
  }, error = function(e) {
    stop("Problem parsing the equation for smell `", check_name, "`.\n", e)
  })
}

#' @importFrom rlang .data
load_rules <- function(checks, origin) {
  checkmate::assert_character(origin, any.missing = FALSE, len = 1, pattern = "^(?:csv|REDCap)$")

  active <- baseline_date <- check_name <- data_collector <- error_message <- priority <- NULL
  record_id <- redcap_instrument <- results <- violation_count <- NULL
  # https://stackoverflow.com/questions/47242697/denormalize-coerce-list-with-nested-vectors-to-data-frame-in-r
  ds_rule_all <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    fill_column("active") |>
    fill_column("debug")

  rules <-
    ds_rule_all |>
    dplyr::filter(active) |>
    dplyr::select(
      -active
    )

  rules_inactive <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    dplyr::filter(!active) |>
    dplyr::select(
      -active
    )

  # The rule columns (in the yaml checks file) should be correct.
  checkmate::assert_subset(
    colnames(rules),
    c("check_name", "error_message", "priority", "debug", "redcap_instrument", "passing_test")
  )

  if (origin == "csv") {
    testit::assert(
      "The count of distinct rule columns (in the yaml checks file) should be 6, after removing `active`.",
      ncol(rules) == 6L
    )
  } else if (origin == "REDCap") {
    testit::assert(
      "The count of distinct rule columns (in the yaml checks file) should be 6, after removing `active`.",
      ncol(rules) == 6L
    )
  } else {
    stop("The value of `origin` is not recognized.")
  }

  # table(rules$check_name)
  # table(rules$error_message)
  # table(rules$passing_test)
  # which(is.na(rules$error_message))
  # OuhscMunge::verify_value_headstart(rules)
  checkmate::assert_character(rules$check_name    , any.missing = FALSE , pattern = "^.{4,99}$"  , unique = TRUE)
  checkmate::assert_character(rules$error_message , any.missing = FALSE , pattern = "^.{4,255}$" , unique = TRUE)
  checkmate::assert_integer(  rules$priority      , any.missing = FALSE , lower = 1, upper = 5    )
  checkmate::assert_logical(  rules$debug         , any.missing = FALSE                           )
  checkmate::assert_character(rules$passing_test  , any.missing = FALSE , pattern = "^.{5,}$"     , unique = TRUE)

  # if (origin == "REDCap") {
    checkmate::assert_character(rules$redcap_instrument, any.missing = FALSE , pattern = "^.{2,255}$"  )
  # }

  list(
    rules           = rules,
    rules_inactive  = rules_inactive
  )
}

fill_column <- function(.d, column_name) {
  if (column_name %in% colnames(.d)) {
    # Fill missing cells with TRUEs.
    .d[[column_name]]   <- dplyr::coalesce(.d[[column_name]], TRUE)
  } else {
    # If the column doesn't exist at all, create it and fill with TRUEs.
    .d[[column_name]]   <- TRUE
  }

  .d
}
