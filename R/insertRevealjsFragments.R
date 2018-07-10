#' Insert a fragment in a revealjs::revealjs_presentation
#'
#' @return The selected line, surrounded with '<span class="fragment">...</span>'
#' @export
#'
#' @examples
insertRevealjsFragment <- function() {
  wrap_rstudio_text(
    '<span class="fragment">',
    '</span>'
  )
}

#' Insert a fragment with highlighting in a revealjs::revealjs_presentation
#'
#' @return Add 'class="fragment highlight-red"' to a <span>
#' @export
#'
#' @examples
insertRevealjsFragmentWithHighlight <- function() {
  insert_revealjs_element_property_text(
    html_element_to_seek = 'span',
    type_of_property = 'class',
    property_to_seek = 'highlight-(red|blue|green)',
    property_to_insert = 'highlight-red'
  )
}

#' Insert a fragment index in a revealjs::revealjs_presentation
#'
#' @return Add 'class="fragment highlight-red"' to a <span>
#' @export
#'
#' @examples
insertRevealjsFragmentIndex <- function() {
  insert_revealjs_element_property_text(
    html_element_to_seek = 'span',
    type_of_property = 'data-fragment-index',
    property_to_seek = '[0-9]',
    property_to_insert = '1'
  )
}
