% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boxcox.R
\name{boxcox}
\alias{boxcox}
\title{Boxcox transformation of a vector/number}
\usage{
boxcox(x = 1, lambda = 1)
}
\arguments{
\item{x}{The vector to be boxcoxed boxcoxed. Default is 1.}

\item{lambda}{The parameter of Box–Cox transformation. Default is 1.}
}
\value{
A vector/number that is the boxcox boxcox transformation of \code{x}.
}
\description{
Transforms via the Box-Cox transform.
}
\details{
We only do the boxcox transformations that only requires one input.
}
\examples{
boxcox(1:10, 2)
boxcox(2, 0)
}
