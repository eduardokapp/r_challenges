#' @title String character sorter by frequency
#' @description Given a string, for example, 'tweet',
#' the output will be the string but with its characters
#' sorted by frequency. For example, given the string 'tweet',
#' return 'tteew'. 'eettw' would also be acceptable.
#' @param some_word A string. (character)
#' @author Eduardo Kapp
sort_chars_by_freq <- function(some_word) {
  # Break string into individual characters
  split_w <- unlist(strsplit(some_word, split = ""))
  # Table the values
  char_table <- table(split_w)
  # Order the characters by frequency in decreasing order
  chars <- names(char_table[order(char_table, decreasing = TRUE)])
  # Reduce paste considering each frequency value
  output <- sapply(chars, function(x) {
    if (char_table[x] > 1)
      return(Reduce(paste0, rep(x, char_table[x])))
    else
      return(x)
  })
  # Reduce paste the final output
  return(Reduce(paste0, output))
}