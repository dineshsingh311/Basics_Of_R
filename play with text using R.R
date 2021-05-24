

x="dinstar311@gmail.com"

substr(x,2,5) #substr(x,start,stop)

substring(x,1) #substring(x,start)

paste("Dinesh","Yadav") #output as Dinesh Yadav with space
paste0("Dinesh","Yadav")  #output as DineshYadav without space

install.packages('stringr')
library('stringr')

x="dinstar311@gmail.com"
str_locate(x,"@")

str_locate(x,"i")
str_locate_all(x,'i')

str_count(x)

str_to_lower(x)
str_to_upper(x)


s=c("dinesh","yadav","dinesh yadav")
trimws(s)

trimws(s,which = "left")
trimws(s,which = "right")
