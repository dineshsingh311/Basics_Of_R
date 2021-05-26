
###-----------------clustering----------------------
# clustering ex 1 ls-12

# load dataset

uni=read.csv(file.choose(),header = TRUE)
head(uni,3)

summary(uni)

scale(uni[,2:7]) #first method
scale(uni[,-1]) #second method

norm_uni=scale(uni[,-1])

d=dist(norm_uni,method = 'euclidian')
d

fit=hclust(d,method = 'complete')
plot(fit,labels = as.factor(uni[,1]))

group=cutree(fit,k=3)
group

rect.hclust(fit,k=3,border = 'black')

membership=as.matrix(group)
membership

hclustering=data.frame(uni,membership)
hclustering

#no of cluster
#use library factoextra

library('factoextra')

fviz_nbclust(norm_uni,FUNcluster = hcut,method = 'wss')

fit_kmean=kmeans(norm_uni,3)

mydata=data.frame(uni,fit_kmean$cluster)
mydata

aggregate(mydata[,2:7],by=list(fit_kmean$cluster),FUN = mean)


fviz_cluster(fit_kmean,norm_uni,geom = 'point')











