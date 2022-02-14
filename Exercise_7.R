###### 7.1

library(rpart)
library(rpart.plot)
data(iris)
attach(iris)

n = nrow(iris)
set.seed(42)
train.id = sample(n, 2/3*n)
test.id = setdiff(1:n, train.id)

train_data = iris[train.id,]
test_data = iris[test.id,]
tree1 = rpart(Species ~., data = iris, method = "class", subset = train.id)
tree1

pred = predict(tree1, iris[test.id,],  type = "class")
pred
head(pred)

list( train = summary(train_data), test = summary(test_data) )

table(pred, iris[test.id, "Species"])
rpart.control()
## tree building

prp(tree1,box.col=c("pink","palegreen3","blue")[tree1$frame$yval])


#### 7.2

churn = read.csv("churn.txt")
attach(churn)
n = nrow(churn)
set.seed(42)
train.id = sample(n, 0.7*n)
test.id = setdiff(1:n, train.id)

train_data = churn[train.id,]
test_data = churn[test.id,]
#churnfactor = factor(train_data$Churn.)
tree1 = rpart(Churn. ~ ., data = train_data, method = "class")
tree1

train_data = train_data[,-4]
test_data = test_data[,-4]

tree2 = rpart(Churn.~., data = train_data, method = "class")
tree2

?prp
prp(tree2, box.col =c()[tree2$frame$yval])
tree3 = rpart( Churn. ~ .,data=train, method="class",control=rpart.control(maxcompete = 3, maxdepth = 2))
