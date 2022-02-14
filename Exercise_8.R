##### 8.1

library(nnet)
churn = read.csv("churn.txt")

n = nrow(churn)
set.seed((42))
train.id = sample(n, 2/3*n)
test.id = setdiff(1:n, train.id)
train_data = churn[train.id,]
test_data = churn[test.id,]


churnfactor = factor(train_data$Churn.)
mynn = nnet(churnfactor ~., data = train_data, size= 2, maxit = 200)

Day.Mins = train_data$Day.Mins
VMail.Plan = train_data$VMail.Plan
use_data = data.frame(Day.Mins,VMail.Plan, churnfactor)
mynn = nnet(churnfactor~.,data = use_data, size = 2)
mynn

summary(mynn)
mynn = nnet(churnfactor~.,data = use_data, size = 20, maxit = 200)
