library(sdcTable)
context("Check creation of batch-files from sdcTable (microdata input)")

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
freqVarInd <- 3
numVarInd <- 4:5
sampWeightInd <- 6
weightInd <- NULL

## creating an object of class \code{\link{sdcProblem-class}}
obj <- makeProblem(
  data=inpData,
  dimList=dimList,
  dimVarInd=dimVarInd,
  freqVarInd=freqVarInd,
  numVarInd=numVarInd,
  weightInd=weightInd,
  sampWeightInd=sampWeightInd)

## create primary suppression rules
primSuppRules <- list()
primSuppRules[[1]] <- list(type="freq", n=5, rg=20)
primSuppRules[[2]] <- list(type="p", n=5, p=20)

outP <- tempdir()

## create batchInput object from microdata
bO_md1 <- createArgusInput(obj, typ="microdata", path=outP, solver="FREE", method="OPT",
  primSuppRules=primSuppRules, responsevar="num1")

# run some checks on the created batch-files
test_that("Checking if files exist", {
  expect_true(file.exists(bO_md1))
})

res <- runArgusBatchFile(obj=obj, batchF=bO_md1, exe=tau_exe)
res[,cellvalue:=as.numeric(cellvalue)]
test_that("Checking structure of microdata problem", {
  expect_equal(nrow(res), 15)
  expect_equal(res$cellvalue[1], 10272.27)
  expect_equal(sum(is.na(res$cellvalue)), 0)
  expect_equal(names(res), c("region","gender","freq","sdcStatus","cellvalue","sdcStatus_argus"))
})

test_that("Checking suppression pattern of microdata problem", {
  expect_equal(res$sdcStatus_argus, c("s","s","s","s","x","u","s","s","s","s","x","x","s","s","s"))
})
