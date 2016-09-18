base_url <- "https://hacker-news.firebaseio.com/v0"

#' get_top_stories
#'
#' This function returns the top stories from hacker news
#'
#' @param limit  The top limit stories to return
#' @param pretty_print  If true return list of serialized stories else return the json structure
#' @export
#' @examples
#' get_top_stories()
#' get_top_stories(limit = 5, pretty_print = TRUE)
#' @importFrom jsonlite fromJSON
get_top_stories <- function(limit = 10, pretty_print = FALSE) {
    top_stories_ids <- fromJSON(paste(base_url, "/topstories.json", sep=""))
    top_stories_ids <- top_stories_ids[1:limit]
    top_stories <- lapply(top_stories_ids, function(id) {
        story_url <- paste(base_url, "/item/", id, ".json", sep="")
        fromJSON(story_url)
    })
    process_stories(top_stories, pretty_print)
}

#' get_story
#'
#' This function returns the story given it's story id
#'
#' @param id  The id of the story to query
#' @param pretty_print  If true return list of serialized stories else return the json structure
#' @export
#' @examples
#' get_story(12508356)
#' get_story(12508356, pretty_print = TRUE)
#' @importFrom jsonlite fromJSON
get_story <- function(id, pretty_print = FALSE) {
    story <- {
        story_url <- paste(base_url, "/item/", id, ".json", sep="")
        fromJSON(story_url)
    }
    process_stories(list(story), pretty_print)
}

#' process_stories
#'
#' This function processes the stories by either returning the serialized stories or original json structure
#'
#' @param stories  The hacker news stories to process
#' @param pretty_print  If true return list of serialized stories else return the json structure
process_stories <- function(stories, pretty_print) {
    if(pretty_print) {
        lapply(stories, function (story) {
            serialize_story(story)
        })
    } else {
        stories
    }
}

#' serialize_story
#'
#' This function is responsible for serializing the story to a string
#'
#' @param story  The story to serialize
serialize_story <- function(story) {
    paste("*", story$title, "-", story$url)
}