

#Die Out Plots


#theme(text=element_text(size=14, family="Calibri")



#Truncated Line Plots
c4 <- viridis(5)
#par(family = "LM Roman 10")

txmonth=seq(1,12,1)

Tx_3_.5_Un<-colMeans(EProp3y_0.5_UnlinkedHigh)
Tx_3_2_Un<-colMeans(EProp3y_2_UnlinkedHigh)
Tx_3_10_Un<-colMeans(EProp3y_10_UnlinkedHigh)

Tx_3_.5_50<-colMeans(EProp3y_0.5_LinkedPop50High)
Tx_3_2_50<-colMeans(EProp3y_2_LinkedPop50High)
Tx_3_10_50<-colMeans(EProp3y_10_LinkedPop50High)

Tx_3_.5_75<-colMeans(EProp3y_0.5_LinkedPop75High)
Tx_3_2_75<-colMeans(EProp3y_2_LinkedPop75High)
Tx_3_10_75<-colMeans(EProp3y_10_LinkedPop75High)

Tx_3_.5_100<-colMeans(EProp3y_0.5_LinkedPopHigh)
Tx_3_2_100<-colMeans(EProp3y_2_LinkedPopHigh)
Tx_3_10_100<-colMeans(EProp3y_10_LinkedPopHigh)



#Combined Plot
#tiff("Combined_3tx.tiff",  res=300)

#par(family = "LM Roman 10")
par(family="serif")
par(mfrow = c(2, 2))
par(mar = c(0, 0, 0, 0))

#Unlinked
par(mai=c(.75,1,0.2,.2))
plot(txmonth, Tx_3_.5_Un,type="b",pch=19,col=c4[1],lwd=4,cex=1.5,
     xlab="Months Between Treatments", 
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5,
     main="Unlinked FOI",
     ylab="Proportion of Time \nWith Egg Die Out",
     ylim=c(0,1),xlim=c(1,12))
lines(Tx_3_2_Un,type="b",pch=19,col=c4[2],lwd=4,cex=1.5,)
lines(Tx_3_10_Un,type="b",pch=19,col=c4[3],lwd=4,cex=1.5,)
#legend("topright", title="Initial FOI",legend = c('.5','2','10'),col=c4,lwd=2 , cex=.75)



#50% Linked
par(mai=c(.75,.2,0.2,1))
plot(txmonth, Tx_3_.5_50,type="b",pch=19,col=c4[1],lwd=4,cex=1.5,
     xlab="Months Between Treatments", 
     yaxt = "n",ylim=c(0,1),xlim=c(1,12),
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5,
     main="50% Population Linked FOI")
lines(Tx_3_2_50,type="b",pch=19,col=c4[2],lwd=4,cex=1.5,)
lines(Tx_3_10_50,type="b",pch=19,col=c4[3],lwd=4,cex=1.5)
legend("topright", title="Initial FOI",legend = c('.5','2','10'),col=c4,lwd=2 , cex=1.3)

#75% Linked
par(mai=c(.75,1,0.2,.2))
plot(txmonth, Tx_3_.5_75,type="b",pch=19,col=c4[1],lwd=4,cex=1.5,
     xlab="Months Between Treatments", 
     ylab="Proportion of Time \nWith Egg Die Out",
     ylim=c(0,1),xlim=c(1,12),
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5,
     main="75% Population Linked FOI")
lines(Tx_3_2_75,type="b",pch=19,col=c4[2],lwd=4,cex=1.5)
lines(Tx_3_10_75,type="b",pch=19,col=c4[3],lwd=4,cex=1.5)
#legend("topright", title="Initial FOI",legend = c('.5','2','10'),col=c4,lwd=2 , cex=.75)



#100% Linked
par(mai=c(.75,.1,0.2,1))
plot(txmonth, Tx_3_.5_100,type="b",pch=19,col=c4[1],lwd=4,cex=1.5,
     xlab="Months Between Treatments", ylab="",
     yaxt = "n",ylim=c(0,1),xlim=c(1,12),
     cex.main=1.5, cex.lab=1.5, cex.axis=1.5,
     main="100% Population Linked FOI")
lines(Tx_3_2_100,type="b",pch=19,col=c4[2],lwd=4,cex=1.5)
lines(Tx_3_10_100,type="b",pch=19,col=c4[3],lwd=4,cex=1.5)
#legend("topright", title="Initial FOI",legend = c('.5','2','10'),col=c4,lwd=2 , cex=.75)
#title("100% Population Linked FOI")


#save(path="~/Desktop", filename="Combined_3tx.tiff",device='tiff', dpi=700)
#jpeg("rplot.jpg", width = 350, height = "350")
# pdf(file = "~/Desktop/My Plot.pdf",   # The directory you want to save the file in
#     width = 4, # The width of the plot in inches
#     height = 4) # The height of the plot in inches
# 
# 
# jpeg(file = "~/Desktop/TreatmentCombined.jpg",   # The directory you want to save the file in
#     width = 4, # The width of the plot in inches
#     height = 4) # The height of the plot in inches

#dev.off()



