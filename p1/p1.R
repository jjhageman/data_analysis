load("loansData.rda")
loansData$Debt.To.Income.Ratio = as.numeric(sub("%","",loansData$Debt.To.Income.Ratio))
loansData$Interest.Rate = as.numeric(sub("%","",loansData$Interest.Rate))
r <- loansData[loansData$FICO.Range == '670-674',]

numericLength <- as.numeric(as.factor(r$Loan.Length))
plot(r$Interest.Rate, pch = 19, col = numericLength)
legend(20,legend=unique(r$Loan.Length),col=unique(numericLength),pch=19)
plot(r$Interest.Rate, r$Loan.Length,col="blue",pch=19)

plot(r$Amount.Funded.By.Investors,r$Interest.Rate,pch=19,col="blue")

boxplot(r$Interest.Rate ~ sort(as.factor(r$Loan.Purpose)),col=numericPurpose,varwidth=TRUE)

meanRateByState<-aggregate(r$Interest.Rate,list(State=r$State),mean)
barplot(meanRateByState$x,names.arg=meanRateByState$State,cex.names=0.8,ylim=c(0,20),col="blue")
boxplot(r$Interest.Rate ~ as.factor(r$State),col="blue")

boxplot(r$Interest.Rate ~ as.factor(r$Employment.Length),col=numericEmployment,varwidth=TRUE)
meanEmp<-aggregate(r$Interest.Rate,list(State=r$Employment.Length),mean) 
barplot(sort(meanEmp$x),names.arg=meanEmp$State,cex.names=0.8,ylim=c(0,20),col="blue")