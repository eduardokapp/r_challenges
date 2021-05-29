# Overview
This repository is a collection of some algorithms and/or interesting problems I've implemented/solved using the R language. It is mostly about recording my own progress over time.

Note that I try to keep things simple here (so that I can keep different topics together), so most implementations or problems are a one-script only. For bigger projects, I'll probably create a separate repository.

Since the repository is primarily for my own use, I am not accepting any contributions
at this time. However, feel free to fork the project and use any of the scripts here
implemented any way you want.

# Requirements
I try to use base R for the most part. But I'll document any packages used
if necessary. Look for the `@importFrom pkg function` tags in the scripts
documentation.

This should cover you for the most part:

* R v4.0.0
* dplyr
* lubridate

# Scripts available, so far:
If you don't know where to go first, read this.

## Machine Learning
- An implementation of the K Means algorithm. (`k_means.R`).

## Computer Science / Algebra
- A program that finds out whether or not a matrix is a toeplitz matrix. (`toeplitz_solver.R`).
- Routine that determines all integers between two real values A and B.
(`inbetween_integers.R`).
- A program that finds out if any two elements in an array sum up to a
predefined value `k` (`any_two_elements.R`).
- Implementation of a string character sorter by frequency (`sort_chars_by_freq.R`).

## Causal Inference / Causal Discovery
- A parser for the `bnlearn` package output. (`arcs_to_numbers.R`).