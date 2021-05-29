#' @title Convert a bnlearn arcs matrix to numeric
#' @description This function takes a from --> to character matrix and converts
#' it to a numeric matrix. Specifically, break it into two matrix objects:
#' An association matrix (ones indicate presence of associations, zeros
#' indicate there is no association) and a causation matrix
#' if (causation_matrix[a,b] is 1, then A causes B, if it's -1, then B causes
#' A, and if it is 0, then there is no causation.). Note that the result is
#' always ordered according to the variable names (alphabetically).
#' @param arcs A bnlearn arcs character matrix (character matrix)
#' @param vars Variable names from the dataset used to generate arcs.
#' @author Eduardo Kapp
#' @returns A list with causation and association matrix objects and a
#' character vector indicating the alphabetical order of variable names.
arcs_to_numbers <- function(arcs, vars) {
  vars <- vars[order(vars)]
  associations <- matrix(
    data = 0,
    nrow = length(vars),
    ncol = length(vars)
  )
  causations <- associations
  
  for (var in vars) {
    if (!var %in% arcs) {
      next
    } else {
      for (other_var in vars) {
        if (var == other_var) {
          next
        }
        ida <- which(vars == var)
        idb <- which(vars == other_var)
        a_to_b <- any(arcs[,1] == var & arcs[,2] == other_var)
        b_to_a <- any(arcs[,2] == var & arcs[,1] == other_var)
        if (a_to_b || b_to_a) {
          associations[ida, idb] <- 1
        } else {
          next
        }
        
        if (a_to_b && b_to_a) {
          next
        } else {
          if (a_to_b)
            causations[ida, idb] <- 1
          else
            causations[ida, idb] <- -1
        }
      }
    }
  }
  output <- list(
    associations = associations,
    causations = causations,
    var_names = vars
  )
  return (output)
}
