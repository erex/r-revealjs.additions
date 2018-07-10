#' Title
#'
#' @param html_element_to_seek
#' @param type_of_property
#' @param property_to_insert
#' @param property_to_seek
#'
#' @return
#' @export
#'
#' @examples
insert_revealjs_element_property_text <- function(
  html_element_to_seek = 'span',
  type_of_property = 'class',
  property_to_insert,
  property_to_seek = property_to_insert
) {
  library(glue)
  library(magrittr)
  library(stringr)

  document_context <- rstudioapi::getSourceEditorContext()

  selections <- document_context$selection

  for (selection in selections) {
    selection_range <- selection %>%
      magrittr::extract2('range')

    selection_text <- selection %>%
      magrittr::extract2('text')

    relevant_portion_of_selection <- stringr::str_match(
      selection_text,
      stringr::regex(
        glue::glue('<{html_element_to_seek}.*?>') %>% as.character()
      )
    )

    if (is.na(relevant_portion_of_selection)) {
      message(
        'A full opening <',
        html_element_to_seek,
        '> element was not selected; thus, we cannot add text...'
      )
    } else {

      if (
        !grepl(glue::glue('{type_of_property}='), relevant_portion_of_selection)
      ) {
        replacement_text <- stringr::str_replace(
          selection_text,
          relevant_portion_of_selection,
          stringr::str_replace(
            relevant_portion_of_selection,
            glue::glue('<{html_element_to_seek}'),
            glue::glue('<{html_element_to_seek} {type_of_property}="{property_to_insert}"')
          )
        )
      } else {
        if (
          !grepl(
            glue::glue('{type_of_property}=["\'].*?{property_to_seek}.*?["\']'),
            relevant_portion_of_selection
          )
        ) {
          replacement_text <- stringr::str_replace(
            selection_text,
            relevant_portion_of_selection,
            stringr::str_replace(
              relevant_portion_of_selection,
              glue::glue('<{html_element_to_seek} {type_of_property}=(["\'])'),
              glue::glue('<{html_element_to_seek} {type_of_property}=\\1{property_to_insert} ')
            )
          )
        } else {
          replacement_text <- selection_text
          message(
            html_element_to_seek,
            ' ',
            type_of_property,
            ' property already exists; no need to overwrite it...'
          )
        }
      }

      rstudioapi::insertText(
        location = selection_range,
        text = replacement_text
      )
    }
  }
}
