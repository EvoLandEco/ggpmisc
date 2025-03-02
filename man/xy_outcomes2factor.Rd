% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outcome2factor.R
\name{xy_outcomes2factor}
\alias{xy_outcomes2factor}
\alias{xy_thresholds2factor}
\title{Convert two numeric ternary outcomes into a factor}
\usage{
xy_outcomes2factor(x, y)

xy_thresholds2factor(x, y, x_threshold = 0, y_threshold = 0)
}
\arguments{
\item{x, y}{numeric vectors of -1, 0, and +1 values, indicating down
regulation, uncertain response or up-regulation, or numeric vectors that can be
converted into such values using a pair of thresholds.}

\item{x_threshold, y_threshold}{numeric vector Ranges enclosing the values to be considered
uncertain for each of the two vectors..}
}
\description{
Convert two numeric ternary outcomes into a factor
}
\details{
This function converts the numerically encoded values into a factor
  with the four levels \code{"xy"}, \code{"x"}, \code{"y"} and \code{"none"}.
  The factor created can be used for faceting or can be mapped to aesthetics.
}
\note{
This is an utility function that only saves some typing. The same
  result can be achieved by a direct call to \code{\link{factor}}. This
  function aims at making it easier to draw quadrant plots with facets
  based on the combined outcomes.
}
\examples{

xy_outcomes2factor(c(-1, 0, 0, 1, -1), c(0, 1, 0, 1, -1))
xy_thresholds2factor(c(-1, 0, 0, 1, -1), c(0, 1, 0, 1, -1))
xy_thresholds2factor(c(-1, 0, 0, 0.1, -5), c(0, 2, 0, 1, -1))

}
\seealso{
Other Functions for quadrant and volcano plots: 
\code{\link{FC_format}()},
\code{\link{outcome2factor}()},
\code{\link{scale_colour_outcome}()},
\code{\link{scale_shape_outcome}()},
\code{\link{scale_y_Pvalue}()}

Other scales for omics data: 
\code{\link{outcome2factor}()},
\code{\link{scale_colour_logFC}()},
\code{\link{scale_shape_outcome}()},
\code{\link{scale_x_logFC}()}
}
\concept{Functions for quadrant and volcano plots}
\concept{scales for omics data}
