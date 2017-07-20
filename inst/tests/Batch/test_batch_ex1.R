library(sdcTable)
context("Checking Batch-Inputs (Ex1)")

# run Batch/ex1/batch_ex1.arb
tt <- tempdir()
inp <- file.path(system.file(package="checkArgus"),"tests","Batch","ex1", "batch_ex1.arb")
res <- runArgusBatchFile(obj=NULL, batchF=inp, exe=tau_exe, batchDataDir=tt)

# read in file
result <- read.csv(file.path(tt,"tabout_ex1.txt"))
result$Status2 <- sdcTable:::recode_sdcStati(result$Status)

# checks/expecations for ex1
test_that("Checking structure of output (ex1)", {
  expect_is(result, "data.frame")
  expect_equal(names(result), c("region","gender","freq","Status","Status2"))
  expect_equal(nrow(result), 15)
  expect_equal(result$freq[1], 5146)
  expect_equal(sum(is.na(result$freq)), 0)
})

test_that("Checking suppression pattern of output (ex1)", {
  expect_equal(result$Status2, c("s","s","s","s","x","u","s","s","s","s","x","x","s","s","s"))
})

