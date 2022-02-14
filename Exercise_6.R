####   6.1

ff = read.csv("disease.txt", sep = ",")
attach(ff)
plot(Age, Disease)

mymodel = glm(Disease ~ Age, data = ff, family = binomial())
summary(mymodel)


####  6.2

churn = read.csv("churn.txt")
names(churn)
attach(churn)
churnfactor = factor(Churn.)
mymodel = glm(churnfactor~VMail.Plan, family = binomial())
summary(mymodel)
pc1=0.0868
pc0=0.16715
(pc1/(1-pc1))/(pc0/(1-pc0))
#### 6.3


mymodel = glm(churnfactor ~ Day.Mins+Eve.Mins+Night.Mins+Intl.Mins+
                Int.l.Plan+VMail.Plan+CustServ.Calls, family = binomial())

summary(mymodel)
#g(x) = estimated logit for this model
exp(-5.996)/(1+exp(-5.996))
