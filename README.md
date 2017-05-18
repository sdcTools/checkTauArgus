# checkTauArgus

This package contains test-scenarios for tauArgus which will be run directly using batch-files. Also the generation of valid batch-files using **R**-package **sdcTable** (>= 0.22.6) can be tested.

## Installation
This package is not on CRAN and needs to be installed manually. The easiest way to do so is to run the following command from R:

```
devtools::install_github("sdcTools/checkTauArgus", build_vignettes=TRUE)
```

## Testing tau-Argus

### Run pre-defined tests
The main function to perform (subsets) of pre-defined tests is `checkArgus()`, which requires the following parameters to be set:

- `tau_exe`: a valid path to a tau-argus executable, e.g `c:\\tauargus\\TauArgus.exe`
- `what`: a character vector defining which test-sets should be run. If this parameter equals `everything`, all tests are run. To find out, which testsets can be specified, the auxiliary function `availableTests()` may be used.
- `verbose`: if `TRUE`, the verbosity-level while testing is increased, defaults to `FALSE`

### Tests for the graphical user interface
Several test-instances have been set up which allow to test the functionality of the graphical user interface of tau-argus. To view the pre-defined tests, use function `GUITests()` which will open a browser tab showing the pre-defined UI-tests.

## Adding Tests
### Pre-defined tests
To add tests that can be run using `checkArgus()`, please file a pull-request against the master-branch of this repository. A new set of tests can be made by creating a new folder under the `inst/tests` directory. The examples in the `Batch` and `CreateBatch` directories may used as starting points. Using the `testthat`-package, a lot of `expect_xx()`-functions may be used to formulate expectations on the output. To get more information about the functionality of this package, please have a look at the package documentation (`help(pa=testthat`).

### Adding GUI-Tests
To add instructions for additional tests for the graphical user interface, please file a pull-request against the master branch of this repository by updating the package vignette located `vignettes/GUItests.Rmd`.

## Issues
Please notify us about bugs and issues by creating an issue at https://github.com/sdcTools/UserSupport/issues.
