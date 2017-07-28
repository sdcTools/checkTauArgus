#' availableTests
#'
#' checks which test-scenarios are defined. The keywords returned here can be used as inputs to \code{\link{checkArgus}}.
#'
#' @return a character vector of available tests that can be used as input in \code{\link{checkArgus}}
#' @export
#'
#' @examples
#' \dontrun{
#' avail <- availableTests()
#' checkArgus(tau_exe="c:/tau/tau.exe", what=avail[1])
#' }
availableTests <- function() {
  list.dirs(paste0(system.file(package="checkArgus"),"/tests"), full.names=FALSE, recursive=FALSE)
}
