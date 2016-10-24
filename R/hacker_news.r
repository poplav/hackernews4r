base_url <- "https://hacker-news.firebaseio.com/v0"

get_item_ids_for_stories<-function(filename,limit=10){
  fromJSON(paste(base_url, filename, sep=""))[1:limit]
}

#'
#' This function returns the top stories from hacker news
#'
#' @param type  The type of stories to get, defaults to top stories
#' @param limit  The top limit stories to return
#' @param pretty_print  If true return list of serialized stories else return the json structure
#' @export
#' @examples
#' get_stories()
#' get_stories(type = "top",limit = 10, pretty_print = TRUE)
#' @importFrom jsonlite fromJSON
get_stories <- function(type = "top",limit = 10, pretty_print = FALSE) {
  if(type=="top")
    filename="/topstories.json"
  else if(type=="new")
    filename="/newstories.json"
  else if(type=="ask")
    filename="/askstories.json"
  else
    filename="/showstories.json"
  stories <- lapply(get_item_ids_for_stories(filename,limit), function(id) {
    story_url <- paste(base_url, "/item/", id, ".json", sep="")
    fromJSON(story_url)
  })
  process_stories(stories, pretty_print)
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
