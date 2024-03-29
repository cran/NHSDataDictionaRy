% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/openSafely_listR.R
\name{openSafely_listR}
\alias{openSafely_listR}
\title{openSafely_listR function}
\usage{
openSafely_listR(list_name, version = "", ...)
}
\arguments{
\item{list_name}{The code list ID from \url{https://www.opencodelists.org/} for which to return the National table of elements, for example
"opensafely/ace-inhibitor-medications"}

\item{version}{The version of the code list if not the most recent}

\item{...}{Function forwarding to parent function to pass additional arguments to function (e.g. title, add_zero_prefix)}
}
\value{
A tibble (class data.frame) output from the results of the web scrape
\itemize{
  \item type - the OpenSafely type
  \item id - the id for the OpenSafely element
  \item bnf_code - British National Formulary - NICE guidelines code
  \item nm - medicine type, dosage and manufacturer
  \item Dict_type - title specified for dictionary
  \item DttmExtracted - the date and time the code set was extracted
}
}
\description{
This function uses the \code{\link{tableR}} parent function to return a table of elements, specifically from the OpenSafely Code List
\url{https://www.opencodelists.org/}
}
\examples{
openSafely_listR("opensafely/ace-inhibitor-medications")
#Pull back current list
openSafely_listR("opensafely/ace-inhibitor-medications", "2020-05-19")
#Pull back list with date

}
