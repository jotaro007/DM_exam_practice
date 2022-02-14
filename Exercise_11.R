######    11.1


library(arules)
data(Groceries)
myrules = apriori(Groceries)
inspect(myrules)
?apriori
#myrules = apriori(Groceries, parameter = list(support = 0.5, confidence = 0.05))
myrules=apriori(Groceries,parameter=list(supp=0.05,conf=0.05))
inspect(myrules)
myrules=apriori(Groceries,parameter=list(supp=0.01,conf=0.01,minlen=3))
inspect(myrules[20])
cc=sort(myrules, by="lift")
inspect(cc[1:10])
hh=subset(myrules, subset = lhs %pin% "pork" & lift > 1.2)
inspect(hh)
