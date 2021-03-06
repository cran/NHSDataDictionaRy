% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tableR.R
\name{tableR}
\alias{tableR}
\title{tableR function}
\usage{
tableR(url, xpath, title = "Not Specified", add_zero_prefix = FALSE, ...)
}
\arguments{
\item{url}{The URL of the website to scrape the table element from}

\item{xpath}{The unique xpath of the HTML element to be scraped}

\item{title}{Unique name for the relevant HTML table that has been scraped}

\item{add_zero_prefix}{Adds zero prefixes to certain codes that get converted by native functions}

\item{...}{Function forwarding to parent function to pass additional arguments to function}
}
\value{
A tibble (class data.frame) output from the results of the web scrape
\itemize{
  \item result - the extracted html table from url and xpath passed
  \item DictType - defaults to Not Specified if nothing passed, however allows for custom dictionary / data frame tags to be created
  \item DttmExtracted - a date and time stamp
}
}
\description{
This function uses the scapeR parent function to return a table of elements
}
