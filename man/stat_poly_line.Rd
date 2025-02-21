% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat-poly-line.R
\name{stat_poly_line}
\alias{stat_poly_line}
\title{Predicted line from linear model fit}
\usage{
stat_poly_line(
  mapping = NULL,
  data = NULL,
  geom = "smooth",
  position = "identity",
  ...,
  method = "lm",
  formula = NULL,
  se = TRUE,
  fm.values = FALSE,
  n = 80,
  fullrange = FALSE,
  level = 0.95,
  method.args = list(),
  na.rm = FALSE,
  orientation = NA,
  show.legend = NA,
  inherit.aes = TRUE
)
}
\arguments{
\item{mapping}{The aesthetic mapping, usually constructed with
\code{\link[ggplot2]{aes}}. Only needs to be
set at the layer level if you are overriding the plot defaults.}

\item{data}{A layer specific dataset, only needed if you want to override
the plot defaults.}

\item{geom}{The geometric object to use display the data}

\item{position}{The position adjustment to use for overlapping points on this
layer}

\item{...}{other arguments passed on to \code{\link[ggplot2]{layer}}. This
can include aesthetics whose values you want to set, not map. See
\code{\link[ggplot2]{layer}} for more details.}

\item{method}{function or character If character, "lm", "rlm" or the name of
a model fit function are accepted, possibly followed by the fit function's
\code{method} argument separated by a colon (e.g. \code{"rlm:M"}). If a
function different to \code{lm()}, it must accept arguments named
\code{formula}, \code{data}, \code{weights}, and \code{method} and return a
model fit object of class \code{lm}.}

\item{formula}{a formula object. Using aesthetic names \code{x} and \code{y}
instead of original variable names.}

\item{se}{Display confidence interval around smooth? (`TRUE` by default, see
`level` to control.)}

\item{fm.values}{logical Add R2, adjusted R2, p-value and n as columns to
returned data? (`FALSE` by default.)}

\item{n}{Number of points at which to evaluate smoother.}

\item{fullrange}{Should the fit span the full range of the plot, or just
the data?}

\item{level}{Level of confidence interval to use (0.95 by default).}

\item{method.args}{named list with additional arguments.}

\item{na.rm}{a logical indicating whether NA values should be stripped before
the computation proceeds.}

\item{orientation}{character Either "x" or "y" controlling the default for
\code{formula}.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped. \code{FALSE}
never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics, rather
than combining with them. This is most useful for helper functions that
define both data and aesthetics and shouldn't inherit behaviour from the
default plot specification, e.g. \code{\link[ggplot2]{borders}}.}
}
\value{
The value returned by the statistic is a data frame, that will have
  \code{n} rows of predicted values and their confidence limits. Optionally
  it will also include additional values related to the model fit.
}
\description{
Predicted values and a confidence band are computed and, by default, plotted.
}
\details{
This statistic is similar to \code{\link[ggplot2]{stat_smooth}} but has
different defaults. It interprets the argument passed to \code{formula}
differently, accepting \code{y} as explanatory variable and setting
\code{orientation} automatically. The default for \code{method} is
\code{"lm"} and spline-based smoothers like \code{loess} are not supported.
Other defaults are consistent with those in \code{stat_poly_eq()},
\code{stat_quant_line()}, \code{stat_quant_eq()}, \code{stat_ma_line()},
\code{stat_ma_eq()}.

\code{geom_poly_line()} treats the x and y aesthetics differently and can
thus have two orientations. The orientation can be deduced from the argument
passed to \code{formula}. Thus, \code{stat_poly_line()} will by default guess
which orientation the layer should have. If no argument is passed to
\code{formula}, the formula defaults to \code{y ~ x}. For consistency with
\code{\link[ggplot2]{stat_smooth}} orientation can be also specified directly
passing an argument to the \code{orientation} parameter, which can be either
\code{"x"} or \code{"y"}. The value of \code{orientation} gives the axis that
is taken as the explanatory variable or \code{x} in the model formula.
Package 'ggpmisc' does not define new geometries matching the new statistics
as they are not needed and conceptually transformations of \code{data} are
statistics in the grammar of graphics.
}
\section{Computed variables}{
 `stat_poly_line()` provides the following
  variables, some of which depend on the orientation: \describe{ \item{y *or*
  x}{predicted value} \item{ymin *or* xmin}{lower pointwise confidence
  interval around the mean} \item{ymax *or* xmax}{upper pointwise confidence
  interval around the mean} \item{se}{standard error} }

  If \code{fm.values = TRUE} is passed then columns based on the summary of
  the model fit are added, with the same value in each row within a group.
  This is wasteful and disabled by default, but provides a simple and robust
  approach to achieve effects like colouring or hiding of the model fit line
  based on P-values, r-squared, adjusted r-squared or the number of
  observations.
}

\section{Aesthetics}{
 \code{stat_poly_line} understands \code{x} and \code{y},
  to be referenced in the \code{formula} and \code{weight} passed as argument
  to parameter \code{weights}. All three must be mapped to \code{numeric}
  variables. In addition, the aesthetics understood by the geom
  (\code{"geom_smooth"} is the default) are understood and grouping
  respected.
}

\examples{
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  stat_poly_line()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  stat_poly_line(formula = x ~ y)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  stat_poly_line(formula = y ~ poly(x, 3))

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  stat_poly_line(formula = x ~ poly(y, 3))

# Smooths are automatically fit to each group (defined by categorical
# aesthetics or the group aesthetic) and for each facet.

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  stat_poly_line(se = FALSE)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  stat_poly_line() +
  facet_wrap(~drv)

# Inspecting the returned data using geom_debug()
gginnards.installed <- requireNamespace("gginnards", quietly = TRUE)

if (gginnards.installed)
  library(gginnards)

if (gginnards.installed)
  ggplot(mpg, aes(displ, hwy)) +
    stat_poly_line(geom = "debug")

if (gginnards.installed)
  ggplot(mpg, aes(displ, hwy)) +
    stat_poly_line(geom = "debug", fm.values = TRUE)

if (gginnards.installed)
  ggplot(mpg, aes(displ, hwy)) +
    stat_poly_line(geom = "debug", method = lm, fm.values = TRUE)

}
\seealso{
Other ggplot statistics for linear and polynomial regression: 
\code{\link{stat_poly_eq}()}
}
\concept{ggplot statistics for linear and polynomial regression}
