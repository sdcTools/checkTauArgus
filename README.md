# checkTauArgus

This package contains test-scenarios for tauArgus which will be run directly using batch-files. Also the generation of valid batch-files using R-package sdcTable can be tested.

## Automated tests
The main function to perform (subsets) of pre-defined tests is `checkArgus()`, which requires the following parameters to be set:

- `tau_exe`: a valid path to a tau-argus executable, e.g `c://tauargus/TauArgus.exe`
- `what`: a character vector defining which test-sets should be run. If this parameter equals `everything`, all tests are run. To find out, which testsets can be specified, the auxiliary function `availableTests()` may be used.
- `verbose`: if `TRUE`, the verbosity-level while testing is increased, defaults to `FALSE`

## Tests for the graphical user interface
Several test-instances have been set up which allow to test the functionality of the graphical user interface of tau-argus. To view the pre-defined tests, use function `GUITests()` which will open a browser tab.

