#' checkArgus
#'
#' Allows to run (subsets) of pre-defined tests and checks
#'
#' @param tau_exe path to tau-argus executable
#' @param what which find of tests should be run? Valid choices are either \code{'everything'} (in which case all defined test-instances will run)
#' or outputs of \code{\link{availableTests}}.
#' @param verbose (logical) if \code{TRUE}, additional information (runtime,...) about the tests is written to the prompt
#' @return an error if any of the test fails, \code{TRUE} else
#' @export
#' @author Bernhard Meindl <bernhard.meindl@statistik.gv.at>
#' @examples
#' \dontrun{
#' checkArgus(tau_exe="c:/tau/tau.exe", what="everything")
#' checkArgus(tau_exe="c:/tau/tau.exe", what=availableTests()[1])
#' }
checkArgus <- function(tau_exe, what="everything", verbose=FALSE) {
  if (!file.exists(tau_exe)) {
    stop("no file found at",dQuote(tau_exe),"\n")
  }

  checkenv <- test_env()
  assign("tau_exe", tau_exe, envir=checkenv)

  if (!is.character(what)) {
    stop("Argument 'what' needs to be a character vector!\n")
  }

  possTests <- availableTests()
  if (what=="everything") {
    what <- possTests
  } else {
    if (!all(what %in% possTests)) {
      stop("invalid test-scenarios specified in argument 'what'!\n")
    }
  }

  runTests <- paste0(system.file(package="checkArgus"),"/tests/",what)
  nrTests <- length(runTests)
  for (i in 1:nrTests) {
    cat("running Test-Module", sQuote(what[i]),"\n")
    if (verbose) {
      print(test_dir(runTests[i], reporter="tap", env=checkenv))
    } else {
      test_dir(runTests[i], reporter="tap", env=checkenv)
    }
    cat("\n#######################\n")
  }
  invisible(TRUE)
}
