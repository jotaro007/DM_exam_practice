library(amap)

### 10.2

x=c(1,1.1,5,5.1,1.5,5.2,7.9,1.2,8.1,9)
plot(x)

mycluster = kmeans(x,3)

mycluster$size
mycluster$cluster
mycluster$centers
mycluster$withinss
plot(x, col = mycluster$cluster)

points(mycluster$centers, col = 1:3, pch = 8, cex=2)

set.seed(42)
set.seed(4333)

######    10.3

data("USArrests")

names(USArrests)
?hcluster

hc_ave <- hcluster(USArrests,link = "ave")

plot(hc_ave)

hc_sin <- hcluster(USArrests,link = "single")
hc_com <- hcluster(USArrests,link = "complete")
plot(hc_sin)
plot(hc_com)




#Sys.setenv(LANG = "DE")
































