#' Inverse boxcox transformation of a vector/number
#'
#' Transforms via the Box-Cox transform.
#'
#' @param x The vector to be inverse boxcoxed. Default is 1.
#' @param lambda The parameter of Box–Cox transformation. Default is 1.
#'
#' @return A vector/number that is the inverse boxcox transformation of \code{x}.
#'
#' @details
#' We only do the boxcox transformations that only requires one input.
#'
#' @examples
#' boxcox.inv(1:10, 2)
#' boxcox.inv(2, 0)
#' @export
boxcox.inv <- function(x = 1, lambda = 1) 1/boxcox(x, lambda)

