% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/things-properties-timeseries.R
\name{things_properties_timeseries}
\alias{things_properties_timeseries}
\title{Data from Properties (of things) API methods}
\usage{
things_properties_timeseries(
  thing_id,
  property_id,
  from = NULL,
  to = NULL,
  interval = NULL,
  desc = NULL,
  store_token = "option",
  token = NULL,
  silent = FALSE
)
}
\arguments{
\item{thing_id}{The id of the thing}

\item{property_id}{The id of the property}

\item{from}{A \code{Posixct} or \code{Date} object.
Get data with a timestamp >= to this value (default: 2 weeks ago, min: 1842-01-01, max: 2242-01-01)}

\item{to}{A \code{Posixct} or \code{Date} object.
Get data with a timestamp < to this value (default: now, min: 1842-01-01, max: 2242-01-01)}

\item{interval}{(numeric) Binning interval in seconds
(default: the smallest possible value compatibly with the limit of 1000 data points in the response)}

\item{desc}{(logic) Whether data ordering (by time) should be descending. Default TO \code{FALSE}}

\item{store_token}{Where your token is stored. If \code{option} it will be retrieved from the .Rprofile (not cross-session and default),
if \code{envir} it will be retrieved from environmental variables list (cross-session)}

\item{token}{A valid token created with \code{create_auth_token} or manually.
It not \code{NULL} it has higher priority then \code{store_token}}

\item{silent}{Whether to hide or show API method success messages (default \code{FALSE})}
}
\value{
A tibble showing of time and value for property of given device
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

Get numerical property's historic data binned on a specified time interval
(note: the total number of data points should NOT be greater than 1000 otherwise the result will be truncated)

Official documentation:
\href{https://www.arduino.cc/reference/en/iot/api/#api-PropertiesV2-propertiesV2Timeseries}{propertiesV2Timeseries}
}
\examples{
\dontrun{
# Sys.setenv(ARDUINO_API_CLIENT_ID = 'INSERT CLIENT_ID HERE')
# Sys.setenv(ARDUINO_API_CLIENT_SECRET = 'INSERT CLIENT_SECRET HERE')
create_auth_token()

thing_id = "b6822400-2f35-4d93-b3e7-be919bdc5eba"
property_id = "d1134fe1-6519-49f1-afd8-7fe9e891e778"

things_properties_timeseries(thing_id = thing_id, property_id = property_id,
desc = FALSE, interval = 60, from = "2022-08-20")
}
}
