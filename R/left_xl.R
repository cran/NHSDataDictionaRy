
#' left_xl function
#' This function replicates the LEFT function in Excel and is utilised for left trimming
#' of character strings
#'
#' @param text The text you want to LEFT trim
#' @param num_char The number of characters your want to trim by
#' @return
#' @export
#' @return Trims the text entered by the number of character parameter and returns the trimmed string
#' @examples
#' left_xl(text= "This is some example text", num_char = 4)
#'
left_xl <- function(text, num_char=0) {
  if (num_char ==0){
    stop("Please enter the number of characters to left trim the text by.")
  }
  substr(text, 1, num_char)
}


