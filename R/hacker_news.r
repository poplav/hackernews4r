#' get_top_stories
#'
#' This function returns the top stories from hacker news
#'
#' @param limit  The top limit stories to return
#' @param pretty_print  If true print to the terminal and return NULL else return the json structure
#' @export
#' @examples
#' get_top_stories()
#' get_top_stories(limit = 5, pretty_print = FALSE)
#' @importFrom jsonlite fromJSON
get_top_stories <- function(limit = 10, pretty_print = TRUE) {
    top_stories_ids <- fromJSON("https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")
    top_stories_ids <- top_stories_ids[1:limit]
    top_stories <- lapply(top_stories_ids, function(id) {
        story_url <- paste("https://hacker-news.firebaseio.com/v0/item/", id, ".json?print=pretty", sep="")
        fromJSON(story_url)
    })
    process_stories(top_stories, pretty_print)
}

#' get_story
#'
#' This function returns the story given it's story id
#'
#' @param id  The id of the story to query
#' @param pretty_print  If true print to the terminal and return NULL else return the json structure
#' @export
#' @examples
#' get_story(12508356)
#' get_story(12508356, pretty_print = FALSE)
#' @importFrom jsonlite fromJSON
get_story <- function(id, pretty_print = TRUE) {
    story <- {
        story_url <- paste("https://hacker-news.firebaseio.com/v0/item/", id, ".json?print=pretty", sep="")
        fromJSON(story_url)
    }
    process_stories(list(story), pretty_print)
}

#' process_stories
#'
#' This function processes the stories by either pretty_printing or simply returning them
#'
#' @param stories  The hacker news stories to process
#' @param pretty_print  If true print to the terminal and return NULL else return the json structure
process_stories <- function(stories, pretty_print) {
    if(pretty_print) {
        lapply(stories, function (story) {
            cat(paste("*", story$title, "-", story$url), "\n")
        })
        return ()
    } else {
        stories
    }
}