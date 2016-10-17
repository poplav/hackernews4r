base_url <- "https://hacker-news.firebaseio.com/v0"

get_item_ids_for_top_stories<-function(filename="/topstories.json",limit=10){
  fromJSON(paste(base_url, filename, sep=""))[1:limit]
}

get_item_ids_for_new_stories<-function(filename="/newstories.json",limit=10){
  `fromJSON(paste(base_url, filename, sep=""))[1:limit]
}

get_item_ids_for_ask_stories<-function(filename="/askstories.json",limit=10){
  `fromJSON(paste(base_url, filename, sep=""))[1:limit]
}

get_item_ids_for_show_stories<-function(filename="/showstories.json",limit=10){
  `fromJSON(paste(base_url, filename, sep=""))[1:limit]
}

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
  top_stories <- lapply(get_item_ids_for_top_stories(), function(id) {
    story_url <- paste(base_url, "/item/", id, ".json", sep="")
    fromJSON(story_url)
  })
  process_stories(top_stories, pretty_print)
}

get_new_stories <- function(limit = 10, pretty_print = FALSE) {
  new_stories <- lapply(get_item_ids_for_new_stories(), function(id) {
    story_url <- paste(base_url, "/item/", id, ".json", sep="")
    fromJSON(story_url)
  })
  process_stories(top_stories, pretty_print)
}

get_ask_stories <- function(limit = 10, pretty_print = FALSE) {
  ask_stories <- lapply(get_item_ids_for_ask_stories(), function(id) {
    story_url <- paste(base_url, "/item/", id, ".json", sep="")
    fromJSON(story_url)
  })
  process_stories(top_stories, pretty_print)
}

get_show_stories <- function(limit = 10, pretty_print = FALSE) {
  new_stories <- lapply(get_item_ids_for_show_stories(), function(id) {
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