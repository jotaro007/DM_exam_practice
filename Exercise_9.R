library(randomForest)
library(rpart)
n = nrow(iris)
set.seed(42)
train.id = sample(n, 2/3*n)
test.id = setdiff(1:n, train.id)

train_data = iris[train.id,]
test_data = iris[test.id,]

tree1 = rpart(Species~., data = train_data, method = "class")
tree1
pred = predict(tree1, iris[test.id,], type = "class")
table(pred, iris[test.id, "Species"])


rf = randomForest(Species~.,data = train_data)
pred2 = predict(rf,iris[test.id,], type = "class")
table(pred2, iris[test.id, "Species"])

#### 9.2


churn = read.csv("churn.txt")
attach(churn)
n = nrow(churn)
set.seed(42)
train.id = sample(n, 2/3*n)
test.id = setdiff(1:n, train.id)

train_data = churn[train.id,]
test_data = churn[test.id,]

train_data = train_data[,-4]
test_data = test_data[,-4]

tree2 = rpart(Churn.~., data = train_data, method = "class")
pred = predict(tree2, churn[test.id,], type = "class")
table(pred, churn[test.id, "Churn."])

churnfactor = factor(train_data$Churn.)
churnfactor2 = factor(test_data$Churn.)
test2 = data.frame(test_data,churnfactor2)
rf2 =randomForest(churnfactor ~ .,data=train_data, method="class")
pred3 = predict(rf2,test2, type = "class")
table(pred3,test2[,"churnfactor2"])





