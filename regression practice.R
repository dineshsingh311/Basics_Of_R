#### linear regression

hp=read.csv(file.choose(),header = TRUE)
head(hp)

cor(hp)
names(hp)

model=lm(Price~LivingArea,data = hp)
summary(model)

model2=lm(Price~LivingArea+Age+LotSize,data = hp)
summary(model2)


# ----------------------------------------------------------------

head(hp,3)
set.seed(2021)

library('caTools')

split=sample.split(hp$Price,SplitRatio = .70)
train_hp=subset(hp,split==T)
test_hp=subset(hp,split==F)

nrow(hp)
nrow(train_hp)
nrow(test_hp)

fit=lm(Price~LivingArea+Age,data = train_hp)
summary(fit)

fit2=lm(Price~.,data=train_hp)
summary(fit2)
