#' Insert slide transition for revealjs::revealjs_presentation
#'
#' @return The selected line, appended with '{.data-transition="zoom"}'
#' @export
#'
#' @examples
insertRevealjsSlideTransition <- function() {
  insert_revealjs_property_text(
    content_to_insert = 'data-transition="zoom"',
    content_regex = 'data-transition=".*?"'
  )
}
