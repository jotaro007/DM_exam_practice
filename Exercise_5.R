library(rgl)
library(MASS)

#### 5.1
cereals = read.csv("cereals.dat", sep = "")

attach(cereals)
plot(SUGARS,RATING)
plot3d(SUGARS, FIBER, RATING)

summary(lm(RATING~SUGARS))

summary(lm(RATING~FIBER))

summary(lm(RATING~SUGARS+FIBER))

cereals[66,]

##dummy variable 5.2

plot(RATING,SHELF)

dim(cereals)

shelf1 = seq(0,0, length.out = 77)
shelf2 = seq(0,0, length.out = 77)

shelf1[SHELF==1] = 1
shelf1[SHELF==2] = 0
shelf1[SHELF==3] = 0
shelf2[SHELF==1] = 0
shelf2[SHELF==2] = 1
shelf2[SHELF==3] = 0

summary(lm(RATING~SUGARS+FIBER+shelf1+shelf2))


#### 5.3

###  AIC
attach(Cars93)
sss = lm(Price~ RPM +Horsepower+ Weight+ Passengers+ MPG.city+MPG.highway)
extractAIC(sss)

###   BIC


n = length(Cars93)
n
extractAIC(sss, k= log(n))

####   Mallow's CP

summa = summary(lm(Price~RPM))
summa

sig = summa$sigma

extractAIC(sss, scale = sig*sig)





#####    5.4

###  BACKWARD
?step

myback = step(lm(Price~RPM +EngineSize+MPG.city+MPG.highway+Cylinders+
                   Horsepower+Weight+Passengers))


#### Forward

mymatrix = data.frame(RPM,EngineSize,MPG.city,MPG.highway,Cylinders,
                      Horsepower,Weight,Passengers)
nullmodel = lm(Price ~1, data = mymatrix)
myforward = step(nullmodel, scope = formula(mymatrix), direction = "both")


### Stepwise

myback = step(lm(Price~RPM +EngineSize+MPG.city+MPG.highway+Cylinders+
                   Horsepower+Weight+Passengers),direction="both")















































