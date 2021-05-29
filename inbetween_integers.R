#' @title Find out all integers between A and B
#' @description This is a simple implementation of an
#' algorithm that returns every integer between two
#' values a and b. For example, if you input a = 7.3
#' and b = 12.8, the return should be [8, 9, 10, 11, 12],
#' because a and b will be rounded.
#' @param a A numeric value (numeric).
#' @param b A numeric value (numeric)
#' @author Eduardo Kapp
inbetween_integers <- function(a, b) {
  a <- round(a)
  b <- round(b)
  if (abs(a - b) <= 1)
    return(NULL)
  if (b < a)
    return(seq.int(from = b + 1, length.out = abs(a - b) - 1))
  return(seq.int(from = a + 1, length.out = abs(a - b) - 1))
}