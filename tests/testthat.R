#Note file extensions must by capital .R for R CMD check to pick up the tests

library(testthat)
library(hackernews4r)

test_check("hackernews4r")