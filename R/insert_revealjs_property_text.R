#' Title
#'
#' @param content_to_insert
#' @param content_regex
#'
#' @return
#' @export
#'
#' @examples
insert_revealjs_property_text <- function(content_to_insert, content_regex = content_to_insert) {
  library(magrittr)
  library(stringr)

  document_context <- rstudioapi::getActiveDocumentContext()

  selection_rows <- document_context$selection %>%
    magrittr::extract2(1) %>%
    magrittr::extract2('range') %>%
    magrittr::extract2('start') %>%
    magrittr::extract2(1) %>%
    as.numeric()

  for (row_number in selection_rows) {
    row_contents <- document_context$contents[row_number]
    # message('Row contents are "', row_contents, '"...')

    row_data_regex <- '\\{(.*?)\\}(\\s*)$'

    matching_portion <- stringr::str_match(
      row_contents,
      stringr::regex(row_data_regex)
    ) %>%
      magrittr::extract(1)
    # message('Matching portion is "', matching_portion, '"...')

    if (
      !is.na(matching_portion) &
      matching_portion != ''
    ) {
      if (
        !grepl(
          paste0(
            '\\{.*?',
            content_regex,
            '.*?\\}\\s*$'
          ),
          matching_portion
        )
      ) {
        new_row_contents <- stringr::str_replace(
          row_contents,
          stringr::regex(row_data_regex),
          paste0(
            '{',
            content_to_insert,
            ' \\1}\\2'
          )
        )
      } else {
        new_row_contents <- row_contents
        message('No need to insert the "', content_to_insert, '" text...')
      }
    } else {
      new_row_contents <- stringr::str_replace(
        row_contents,
        stringr::regex('\\s*$'),
        paste0(
          ' {',
          content_to_insert,
          '}'
        )
      )
    }

    # message('New row contents are "', new_row_contents, '"...')

    rstudioapi::modifyRange(
      c(row_number, '1', row_number, nchar(row_contents) + 1) %>%
        as.integer() %>%
        list(),
      new_row_contents
    )
  }
}
