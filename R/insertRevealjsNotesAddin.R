#' Insert slide notes for revealjs::revealjs_presentation
#'
#' @return The selected line, surrounded with '<aside class="notes">...</aside>'
#' @export
#'
#' @examples
insertRevealjsNotesAddin <- function() {
  wrap_rstudio_text(
    '\n\n<aside class="notes">\n',
    '\n</aside>\n',
    insert_if_blank_selection = ''
  )
}
