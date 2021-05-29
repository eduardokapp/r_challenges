#' @title Is it a Toeplitz Matrix?
#' @description This algorithm determines whether or not a matrix
#' is a toeplitz matrix. A toeplitz matrix is a matrix in which
#' each descending diagonal from left to right is constant.
#' @param a A matrix. (matrix / data.frame) You can easily
#' generate toeplitz matrixes by using stats::toeplitz()
#' @returns A logical value indicating TRUE if the matrix
#' is toeplitz.
toeplitz_solver <- function(a) {
    # re-order a backwards, because we need to check diagonals from top-left
    # to bottom right. if we don't reorder, we'll end up with top-right to
    # bottom-left.
    a <- a[,ncol(a):1]

    # get all i and j (coordinates for every element)
    i <- 1:nrow(a)
    j <- 1:ncol(a)

    # get all combinations of i and j
    diags <- expand.grid(i, j)

    # the coordinates for the diagonals are the ones where
    # the sum is the same, e.g.: (3,2), (4,1), (2,3), (1,4)
    sums <- apply(diags, 1, sum)
    indexes <- lapply(unique(sums), function(x) {
        diags[which(sums  == x), ]
    })

    # indexes is now a list where every element is a list of coordinates
    # the first element is a list for every coordinates for the first diag
    # so on and so forth
    results <- sapply(indexes, function(x) {
        x <- as.data.frame(x)
        # for every diagonal, we'll check if all the elements are the same
        checks <- apply(x, MARGIN = 1, function(y) {
            y <- as.numeric(y)
            val <- a[y[1], y[2]]
            return(val)
        })
        checks <- as.numeric(checks)
        return(all(checks == checks[1]))
    })
    # if every diagonal meets the condition, it is safe to assume that the
    # input matrix is in fact toeplitz.
    return(all(results))
}
