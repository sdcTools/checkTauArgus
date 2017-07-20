library(sdcTable)
context("Checking Batch-Inputs (Ex2)")

# run Batch/ex2/batch_ex2.arb
tt <- tempdir()
inp <- file.path(system.file(package="checkArgus"),"tests","Batch","ex2", "batch_ex2.arb")
res <- runArgusBatchFile(obj=NULL, batchF=inp, exe=tau_exe,batchDataDir=tt)

# read in file
result <- read.csv(file.path(tt,"tabout_ex2.txt"))
result$Status2 <- sdcTable:::recode_sdcStati(result$Status)

# checks/expecations for ex2
test_that("Checking structure of output (ex2)", {
  expect_is(result, "data.frame")
  expect_equal(names(result), c("region","gender","num1","Status","Status2"))
  expect_equal(nrow(result), 15)
  expect_equal(result$num1[1], 10484.95)
  expect_equal(sum(is.na(result$num1)), 0)
})

test_that("Checking suppression pattern of output (ex2)", {
  expect_equal(result$Status2, c("s","s","s","s","x","u","s","s","s","s","x","x","s","s","s"))
})
