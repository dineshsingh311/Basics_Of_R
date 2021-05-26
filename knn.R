
#knn
#ls 11 class ex 1 dataset

#load the data

gc=read.csv(file.choose(),header = TRUE)
head(gc,3)

names(gc)

library('caTools')
set.seed(2021)
split=sample.split(gc$Default,SplitRatio = .70)
gc_train=subset(gc,split==T)
gc_test=subset(gc,split==F)

#automatically choose only numeric column

numcol=sapply(gc,is.numeric)

train_num=gc_train[,numcol]
head(train_num)

test_num=gc_test[,numcol]
head(test_num)

#change corressponding z score

train_num_z=scale(train_num[,-1])
head(train_num_z)

test_num_z=scale(test_num[,-1])
head(test_num_z)

library('class')

knn=knn(train_num_z,test_num_z,gc_train[,1],k=3)






gc_test$pred_def=knn

tab=table(gc_test$Default,gc_test$pred_def)
accuracy=sum(diag(tab))/sum(tab)
accuracy

#for better value of k ----- use for loop

for (i in 3:30) {
  knn=knn(train_num_z,test_num_z,gc_train[,1],k=i)
  
  gc_test$pred_def=knn
  
  tab=table(gc_test$Default,gc_test$pred_def)
  accuracy=sum(diag(tab))/sum(tab)
  accuracy
  print(paste("The accuracy of the model with k=",i," is",accuracy))
  
}








