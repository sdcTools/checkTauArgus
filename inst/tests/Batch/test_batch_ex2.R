library(sdcTable)
context("Checking Batch-Inputs (Ex2)")

# run Batch/ex2/batch_ex2.arb
inp <- file.path(system.file(package="checkArgus"),"tests","Batch","ex2", "batch_ex2.arb")
res <- runArgusBatchFile(obj=NULL, batchF=inp, exe=tau_exe)

# checks/expecations for ex2
test_that("Checking structure of output (ex2)", {
  expect_equal(nrow(res), 24)
  expect_equal(res$cellvalue[1], 10484.95)
  expect_equal(sum(is.na(res$cellvalue)), 9)
  expect_equal(names(res), c("region","gender","cellvalue","sdcStatus_argus"))
})

test_that("Checking suppression pattern of output (ex2)", {
  expect_equal(sum(res$sdcStatus_argus%in%c("s","z")), 20)
  expect_equal(sum(res$sdcStatus_argus==c("u")), 1)
  expect_equal(sum(res$sdcStatus_argus==c("x")), 3)
})

