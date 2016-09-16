# HackerNews API Client in R [![Build Status]][Travis]

[Build Status]: https://travis-ci.org/poplav/hackernews4r.svg?branch=master
[Travis]: https://travis-ci.org/poplav/hackernews4r

For detailed requirements and install instructions see [todo_update_installation_website](todo_update_installation_website)

## Requirements

* A current [R installation](http://www.r-project.org).

## Installation

We will soon submit the IRkernel package to CRAN. Until then, you can install it via the `devtools` package:

```R
install.packages(c('devtools'))
devtools::install_github('poplav/hackernews4r')
```

### If you encounter problems during installation

1. Have a look at the [full installation instructions](http://todo_update_installation_website)!
2. [Search the existing open and closed issues](https://github.com/poplav/hackernews4r/issues?utf8=%E2%9C%93&q=is%3Aissue).
3. If you are sure that this is a new problem, [file an issue](https://github.com/poplav/hackernews4r/issues/new).

## Running the hacker news client library

```R
library(hackernews4r)
# get top 10 stories and pretty print them to console
get_top_stories()
# get top 5 stories and return their original json structure
get_top_stories(limit = 5, pretty_print = FALSE)
# get story by id and pretty print them to console
get_story(12508356)
# get story by id and return their original json structure
get_story(12508356, pretty_print = FALSE)
```