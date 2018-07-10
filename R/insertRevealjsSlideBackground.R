#' Insert slide background for revealjs::revealjs_presentation
#'
#' @return The selected line, appended with '{.data-background="teal"}'
#' @export
#'
#' @examples
insertRevealjsSlideBackground <- function() {
  insert_revealjs_property_text(
    content_to_insert = 'data-background="teal"',
    content_regex = 'data-background=".*?"'
  )
}
