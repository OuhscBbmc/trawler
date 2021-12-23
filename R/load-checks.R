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

    checks <- config::get(file = path_checks)

    smells <- load_smells(checks)
    rules  <- load_rules(checks)

    list(
      ds_smell            = smells$ds_smell,
      ds_smell_inactive   = smells$ds_smell_inactive,
      ds_rule             = rules$ds_rule,
      ds_rule_inactive    = rules$ds_rule_inactive
    )
}

#' @importFrom rlang .data
load_smells <- function (checks) {

    ds_smell <-
      checks$smells |>
      purrr::map_df(tibble::as_tibble) |>
      dplyr::filter(.data$smell_active) |>
      dplyr::mutate(
        debug         = dplyr::coalesce(.data$debug, FALSE),
      )

    ds_smell_inactive <-
      checks$smells |>
      purrr::map_df(tibble::as_tibble) |>
      dplyr::filter(!.data$smell_active)

    testit::assert("The count of distinct rule columns (in the yaml checks file) should be 10.", ncol(ds_smell) == 10L)
    testit::assert( # dput(colnames(ds_smell))
      "The smell columns (in the yaml checks file) should be correct.",
      colnames(ds_smell) == c("check_name", "description", "priority", "smell_active", "debug", "bound_lower", "bound_upper", "bounds_template", "value_template", "equation")
    )

    ds_smell <-
      ds_smell |>
      dplyr::mutate(
        boundaries            = sprintf(.data$bounds_template, .data$bound_lower, .data$bound_upper),
      )
    # table(ds_smell$check_name)
    # OuhscMunge::verify_value_headstart(ds_smell)
    checkmate::assert_character(ds_smell$check_name      , any.missing=F , pattern="^.{4,99}$"  , unique=T)
    checkmate::assert_character(ds_smell$description     , any.missing=F , pattern="^.{4,255}$" , unique=T)
    checkmate::assert_integer(  ds_smell$priority        , any.missing=F , lower=1, upper=5     )
    checkmate::assert_logical(  ds_smell$smell_active    , any.missing=F                        )
    checkmate::assert_logical(  ds_smell$debug           , any.missing=F                        )
    checkmate::assert_numeric(  ds_smell$bound_lower     , any.missing=F                        )
    checkmate::assert_numeric(  ds_smell$bound_upper     , any.missing=F                        )
    checkmate::assert_character(ds_smell$bounds_template , any.missing=F , pattern="^.{2,255}$" )
    checkmate::assert_character(ds_smell$value_template  , any.missing=F , pattern="^.{2,255}$" )
    checkmate::assert_character(ds_smell$equation        , any.missing=F , pattern="^.{5,}$"    , unique=T)
    checkmate::assert_character(ds_smell$boundaries      , any.missing=F , pattern="^.{6,}$"  )

    list(
      ds_smell            = ds_smell,
      ds_smell_inactive   = ds_smell_inactive
    )
}

#' @importFrom rlang .data
load_rules <- function (checks) {
    # https://stackoverflow.com/questions/47242697/denormalize-coerce-list-with-nested-vectors-to-data-frame-in-r
  ds_rule <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    # dplyr::rename(check_name = name) |>
    dplyr::filter(.data$test_active) |>
    dplyr::mutate(
      debug         = dplyr::coalesce(.data$debug, FALSE),
    )

  ds_rule_inactive <-
    checks$rules |>
    purrr::map_df(tibble::as_tibble) |>
    dplyr::filter(!.data$test_active)

  #testit::assert("The count of distinct rule columns (in the yaml checks file) should be 7.", ncol(ds_rule) == 10L)
  testit::assert( # dput(colnames(ds_rule))
    "The rule columns (in the yaml checks file) should be correct.",
    colnames(ds_rule) == c("check_name", "error_message", "priority", "test_active", "debug", "instrument", "passing_test")
  )
  # table(ds_rule$check_name)
  # table(ds_rule$error_message)
  # table(ds_rule$passing_test)
  # which(is.na(ds_rule$error_message))
  # OuhscMunge::verify_value_headstart(ds_rule)
  checkmate::assert_character(ds_rule$check_name    , any.missing=F , pattern="^.{4,99}$"  , unique=T)
  checkmate::assert_character(ds_rule$error_message , any.missing=F , pattern="^.{4,255}$" , unique=T)
  checkmate::assert_integer(  ds_rule$priority      , any.missing=F , lower=1, upper=5      )
  checkmate::assert_logical(  ds_rule$test_active   , any.missing=F                         )
  checkmate::assert_logical(  ds_rule$debug         , any.missing=F                         )
  checkmate::assert_character(ds_rule$instrument    , any.missing=F , pattern="^.{2,255}$"  )
  checkmate::assert_character(ds_rule$passing_test  , any.missing=F , pattern="^.{5,}$"     , unique=T)

  list(
    ds_rule           = ds_rule,
    ds_rule_inactive  = ds_rule_inactive
  )
}
