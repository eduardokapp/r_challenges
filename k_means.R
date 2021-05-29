#' @title This a simple (although pretty fast) implementation of the
#' k_means algorithm.
#' @description This implementation is mostly based on the algorithm's
#' description in Wikipedia.
#' @param data A data.frame. Note that all columns should be numeric. (data.frame)
#' @param k How many clusters should be in this dataset? (integer)
#' @param iters How many iterations? (integer)
#' @param return_centroids Should the centroids be returned with the
#' result? Default: True (logical)
#' @author Eduardo Kapp
#' @returns A list with the data labeled.
k_means <- function(data, k, iters, return_centroids = FALSE) {
  # k is the number of groups, thus, it is also the number of centroids
  # we'll initialize them as random points in data
  data <- as.matrix(data)
  dimnames(data) <- NULL
  start_idx <- sample(nrow(data), k, replace = FALSE)
  centroids <- as.matrix(data[start_idx, ])
  dimnames(centroids) <- NULL
  
  # Now we can actually run the iterations.
  # For every iteration, we'll label data by the following rule:
  # which centroid is the closest to this data point?
  labels <- rep(0, nrow(data))
  for (iter in seq_len(iters)) {
    
    # step 1: label data
    for (i in seq_len(nrow(data))) {
      # calculate distances between data[i, ] and the centroids
      dists <- vapply(
        seq_len(nrow(centroids)),
        function(j, b = data[i, ]) sqrt(sum((centroids[j, ] - b)^2))^2,
        numeric(1)
      )
      # Select the index of the lowest distance found. the index represents the
      # group that specific point belongs to.
      labels[i] <- which.min(dists)
    }
    
    # step 2:
    # update centroids with the mean of every point labeled as being part
    # of that centroid's group.
    for (i in seq_len(k)) {
      # select all data labeled as i
      idx <- labels == i
      if (!any(idx))
        next
      else
        centroids[i, ] <- colMeans(data[idx, ])
    }
  }
  if (return_centroids) {
    return(
      list(
        centroids = centroids,
        labels = labels
      )
    )
  }
  
  return(list(labels = labels))
}
