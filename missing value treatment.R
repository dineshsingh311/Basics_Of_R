#missing value treatment

#load the data

titanic_train=read.csv(file.choose(),header = TRUE)
titanic_test=read.csv(file.choose(),header = TRUE)

nrow(titanic_train)
nrow(titanic_test)

names(titanic_train)
names(titanic_test)

#missing value in age

sum(is.na(titanic_train$Age))
sum(is.na(titanic_test$Age))

summary(titanic_train)

mean(titanic_train$Age)
mean(titanic_train$Age,na.rm = TRUE)

head(titanic_train,5)

# we have to lookout titles of name

combi=rbind(titanic_train,titanic_test)
# combi doesnt execute , becz of columns mismatched
# so we have to create dummy column in test data-----survived columns is not there

titanic_test$Survived="Dummy"
head(titanic_test,3)
# dummy survived column is generated
# now we have to combine train and test data

combi=rbind(titanic_train,titanic_test)
nrow(titanic_train) #891 row
nrow(titanic_test) #418 row
nrow(combi)       #1309 row

class(combi$Name)
combi$Name[1:5]

strsplit(combi$Name[1],'[,.]')
#look at the output [[1]]------[1] [2] [3]---Mr is on second place

strsplit(combi$Name[1],'[,.]')[[1]][2]

##### we have to create a function for all names

f=function(x){
  strsplit(x,'[,.]')[[1]][2]
  
}

combi$title=sapply(combi$Name,f)
head(combi$title)

unique(combi$title)
sort(table(combi$title))

combi$title=sub(" ","",combi$title)
combi$title


unique(combi$title)
sort(table(combi$title))

class(combi$title)
class(combi$Sex)
combi$title=as.factor(combi$title)
table(combi$Sex,combi$title)


class(combi$title)
combi$title[combi$title %in% c("Mlle","Lady","the Countess","Ms")]="Miss"

combi$title[combi$title %in% c("Dona","Dr","Mme") & combi$Sex=='female']="Mrs"

combi$title[combi$title %in% c("Don","Rev","Dr","Major","Sir","Col","Capt","Jonkheer") & combi$Sex=='male']="Mr"

unique(combi$Sex)
unique(combi$title)
table(combi$title,combi$Sex)

tapply(combi$Age,combi$title,mean)
title_mean=tapply(combi$Age,combi$title,mean,na.rm=T)
names(title_mean)
title_mean



combi$Age[is.na(combi$Age & combi$title=="Master")]=title_mean[names(title_mean)=="Master"]

combi$Age[is.na(combi$Age & combi$title=="Miss")]=title_mean[names(title_mean)=="Miss"]

combi$Age[is.na(combi$Age & combi$title=="Mr")]=title_mean[names(title_mean)=="Mr"]

combi$Age[is.na(combi$Age & combi$title=="Mrs")]=title_mean[names(title_mean)=="Mrs"]

mean(combi$Age & combi$title=="Mr")
tapply(combi$Age,combi$title,mean)

sum(is.na(combi$Age))
mr=subset(combi,combi$title=="Mr")
nrow(mr)
mean(mr$Age)



