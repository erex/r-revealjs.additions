#' Title
#'
#' @param text_for_before
#' @param text_for_after
#' @param insert_if_blank_selection
#'
#' @return
#' @export
#'
#' @examples
wrap_rstudio_text <- function(
  text_for_before = "",
  text_for_after = "",
  insert_if_blank_selection = ""
) {
  library(magrittr)

  document_context <- rstudioapi::getSourceEditorContext()

  selections <- document_context$selection

  for (selection in selections) {
    selection_range <- selection %>%
      magrittr::extract2('range')

    selection_text <- selection %>%
      magrittr::extract2('text')

    rstudioapi::insertText(
      location = selection_range,
      text = paste0(
        text_for_before,
        if (!is.na(selection_text) && selection_text != '') {
          selection_text
        } else {
          insert_if_blank_selection
        },
        text_for_after
      )
    )
  }
}
