library(rpart)
library(rpart.plot)
library(ROCR)

#### 1.1

data(iris)

iristree = rpart(Species ~., data = iris, method = "class")
n = nrow(iris)
set.seed(42)
train.id = sample(n, 2/3*n)
test.id = setdiff(1:n, train.id)

traintree = rpart(Species ~., data = iris, subset = train.id, method = "class")
pred = predict(traintree, iris[test.id,], type = "class")
head(pred)

table(pred, iris[test.id, "Species"])

#### 3.2

ff = read.csv("disease.txt")
ff

diseasetree = rpart(Disease~., data = ff, method = "class")
pred = predict(diseasetree, ff, type = "class")
pred
table(pred, ff[, "Disease"])

p2 = predict(diseasetree, ff, type = "prob")
p2


pr3 = p2[,2]
pr3
pr= prediction(pr3,ff$Disease)
perf = performance(pr, "tpr", "fpr")
plot(perf)
performance(pr, "auc")








