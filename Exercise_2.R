library(DataExplorer)
library(mlr3)
library(datasets)

####2.1
data("airquality")
attach(airquality)
mean(Ozone)

is.na(Ozone)
sum(is.na(Ozone))

sum(is.na(airquality))

mean(Ozone, na.rm = TRUE)

airquality_without_missing = na.omit(airquality)
dim(airquality_without_missing)
dim(airquality)

missing_ind = complete.cases(Ozone)
missing_ind

?which
d = which(is.na(airquality), arr.ind = TRUE)
dim(d)

####  2.2

library(DataExplorer)
plot_missing(airquality)

imputed = impute(airquality, cols = list(Ozone = 100))
imp_ozone = imputed$data[,1]

imputed2 = impute(airquality, cols = list(Ozone = imputeMedian()))
imp_ozone2 = imputed2$data[,1]

imputed3 = impute(airquality, cols = list(Ozone = 0))
imp_ozone3 = imputed3$data[,1]

imputed4 = impute(airquality, cols = list(Ozone = imputeNormal()))
imp_ozone4 = imputed4$data[,1]

imputed5 = impute(airquality, cols = list(Ozone = imputeHist()))
imp_ozone5 = imputed5$data[,1]

par(mfrow=c(2,3))
hist(Ozone,breaks=25,ylim=(c(0,45)),main="Original data")
hist(imp_ozone,breaks=25,ylim=(c(0,45)),main="Imputation with 100")
hist(imp_ozone2,breaks=25,ylim=(c(0,45)),main="Imputation with median")
hist(imp_ozone3,breaks=25,ylim=(c(0,45)),main="Imputation with 0")
hist(imp_ozone4,breaks=25,ylim=(c(0,45)),main="Imputation with normal distr.")
hist(imp_ozone5,breaks=25,ylim=(c(0,45)),main="Imputation with histogram")



mean(imp_ozone5)
mean(imp_ozone4)
mean(imp_ozone3)
mean(imp_ozone2)
mean(imp_ozone)
mean(Ozone, na.rm = TRUE)

####  2.3
 
clothing = read.csv(file = "clothing_store.txt")
names(clothing)
dim(clothing)

set.seed(42)
n = nrow(clothing)
train.id = sample(n, 0.7*n)
test.id = setdiff(1:n, train.id)

length(train.id)
length(test.id)

train_data = clothing[train.id,]
test_data = clothing[test.id,]
dim(training_data)
dim(test_data)

attach(training_data)
length(unique(HHKEY))
length(unique(RESP))
length(unique(PKNIT_TOPS))

hist(RESP)

unique(RESP)
data_one = training_data[RESP==1,]
data_zero = training_data[RESP==0,]
dim(data_zero)
dim(data_one)

tr = training_data[,c(-1,-2)]
names(tr)

val = test_data[,c(-1,-2)]
names(val)

attach(tr)
hi_trans = log(HI)
tr = tr[,-45]
tr = data.frame(tr,hi_trans)
names(tr)

attach(val)
hi_trans = log(HI)
val = val[,-45]
val = data.frame(val,hi_trans)
names(val)

write.table(tr,"tr_clothing_prepared.txt",row.names=FALSE)








