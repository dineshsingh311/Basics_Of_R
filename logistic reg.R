
##____ Logistic regression
####  L11 class ex 1 dataset

#load the data
GC=read.csv(file.choose(),header = TRUE)
head(GC,3)

sapply(GC,is.numeric)
names(GC)
gc=GC[,c("Default","duration","amount","age")]
head(gc)

tapply(gc$age,gc$Default,mean)

set.seed(2021)

split=sample.split(gc$Default,SplitRatio = .70)
train_gc=subset(gc,split==T)
test_gc=subset(gc,split==F)

nrow(train_gc)
nrow(test_gc)
nrow(gc)

logit=glm(Default~.,data = train_gc,family = 'binomial')
prob_def=predict(logit,test_gc,type = 'response')

test_gc$prob_def=predict(logit,test_gc,type = 'response')
test_gc

test_gc$prob_def=ifelse(test_gc$prob_def>0.5,1,0)

test_gc

table(test_gc$Default)
table(test_gc$prob_def)


tab=table(test_gc$Default,test_gc$prob_def)
tab

accuracy=sum(diag(tab))/sum(tab)
accuracy
