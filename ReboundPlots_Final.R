#Rebound Plots

#first run treatment then save ends as xstart...
#Initial Worm Burden
#Can do Intervention_2y_6m
#then Run_Rebound_Nov_Parallel
# (which runs NoTx_Nov2_par)



rebound=mean(Adultvector)

#Rebound times

 rebounds=c(rebound10,rebound20,rebound30,rebound40,rebound50,rebound60,rebound70,
            rebound80,rebound90,rebound100)
# 
# #Rebound values
reboundvalue=c(rebound*.1,rebound*.2,rebound*.3,rebound*.4,rebound*.5,rebound*.6,
                rebound*.7,rebound*.8,rebound*.9,rebound)

zzz="Time to Reach \nPre-Intervention Worm Burden"
www="Unlinked FOI"
#www="Individually Linked FOI"
#www="Population Linked FOI"



par(family = "serif")
par(mar = c(5, 5, 3, 5))
c4 <- viridis(5)


#COMBINED PLOTS

par(mfrow = c(2, 2))



#title("Time to Reach Pre-Intervention Worm Burden")

par(family = "serif")
par(mar = c(5, 5, 3, 5))
par(mai=c(0.5,1,0.2,.1))
#c4 <- viridis(4)
c4 <- viridis(5)

par(cex.main=2.2, cex.lab=2,cex.axis=1.5)




#COMBINED PLOTS TRUNCATED


par(pty='s')
#title("Time to Reach Pre-Intervention Worm Burden")

par(family = "serif")
par(mar = c(5, 5, 3, 5))
par(mai=c(0.5,1,0.2,.1))
#c4 <- viridis(4)
c4 <- viridis(5)


#Unlinked Plot
#plot(AdultsMeans3_25_Unlinked,type="l",xlim=c(0,600),ylim=c(0,(max(AdultsMeans3_25_Unlinked, na.rm = TRUE ))),col=c4[4],lwd=4,

plot(AdultsMeans3_25_Unlinked,type="l",xlim=c(0,540),ylim=c(0,(rebound*2)),col=c4[4],lwd=4,
     xlab="", ylab="Mean Adult Worm Burden",main="Unlinked FOI",cex.lab=1.5, cex.main=1.2)
lines(AdultsMeans3_10_Unlinked,col=c4[3],lwd=4)
lines(AdultsMeans3_2_Unlinked,col=c4[2],lwd=4)
lines(AdultsMeans3_0.5_Unlinked,col=c4[1],lwd=4)


abline(h=250, col=c4[1],lwd=1,lty=3)
#abline(h=75, col='red',lwd=1,lty=3)
abline(h=1100, col=c4[2],lwd=1,lty=3)
abline(h=2300, col=c4[3],lwd=1,lty=3)
abline(h=2900, col=c4[4],lwd=1,lty=3)
#abline(h=400, col='red',lwd=1,lty=3)

legend("topleft", title="Initial FOI",legend = c('.5','2','10','25'),col=c4,lwd=2,ncol =2 , cex=1.25)



#Population Linked 50%
#par(mai=c(0.5,0,0.2,1))

plot(AdultsMeans3_25_LinkedPop50,type="l",xlim=c(0,540),ylim=c(0,(rebound*2)),col=c4[4],lwd=4,
     xlab="",ylab="",main="50% Population Linked FOI", yaxt="n",cex.lab=1.5, cex.main=1.5)
lines(AdultsMeans3_10_LinkedPop50,col=c4[3],lwd=4)
lines(AdultsMeans3_2_LinkedPop50,col=c4[2],lwd=4)
lines(AdultsMeans3_0.5_LinkedPop50,col=c4[1],lwd=4)

abline(h=250, col=c4[1],lwd=1,lty=3)
#abline(h=75, col='red',lwd=1,lty=3)
abline(h=1100, col=c4[2],lwd=1,lty=3)
abline(h=2300, col=c4[3],lwd=1,lty=3)
abline(h=2900, col=c4[4],lwd=1,lty=3)
#abline(h=400, col='red',lwd=1,lty=3)
#legend("topleft", title="Initial FOI",legend = c('.5','2','5','10'),col=c4,lwd=2,ncol =2 , cex=.75)




#75 Percent FOI from population mean 
#par(mai=c(1,1,0.2,.1))

plot(AdultsMeans3_25_LinkedPop75,type="l",xlim=c(0,540),ylim=c(0,(rebound*2)),col=c4[4],lwd=4,
     xlab="Days After Last Intervention", ylab="Mean Adult Worm Burden",main="75% Population Linked FOI",cex.lab=1.5, cex.main=1.5)
lines(AdultsMeans3_10_LinkedPop75,col=c4[3],lwd=4)
lines(AdultsMeans3_2_LinkedPop75,col=c4[2],lwd=4)
lines(AdultsMeans3_0.5_LinkedPop75,col=c4[1],lwd=4)

abline(h=250, col=c4[1],lwd=1,lty=3)
#abline(h=75, col='red',lwd=1,lty=3)
abline(h=1100, col=c4[2],lwd=1,lty=3)
abline(h=2300, col=c4[3],lwd=1,lty=3)
abline(h=2900, col=c4[4],lwd=1,lty=3)
#abline(h=400, col='red',lwd=1,lty=3)

#legend("topleft", title="Initial FOI",legend = c('.5','2','5','10'),col=c4,lwd=2,ncol =2 , cex=.75)



#Fully linked to the mean value vs. initial value 

#par(mai=c(1,0,0.2,1))
plot(AdultsMeans3_25_LinkedPop,type="l",xlim=c(0,540),ylim=c(0,(rebound*2)),col=c4[4],lwd=4,
     xlab="Days After Last Intervention", ylab="",main="100% Population Linked FOI", yaxt="n",cex.lab=1.5, cex.main=1.5)
lines(AdultsMeans3_10_LinkedPop,col=c4[3],lwd=4)
lines(AdultsMeans3_2_LinkedPop,col=c4[2],lwd=4)
lines(AdultsMeans3_0.5_LinkedPop,col=c4[1],lwd=4)

abline(h=250, col=c4[1],lwd=1,lty=3)
#abline(h=75, col='red',lwd=1,lty=3)
abline(h=1100, col=c4[2],lwd=1,lty=3)
abline(h=2300, col=c4[3],lwd=1,lty=3)
abline(h=2900, col=c4[4],lwd=1,lty=3)
#abline(h=400, col='red',lwd=1,lty=3)
#legend("topleft", title="Initial FOI",legend = c('.5','2','5','10'),col=c4,lwd=2,ncol =2 , cex=.75)



