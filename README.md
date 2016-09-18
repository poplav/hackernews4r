# HackerNews API Client in R [![Build Status]][Travis]

[Build Status]: https://travis-ci.org/poplav/hackernews4r.svg?branch=master
[Travis]: https://travis-ci.org/poplav/hackernews4r

## Requirements

* A current [R installation](http://www.r-project.org).

## Installation

We will soon submit the hackernews4r package to CRAN. Until then, you can install it via the `devtools` package:

```R
install.packages(c('devtools'))
devtools::install_github('poplav/hackernews4r')
```

### If you encounter problems during installation/usage

1. [Search the existing open and closed issues](https://github.com/poplav/hackernews4r/issues?utf8=%E2%9C%93&q=is%3Aissue).
2. If you are sure that this is a new problem, [file an issue](https://github.com/poplav/hackernews4r/issues/new).

## Running the hacker news client library

```R
library(hackernews4r)
# get top 10 stories and return their original json structure
get_top_stories()
# get top 5 stories and pretty print them to console
get_top_stories(limit = 5, pretty_print = TRUE)
# get story by id and return their original json structure
get_story(12508356)
# get story by id and pretty print them to console
get_story(12508356, pretty_print = TRUE)
```