#' @title Load and parse checks in a yaml file, and return a list
#' of useful objects.
#' @param path_checks The file path to the yaml file specifying the smells
#' and rules.  Required.
#' @examples
#' # Replace the path for your specific project
#' path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")
#' load_checks(path_checks)
#'
#' @export
load_checks <- function (path_checks) {
  checkmate::assert_file_exists(path_checks, extension = c("yml", "yaml"))

  checks <-
    yaml::read_yaml(
      file      = path_checks,
      eval.expr = FALSE
    )

  new_trawler_checks(checks)
}

new_trawler_checks <- function (checks) {
  checkmate::assert_list(checks, any.missing = FALSE, null.ok = FALSE)

  misc    <- load_misc(checks)
  smells_all  <- load_smells(checks)
  rules   <- load_rules(checks)

  structure(
    list(
      github_file_prefix  = misc$github_file_prefix,

      smells            = smells_all$smells,
      smells_inactive   = smells_all$smells_inactive,

      ds_rule             = rules$ds_rule,
      ds_rule_inactive    = rules$ds_rule_inactive
    ),
    class = "trawler_checks_definition"
  )
}

load_misc <- function (checks) {
  checkmate::assert_character(checks$github_file_prefix, min.chars = 10, len = 1, any.missing = FALSE)

  list(
    github_file_prefix     = checks$github_file_prefix
  )
}

#' @importFrom rlang .data
load_smells <- function (checks) {
  ds_smell_all <-
    checks$smells |>
    purrr::map_df(tibble::as_tibble) |>
    fill_column("active") |>
    fill_column("debug")

  smells <-
    ds_smell_all |>
    dplyr::filter(.data$active) |>
    dplyr::select(
      -.data$active
    )

  smells_inactive <-
    ds_smell_all |>
    dplyr::filter(!.data$active) |>
    dplyr::select(
      -.data$active
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
      boundaries            = sprintf(.data$bounds_template, .data$bound_lower, .data$bound_upper),
    )

  # table(smells$check_name)
  # OuhscMunge::verify_value_headstart(smells)
  checkmate::assert_character(smells$check_name      , any.missing = FALSE , pattern="^.{4,99}$"  , unique = TRUE)
  checkmate::assert_character(smells$description     , any.missing = FALSE , pattern="^.{4,255}$" , unique = TRUE)
  checkmate::assert_integer(  smells$priority        , any.missing = FALSE , lower=1, upper=5     )
  checkmate::assert_logical(  smells$debug           , any.missing = FALSE                        )
  checkmate::assert_numeric(  smells$bound_lower     , any.missing = FALSE                        )
  checkmate::assert_numeric(  smells$bound_upper     , any.missing = FALSE                        )
  checkmate::assert_character(smells$bounds_template , any.missing = FALSE , pattern="^.{2,255}$" )
  checkmate::assert_character(smells$value_template  , any.missing = FALSE , pattern="^.{2,255}$" )
  checkmate::assert_character(smells$equation        , any.missing = FALSE , pattern="^.{5,}$"    , unique = TRUE)
  checkmate::assert_character(smells$boundaries      , any.missing = FALSE , pattern="^.{6,}$"  )

  list(
    smells            = smells,
    smells_inactive   = smells_inactive
  )
}

#' @importFrom rlang .data
load_rules <- function (checks) {
    # https://stackoverflow.com/questions/47242697/denormalize-coerce-list-with-nested-vectors-to-data-frame-in-r
  ds_rule_all <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    fill_column("active") |>
    fill_column("debug")

  ds_rule <-
    ds_rule_all |>
    dplyr::filter(.data$active) |>
    dplyr::select(
      -.data$active
    )

  ds_rule_inactive <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    dplyr::filter(!.data$active) |>
    dplyr::select(
      -.data$active
    )

  # The rule columns (in the yaml checks file) should be correct.
  checkmate::assert_subset(
    colnames(ds_rule),
    c("check_name", "error_message", "priority", "debug", "instrument", "passing_test")
  )

  testit::assert(
    "The count of distinct rule columns (in the yaml checks file) should be 6, after removing `active`.",
    ncol(ds_rule) == 6L
  )

  # table(ds_rule$check_name)
  # table(ds_rule$error_message)
  # table(ds_rule$passing_test)
  # which(is.na(ds_rule$error_message))
  # OuhscMunge::verify_value_headstart(ds_rule)
  checkmate::assert_character(ds_rule$check_name    , any.missing = FALSE , pattern="^.{4,99}$"  , unique = TRUE)
  checkmate::assert_character(ds_rule$error_message , any.missing = FALSE , pattern="^.{4,255}$" , unique = TRUE)
  checkmate::assert_integer(  ds_rule$priority      , any.missing = FALSE , lower=1, upper=5      )
  checkmate::assert_logical(  ds_rule$debug         , any.missing = FALSE                         )
  checkmate::assert_character(ds_rule$instrument    , any.missing = FALSE , pattern="^.{2,255}$"  )
  checkmate::assert_character(ds_rule$passing_test  , any.missing = FALSE , pattern="^.{5,}$"     , unique = TRUE)

  list(
    ds_rule           = ds_rule,
    ds_rule_inactive  = ds_rule_inactive
  )
}

fill_column <- function (.d, column_name) {
  if (column_name %in% colnames(.d)) {
    # Fill missing cells with TRUEs.
    .d[[column_name]]   <- dplyr::coalesce(.d[[column_name]], TRUE)
  } else {
    # If the column doesn't exist at all, create it and fill with TRUEs.
    .d[[column_name]]   <- TRUE
  }

  .d
}
