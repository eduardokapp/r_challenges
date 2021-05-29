#' @title Find out if any two elements sum to k in array
#' @description This is an efficient implementation in R
#' to solve a classic problem: Given an array with N elements,
#' find out if any two elements in the array sum up to a
#' value 'k'.
#' @param x A numeric array (numeric)
#' @param k A target value that the sum of any two elements
#' should be equal to. (numeric)
#' @author Eduardo Kapp
#' @returns A logical flag indicating if the condition is met.
any_two_elements <- function(x, k) {
  # The idea here is:
  # If there are any two values 'a' and 'b' that sum up to 'k'
  # ('a' + 'b' = 'k'), then we can assume that 'k' - 'a' = 'b'.
  # and 'k' - 'b' = 'a'. So if we simply take the whole 'x'
  # array and do 'x' - 'k', the only original elements in 'x'
  # that will remain are the ones that when summed are equal to 'k'.
  # That of course, only happens when the condition is met.
  # So we simply test this idea out and return the logical value.
  return(any(x %in% (k - x)))
}