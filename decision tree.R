
# decision tree
# L11 class ex 4 dataset
# e1071 package

# load the data

df=read.csv(file.choose(),header=TRUE)
head(df,3)

summary(df)

table(df$NSP)
class(df$NSP)

df$NSP=as.factor(df$NSP)

library('caTools')
library('e1071')
library('rpart')
library('rpart.plot')

set.seed(2021)

split=sample.split(df$NSP,SplitRatio = .70)
train_df=subset(df,split==T)
test_df=subset(df,split==F)

nrow(train_df)
nrow(test_df)
nrow(df)


model=rpart(NSP~.,data = train_df,method = 'class',
            control = rpart.control(minsplit = 90,minbucket = 30,xval = 10))

rpart.plot(model)


test_df$pred_nsp=predict(model,test_df,type = 'class')
test_df[,c('NSP','pred_nsp')]

table(test_df$NSP)
table(test_df$pred_nsp)

tab=table(test_df$NSP,test_df$pred_nsp)

accuracy=sum(diag(tab))/sum(tab)
accuracy









