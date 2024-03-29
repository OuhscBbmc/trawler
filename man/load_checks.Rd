% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load-checks.R
\name{load_checks}
\alias{load_checks}
\title{Load and parse checks in a yaml file, and return a list
of useful objects.}
\usage{
load_checks(path_checks, origin)
}
\arguments{
\item{path_checks}{The file path to the yaml file specifying the smells
and rules.  Required.}

\item{origin}{The origin of the dataset.
Currently supports "csv" and "REDCap". Required.}
}
\description{
Load and parse checks in a yaml file, and return a list
of useful objects.
}
\examples{
# Step 0: define paths.
#   So this package example executes on every machine, temp files are used.

# Replace the two paths for your specific project
path_checks  <- system.file("checks/checks-biochemical.yml", package = "trawler")

# Step 1: load the check definitions and the dataset to test
load_checks(path_checks, origin = "REDCap")

}
