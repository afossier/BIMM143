#Class 05 R graphics intro

#My first boxplot
x<-rnorm(1000,0)
boxplot( x)

summary(x)
hist(x)

boxplot(x, horizontal= TRUE)

weight<-read.table("bimm143_05_rstats/weight_chart.txt", 
                   header =TRUE, sep = "")
plot(weight$Age, weight$Weight, typ="o", 
     pch=15, cex=1.5, lwd=2, ylim=c(2,10), 
     xlab="age (months)", ylab="weight (kg)", 
     main="Baby Weight", col="blue", lty=3)

mouse <- read.table("bimm143_05_rstats/feature_counts.txt", 
                    header = TRUE, sep = "\t")
barplot(mouse$Count, horiz=TRUE, names.arg= mouse$Feature, 
        las=2)

#change margin so we can see the labels
par(mar=c(5.1,11.1,4.1,2.1))
barplot(mouse$Count, horiz=TRUE, names.arg= mouse$Feature, 
        las=2)

#add color
barplot(mouse$Count, horiz=TRUE, names.arg= mouse$Feature, 
        las=2, col=rainbow(nrow(mouse)))
#male/female
mf <- read.table("bimm143_05_rstats/male_female_counts.txt", 
                    header = TRUE, sep = "\t")
barplot(mf$Count, horiz=FALSE, names.arg= mf$Sample, 
        las=2, col=c("blue2", "yellow2"))

#updown
updown <- read.delim("bimm143_05_rstats/up_down_expression.txt", 
                 header = TRUE, sep = "")
#plot(updown)
plot(updown$Condition1, updown$Condition2, col=updown$State)
#table(updown$State)
palette(c("red", "grey", "blue"))

e <- read.table("bimm143_05_rstats/up_down_expression.txt", header=TRUE)
nrow(e)
table(e$State)

