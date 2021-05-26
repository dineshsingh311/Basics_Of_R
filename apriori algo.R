# association rule
# L13 Association rule ex1 dataset

# load dataset
 library('arules')

 groc=read.transactions(file.choose(),sep = ",")
head(groc)

summary(groc)
inspect(groc[1:5])

itemFrequencyPlot(groc,TopN=20)

itemFrequencyPlot(groc,TopN=20,type="absolute")

itemFrequencyPlot(groc,TopN=20,type='relative')
itemFrequencyPlot(groc,TopN=5)


rules=apriori(groc,parameter = list(support=.001,confidence=.8,minlen=2),
              control = list(verbose=F,sort=F)
              )


inspect(rules[1:10])
