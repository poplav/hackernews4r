context("test_get_stories")

test_that("get_stories", {
    stories <- get_stories(pretty_print=FALSE)
    expect_equal(10,length(stories))
})