library(sdcTable)
context("Check creation of batch-files from sdcTable (tabular input)")

path <- file.path(system.file(package="checkArgus"),"tests", "CreateBatch")

# loading micro data
load(file.path(path, "inpData.rdata"))

dim.region <- data.frame(
  levels=c('@','@@','@@','@@','@@'),
  codes=c('Total', 'A','B','C','D'),
  stringsAsFactors=FALSE)

dim.gender <- data.frame(
  levels=c('@','@@','@@'),
  codes=c('Total', 'male','female'),
  stringsAsFactors=FALSE)

dimList <- list(region=dim.region, gender=dim.gender)
dimVarInd <- c(1,2)
numVarInd <- 3:5
sampWeightInd <- 6

freqVarInd <- weightInd <- NULL

## creating an object of class \code{\link{sdcProblem-class}}
obj <- makeProblem(
  data=inpData,
  dimList=dimList,
  dimVarInd=dimVarInd,
  freqVarInd=freqVarInd,
  numVarInd=numVarInd,
  weightInd=weightInd,
  sampWeightInd=sampWeightInd)

# set cells as primary suppressions
obj <- primarySuppression(obj, type="freq", maxN=500)

outP <- tempdir()

## create batchInput object from tabular data
bO_td1 <- createArgusInput(obj, typ="tabular", path=outP, solver="FREE", method="OPT")

# run some checks on the created batch-files
test_that("Checking if files exist", {
  expect_true(file.exists(bO_td1))
})

res <- runArgusBatchFile(obj=obj, batchF=bO_td1, exe=tau_exe)
res[,cellvalue:=as.numeric(cellvalue)]
test_that("Checking structure of tabluar problem", {
  expect_equal(nrow(res), 15)
  expect_equal(res$cellvalue[1], 5543)
  expect_equal(sum(is.na(res$cellvalue)), 0)
  expect_equal(names(res), c("region","gender","freq","sdcStatus","cellvalue","sdcStatus_argus"))
})

test_that("Checking suppression pattern of tabluar problem", {
  expect_equal(sum(res$sdcStatus_argus==c("s")), 11)
  expect_equal(sum(res$sdcStatus_argus==c("z")), 0)
  expect_equal(sum(res$sdcStatus_argus==c("u")), 1)
  expect_equal(sum(res$sdcStatus_argus==c("x")), 3)
})


