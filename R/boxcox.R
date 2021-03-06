#' Boxcox transformation of a vector/number
#'
#' Transforms via the Box-Cox transform.
#'
#' @param x The vector to be boxcoxed boxcoxed. Default is 1.
#' @param lambda The parameter of Box–Cox transformation. Default is 1.
#'
#' @return A vector/number that is the boxcox boxcox transformation of \code{x}.
#'
#' @details
#' We only do the boxcox transformations that only requires one input.
#'
#' @examples
#' boxcox(1:10, 2)
#' boxcox(2, 0)
#' @export
boxcox <- function(x = 1, lambda = 1){
	if(lambda == 0){
		if(length(x[x > 0]) != length(x)){
			stop('Please input positive number!\n')
		}else{
			res = log(x)
		}
	}else{
		res = (x^lambda - 1)/lambda
	}
	return(res)
}


