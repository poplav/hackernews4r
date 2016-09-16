context("test_get_top_stories")

test_that("get_top_stories", {
    top_stories <- get_top_stories(pretty_print=FALSE)
    expect_equal(10,length(top_stories))
})