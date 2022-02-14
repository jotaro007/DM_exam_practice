#### 4.1

y=c(10,11,12,13,14,15,20,18,22,25)
x=c(2,2,3,4,4,5,6,7,8,9)
plot(x,y)

myvalues = lm(y~x)
myvalues
plot(x,y)
abline(myvalues)
summary(myvalues)

### residuals analysis

myres = residuals(myvalues)
myfit = fitted(myvalues)
plot(x,myres)
plot(x,myfit)

xx =c(2 , 2, 3, 4, 4, 5, 6, 7, 8, 9, 16)
yy =c(10, 11, 12, 13, 14, 15, 20, 18, 22, 25, 39)
plot(xx,yy)

myvalues = lm(yy~xx)
summary(myvalues)

## influential

influence.measures(myvalues)

myinfluence = influence.measures(myvalues)
which(apply(myinfluence$is.inf,1,any))
summary(myinfluence)


yy=c(10,11,12,13,14,15,20,18,22,25,20)
xx=c(2,2,3,4,4,5,6,7,8,9,5)
plot(xx,yy)

myvalues = lm(yy~xx)
summary(myvalues)

myinfluence = influence.measures(myvalues)
summary(myinfluence)


yy=c(10,11,12,13,14,15,20,18,22,25,23)
xx=c(2,2,3,4,4,5,6,7,8,9,10)
plot(xx,yy)
myvalues=lm(yy~xx)
summary(myvalues)


myinfluence = influence.measures(myvalues)
summary(myinfluence)


#####  4.2

baseball = read.csv("baseball.txt", sep = "")

baseball_new = baseball[baseball$at_bats>=100,]
baseball_new$at_bats
dim(baseball_new)
plot(baseball_new$bat_ave, baseball_new$homeruns)

myreg = lm(baseball_new$homeruns~baseball_new$bat_ave)
summary(myreg)

myres = residuals(myreg)
plot(baseball_new$bat_ave,myres)

qqnorm(myres)
qqline(myres)

ln_home_runs = log(baseball_new$homeruns)
bat_ave = baseball_new$bat_ave
plot(bat_ave,ln_home_runs)

total = data.frame(ln_home_runs,bat_ave)
totalnew = total[total$ln_home_runs>= -10,]
myr = lm(totalnew$ln_home_runs~totalnew$bat_ave)

summary(myr)
#Sys.setenv(LANG = "EN")












































