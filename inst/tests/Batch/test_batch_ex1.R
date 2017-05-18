library(sdcTable)
context("Checking Batch-Inputs (Ex2)")

# run Batch/ex1/batch_ex1.arb
inp <- file.path(system.file(package="checkArgus"),"tests","Batch","ex1", "batch_ex1.arb")
res <- runArgusBatchFile(obj=NULL, batchF=inp, exe=tau_exe)

# checks/expecations for ex1
test_that("Checking structure of output (ex1)", {
  expect_equal(nrow(res), 24)
  expect_equal(res$cellvalue[1], 5146)
  expect_equal(sum(is.na(res$cellvalue)), 9)
  expect_equal(names(res), c("region","gender","cellvalue","sdcStatus_argus"))
})

test_that("Checking suppression pattern of output (ex1)", {
  expect_equal(sum(res$sdcStatus_argus%in%c("s","z")), 24)
  expect_equal(sum(res$sdcStatus_argus%in%c("u","x")), 0)
})

