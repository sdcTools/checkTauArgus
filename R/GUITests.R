#' GUITests
#'
#' shows a document specifiying tests for the graphical user interface of tau-argus.
#'
#' @return a browser containing the document will be opened.
#' @export
#'
#' @examples
#' \dontrun{
#' GUITests()
#' }
GUITests <- function() {
  browseURL(paste0(system.file(package="checkArgus"),"/doc/GUItests.html"))
}
