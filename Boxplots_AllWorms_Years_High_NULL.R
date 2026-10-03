#Distribution plot example
#ggplot(mpg, aes(x=reorder(manufacturer, cty, FUN=mean), y=cty)) + 
 # geom_jitter(colour="lightblue", alpha=0.5, width=0.1) +
  #geom_point(stat="summary", fun.y="mean") + 
  #geom_errorbar(stat="summary", fun.data="mean_se", fun.args = list(mult = 1.96), width=0) +
  #labs(x="Manufacturer", y="Mileage per gallon of fuel (mean + 95%CI)") +
  #theme_bw() +
  #theme(axis.text.x=element_text(angle=45, hjust=1)) 

#theme(text= element_text(size=10, family="serif")) 



library(tidyverse)
#library(hrbrthemes)
library(viridis)
library(grid)
library(ggpubr)

par(family = "serif")

# create a dataset

# monthsy=c( rep(1,nrow(result)),rep(2,nrow(result)),rep(3,nrow(result)),rep(4,nrow(result)),
#             rep(5,nrow(result)),rep(6,nrow(result)),rep(7,nrow(result)),rep(8,nrow(result)),
#             rep(9,nrow(result)),rep(10,nrow(result)),rep(11,nrow(result)),rep(12,nrow(result)))


monthsy=c( rep(1,runs*nsim),rep(2,runs*nsim),rep(3,runs*nsim),rep(4,runs*nsim),rep(5,runs*nsim),
            rep(6,runs*nsim),rep(7,runs*nsim),rep(8,runs*nsim),rep(9,runs*nsim),rep(10,runs*nsim),
            rep(11,runs*nsim),rep(12,runs*nsim))

my=c( rep(1,runs),rep(2,runs),rep(3,runs),rep(4,runs),rep(5,runs),
            rep(6,runs),rep(7,runs),rep(8,runs),rep(9,runs),rep(10,runs),
            rep(11,runs),rep(12,runs))


#As factors 

my2<-as.factor(monthsy)
my1=as.factor(my)



#End worm burden after treatments
#("EOutcome2yEndAll_",B,'_',aaa), EOutcome2yEndAll)      


#MWBOutcome2yEndAll<-as.vector(MWBOutcome2yEndAll_0.5_Unlinked)
#MWBOutcome3yEndAll<-as.vector(MWBOutcome3yEndAll_0.5_Unlinked)
#MWBOutcome5yEndAll<-as.vector(MWBOutcome5yEndAll_0.5_Unlinked)



#Mean worm burden after treatments
#MWBOutcome2yAll<- as.vector("MWBOutcome2yAll_",B,'_',aaa)

#MWBOutcome2yAll<- as.vector(MWBOutcome2yAll_0.5_Unlinked)
#MWBOutcome3yAll<- as.vector(MWBOutcome3yAll_0.5_Unlinked)
#MWBOutcome5yAll<- as.vector(MWBOutcome5yAll_0.5_Unlinked)



#UnlinkedHighHigh

#B=.5

Worms1<-as.vector(MWBOutcome2yAll_0.5_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_0.5_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=.5", title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_2y_0.5_UnHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_0.5_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_0.5_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_3y_0.5_UnHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_0.5_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_0.5_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_5y_0.5_UnHigh<-eee



# #B=1
# 
# Worms1<-as.vector(MWBOutcome2yAll_1_UnlinkedHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome2yEndAll_1_UnlinkedHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_1_UnHigh<-eee
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_1_UnlinkedHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_1_UnlinkedHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_1_UnHigh<-eee
# 
# 
# Worms1<-as.vector(MWBOutcome5yAll_1_UnlinkedHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_1_UnlinkedHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_1_UnHigh<-eee



#B=2
Worms1<-as.vector(MWBOutcome2yAll_2_UnlinkedHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_2_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_2y_2_UnHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_2_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_2_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_3y_2_UnHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_2_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_2_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_5y_2_UnHigh<-eee

#B=10
Worms1<-as.vector(MWBOutcome2yAll_10_UnlinkedHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_10_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_2y_10_UnHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_10_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_10_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_3y_10_UnHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_10_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_10_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_5y_10_UnHigh<-eee

#B=25
Worms1<-as.vector(MWBOutcome2yAll_25_UnlinkedHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_25_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_2y_25_UnHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_25_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_25_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_3y_25_UnHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_25_UnlinkedHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_25_UnlinkedHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_5y_25_UnHigh<-eee





# #Linked Plots
# #B=.5
# Worms1<-as.vector(MWBOutcome2yAll_0.5_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome2yEndAll_0.5_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_0.5_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_0.5_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_0.5_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_0.5_LinkedInd<-eee



# Worms1<-as.vector(MWBOutcome5yAll_0.5_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_0.5_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_0.5_LinkedInd<-eee


# 
# #B=1
# 
# Worms1<-as.vector(MWBOutcome2yAll_1_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# 
# Worms2<-as.vector(MWBOutcome2yEndAll_1_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_1_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_1_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_1_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_1_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome5yAll_1_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_1_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_1_LinkedInd<-eee




#B=2

# Worms1<-as.vector(MWBOutcome2yAll_2_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome2yEndAll_2_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_2_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_2_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_2_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_2_LinkedInd<-eee


# 
# Worms1<-as.vector(MWBOutcome5yAll_2_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_2_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_2_LinkedInd<-eee



#B=10
# Worms1<-as.vector(MWBOutcome2yAll_10_LinkedInd)
# my1=as.factor(my)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome2yEndAll_10_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_10_LinkedInd<-eee
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_10_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_10_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_10_LinkedInd<-eee


# Worms1<-as.vector(MWBOutcome5yAll_10_LinkedInd)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_10_LinkedInd)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_10_LinkedInd<-eee




#POPULATION LINKED

#Linked Plots
#B=.5
Worms1<-as.vector(MWBOutcome2yAll_0.5_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_0.5_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_2y_0.5_LinkedPopHigh<-eee



Worms1<-as.vector(MWBOutcome3yAll_0.5_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_0.5_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="100% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_3y_0.5_LinkedPopHigh<-eee


# 
Worms1<-as.vector(MWBOutcome5yAll_0.5_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_0.5_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_5y_0.5_LinkedPopHigh<-eee



#B=1

# Worms1<-as.vector(MWBOutcome2yAll_1_LinkedPopHigh)
# MWBMean<- data.frame(my1,Worms1)
# 
# Worms2<-as.vector(MWBOutcome2yEndAll_1_LinkedPopHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_1_LinkedPopHigh<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_1_LinkedPopHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_1_LinkedPopHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_1_LinkedPopHigh<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome5yAll_1_LinkedPopHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_1_LinkedPopHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_1_LinkedPopHigh<-eee
# 



#B=2

Worms1<-as.vector(MWBOutcome2yAll_2_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_2_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_2y_2_LinkedPopHigh<-eee



Worms1<-as.vector(MWBOutcome3yAll_2_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_2_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_3y_2_LinkedPopHigh<-eee



Worms1<-as.vector(MWBOutcome5yAll_2_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_2_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_5y_2_LinkedPopHigh<-eee



#B=10
Worms1<-as.vector(MWBOutcome2yAll_10_LinkedPopHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_10_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_2y_10_LinkedPopHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_10_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_10_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_3y_10_LinkedPopHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_10_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_10_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_5y_10_LinkedPopHigh<-eee

#B=25
Worms1<-as.vector(MWBOutcome2yAll_25_LinkedPopHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_25_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif"))  + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_2y_25_LinkedPopHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_25_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_25_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif")) + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_3y_25_LinkedPopHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_25_LinkedPopHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_25_LinkedPopHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_5y_25_LinkedPopHigh<-eee



#Linked Population 50 / Individual 50

#B=.5
Worms1<-as.vector(MWBOutcome2yAll_0.5_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_0.5_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_2y_0.5_LinkedPop50High<-eee



Worms1<-as.vector(MWBOutcome3yAll_0.5_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_0.5_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_3y_0.5_LinkedPop50High<-eee


# 
Worms1<-as.vector(MWBOutcome5yAll_0.5_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_0.5_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_5y_0.5_LinkedPop50High<-eee




#B=2

Worms1<-as.vector(MWBOutcome2yAll_2_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_2_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_2y_2_LinkedPop50High<-eee



Worms1<-as.vector(MWBOutcome3yAll_2_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_2_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_3y_2_LinkedPop50High<-eee



Worms1<-as.vector(MWBOutcome5yAll_2_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_2_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_5y_2_LinkedPop50High<-eee



#B=10
Worms1<-as.vector(MWBOutcome2yAll_10_LinkedPop50High)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_10_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_2y_10_LinkedPop50High<-eee


Worms1<-as.vector(MWBOutcome3yAll_10_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_10_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_3y_10_LinkedPop50High<-eee


Worms1<-as.vector(MWBOutcome5yAll_10_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_10_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_5y_10_LinkedPop50High<-eee

#B=25
Worms1<-as.vector(MWBOutcome2yAll_25_LinkedPop50High)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_25_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_2y_25_LinkedPop50High<-eee


Worms1<-as.vector(MWBOutcome3yAll_25_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_25_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_3y_25_LinkedPop50High<-eee


Worms1<-as.vector(MWBOutcome5yAll_25_LinkedPop50High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_25_LinkedPop50High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))+ ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_5y_25_LinkedPop50High<-eee



#New population linked - percentage above original


#Linked Population 75

#B=.5
Worms1<-as.vector(MWBOutcome2yAll_0.5_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_0.5_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_2y_0.5_LinkedPop75High<-eee



Worms1<-as.vector(MWBOutcome3yAll_0.5_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_0.5_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_3y_0.5_LinkedPop75High<-eee



Worms1<-as.vector(MWBOutcome5yAll_0.5_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_0.5_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,25)
eee

#rename with _B and _Number of y
MWBPlot_5y_0.5_LinkedPop75High<-eee




#B=2

Worms1<-as.vector(MWBOutcome2yAll_2_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_2_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_2y_2_LinkedPop75High<-eee



Worms1<-as.vector(MWBOutcome3yAll_2_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_2_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_3y_2_LinkedPop75High<-eee


Worms1<-as.vector(MWBOutcome5yAll_2_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_2_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,80)
eee

#rename with _B and _Number of y
MWBPlot_5y_2_LinkedPop75High<-eee





#B=10
Worms1<-as.vector(MWBOutcome2yAll_10_LinkedPop75High)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_10_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_2y_10_LinkedPop75High<-eee


Worms1<-as.vector(MWBOutcome3yAll_10_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_10_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_3y_10_LinkedPop75High<-eee




Worms1<-as.vector(MWBOutcome5yAll_10_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_10_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  + ylim(0,250)
eee

#rename with _B and _Number of y
MWBPlot_5y_10_LinkedPop75High<-eee

# 
# 

#B=25
Worms1<-as.vector(MWBOutcome2yAll_25_LinkedPop75High)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_25_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif"))  + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_2y_25_LinkedPop75High<-eee


Worms1<-as.vector(MWBOutcome3yAll_25_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_25_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_3y_25_LinkedPop75High<-eee




Worms1<-as.vector(MWBOutcome5yAll_25_LinkedPop75High)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_25_LinkedPop75High)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) + ylim(0,400)
eee

#rename with _B and _Number of y
MWBPlot_5y_25_LinkedPop75High<-eee

# 
# #Unlinked Combined Plot (B and y )
figureUnlinkedHigh<- ggarrange(MWBPlot_2y_0.5_UnHigh, MWBPlot_2y_2_UnHigh, MWBPlot_2y_10_UnHigh,
                          MWBPlot_3y_0.5_UnHigh, MWBPlot_3y_2_UnHigh, MWBPlot_3y_10_UnHigh,
                          MWBPlot_5y_0.5_UnHigh, MWBPlot_5y_2_UnHigh, MWBPlot_5y_10_UnHigh,
                          ncol = 3, nrow = 3)
# #figureUnlinked
# 
# 
# 
# 
# figureLinkedInd<- ggarrange(MWBPlot_2y_0.5_LinkedInd, MWBPlot_2y_2_LinkedInd, MWBPlot_2y_10_LinkedInd, 
#                            MWBPlot_3y_0.5_LinkedInd, MWBPlot_3y_2_LinkedInd, MWBPlot_3y_10_LinkedInd,
#                            MWBPlot_5y_0.5_LinkedInd, MWBPlot_5y_2_LinkedInd, MWBPlot_5y_10_LinkedInd,
#                            ncol = 3, nrow = 3)
# #figureLinkedInd
# 
# 
figureLinkedPopHigh <- ggarrange(MWBPlot_2y_0.5_LinkedPopHigh, MWBPlot_2y_2_LinkedPopHigh, MWBPlot_2y_10_LinkedPopHigh,
                            MWBPlot_3y_0.5_LinkedPopHigh, MWBPlot_3y_2_LinkedPopHigh, MWBPlot_3y_10_LinkedPopHigh,
                            MWBPlot_5y_0.5_LinkedPopHigh, MWBPlot_5y_2_LinkedPopHigh, MWBPlot_5y_10_LinkedPopHigh,
                            ncol = 3, nrow = 3)
# 
# 
# 
figureLinkedPop50High <- ggarrange(MWBPlot_2y_0.5_LinkedPop50High, MWBPlot_2y_2_LinkedPop50High, MWBPlot_2y_10_LinkedPop50High,
                             MWBPlot_3y_0.5_LinkedPop50High, MWBPlot_3y_2_LinkedPop50High, MWBPlot_3y_10_LinkedPop50High,
                             MWBPlot_5y_0.5_LinkedPop50High, MWBPlot_5y_2_LinkedPop50High, MWBPlot_5y_10_LinkedPop50High,
                             ncol = 3, nrow = 3)
# 
# 

figureLinkedPop75High <- ggarrange(MWBPlot_2y_0.5_LinkedPop75High, MWBPlot_2y_2_LinkedPop75High, MWBPlot_2y_10_LinkedPop75High,
                             MWBPlot_3y_0.5_LinkedPop75High, MWBPlot_3y_2_LinkedPop75High, MWBPlot_3y_10_LinkedPop75High,
                             MWBPlot_5y_0.5_LinkedPop75High, MWBPlot_5y_2_LinkedPop75High, MWBPlot_5y_10_LinkedPop75High,
                             ncol = 3, nrow = 3)





#ADULT FEMALE OUTCOMES!



#UnlinkedHigh

#B=.5
Worms1<-as.vector(AfOutcome2yAll_0.5_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_0.5_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_0.5_UnHigh<-eee


Worms1<-as.vector(AfOutcome3yAll_0.5_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_0.5_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +

  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_0.5_UnHigh<-eee


Worms1<-as.vector(AfOutcome5yAll_0.5_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_0.5_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_0.5_UnHigh<-eee



# #B=1
# 
# Worms1<-as.vector(AfOutcome2yAll_1_UnlinkedHigh)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome2yEndAll_1_UnlinkedHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_1_UnHigh<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_1_UnlinkedHigh)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_1_UnlinkedHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_1_UnHigh<-eee
# 
# 
# Worms1<-as.vector(AfOutcome5yAll_1_UnlinkedHigh)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_1_UnlinkedHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_1_UnHigh<-eee



#B=2
Worms1<-as.vector(AfOutcome2yAll_2_UnlinkedHigh)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_2_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_2_UnHigh<-eee


Worms1<-as.vector(AfOutcome3yAll_2_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_2_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_2_UnHigh<-eee


Worms1<-as.vector(AfOutcome5yAll_2_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_2_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_2_UnHigh<-eee

#B=10
Worms1<-as.vector(AfOutcome2yAll_10_UnlinkedHigh)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_10_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_10_UnHigh<-eee


Worms1<-as.vector(AfOutcome3yAll_10_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_10_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_10_UnHigh<-eee


Worms1<-as.vector(AfOutcome5yAll_10_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_10_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_10_UnHigh<-eee



#B=25
Worms1<-as.vector(AfOutcome2yAll_25_UnlinkedHigh)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_25_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_25_UnHigh<-eee


Worms1<-as.vector(AfOutcome3yAll_25_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_25_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_25_UnHigh<-eee


Worms1<-as.vector(AfOutcome5yAll_25_UnlinkedHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_25_UnlinkedHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_25_UnHigh<-eee



# #Linked Plots
# #B=.5
# Worms1<-as.vector(AfOutcome2yAll_0.5_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome2yEndAll_0.5_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_0.5_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_0.5_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_0.5_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_0.5_LinkedInd<-eee



# Worms1<-as.vector(AfOutcome5yAll_0.5_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_0.5_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_0.5_LinkedInd<-eee


# 
# #B=1
# 
# Worms1<-as.vector(AfOutcome2yAll_1_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# 
# Worms2<-as.vector(AfOutcome2yEndAll_1_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_1_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_1_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_1_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_1_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome5yAll_1_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_1_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_1_LinkedInd<-eee




#B=2

# Worms1<-as.vector(AfOutcome2yAll_2_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome2yEndAll_2_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_2_LinkedInd<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_2_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_2_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_2_LinkedInd<-eee


# 
# Worms1<-as.vector(AfOutcome5yAll_2_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_2_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_2_LinkedInd<-eee



#B=10
# Worms1<-as.vector(AfOutcome2yAll_10_LinkedInd)
# my1=as.factor(my)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome2yEndAll_10_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_10_LinkedInd<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_10_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_10_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_10_LinkedInd<-eee


# Worms1<-as.vector(AfOutcome5yAll_10_LinkedInd)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_10_LinkedInd)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_10_LinkedInd<-eee




#POPULATION LINKED

#Linked Plots
#B=.5
Worms1<-as.vector(AfOutcome2yAll_0.5_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_0.5_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=.5", title="100% Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_0.5_LinkedPopHigh<-eee



Worms1<-as.vector(AfOutcome3yAll_0.5_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_0.5_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="100% Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_0.5_LinkedPopHigh<-eee


# 
Worms1<-as.vector(AfOutcome5yAll_0.5_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_0.5_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_0.5_LinkedPopHigh<-eee



#B=1

# Worms1<-as.vector(AfOutcome2yAll_1_LinkedPopHigh)
# AfMean<- data.frame(my1,Worms1)
# 
# Worms2<-as.vector(AfOutcome2yEndAll_1_LinkedPopHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_2y_1_LinkedPopHigh<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome3yAll_1_LinkedPopHigh)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome3yEndAll_1_LinkedPopHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_3y_1_LinkedPopHigh<-eee
# 
# 
# 
# Worms1<-as.vector(AfOutcome5yAll_1_LinkedPopHigh)
# AfMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(AfOutcome5yEndAll_1_LinkedPopHigh)
# AfAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="serif")) 
# eee
# 
# #rename with _B and _Number of y
# AfPlot_5y_1_LinkedPopHigh<-eee
# 



#B=2

Worms1<-as.vector(AfOutcome2yAll_2_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_2_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_2_LinkedPopHigh<-eee



Worms1<-as.vector(AfOutcome3yAll_2_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_2_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_2_LinkedPopHigh<-eee



Worms1<-as.vector(AfOutcome5yAll_2_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_2_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_2_LinkedPopHigh<-eee



#B=10
Worms1<-as.vector(AfOutcome2yAll_10_LinkedPopHigh)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_10_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_10_LinkedPopHigh<-eee


Worms1<-as.vector(AfOutcome2yAll_25_LinkedPopHigh)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_25_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_25_LinkedPopHigh<-eee

Worms1<-as.vector(AfOutcome3yAll_10_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_10_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_10_LinkedPopHigh<-eee

Worms1<-as.vector(AfOutcome3yAll_25_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_25_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_25_LinkedPopHigh<-eee



Worms1<-as.vector(AfOutcome5yAll_10_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_10_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_10_LinkedPopHigh<-eee



Worms1<-as.vector(AfOutcome5yAll_25_LinkedPopHigh)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_25_LinkedPopHigh)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_25_LinkedPopHigh<-eee




#Linked Population 50 / Individual 50

#B=.5
Worms1<-as.vector(AfOutcome2yAll_0.5_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_0.5_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_0.5_LinkedPop50High<-eee



Worms1<-as.vector(AfOutcome3yAll_0.5_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_0.5_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_3y_0.5_LinkedPop50High<-eee


# 
Worms1<-as.vector(AfOutcome5yAll_0.5_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_0.5_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_5y_0.5_LinkedPop50High<-eee




#B=2

Worms1<-as.vector(AfOutcome2yAll_2_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_2_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_2y_2_LinkedPop50High<-eee



Worms1<-as.vector(AfOutcome3yAll_2_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_2_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_2_LinkedPop50High<-eee



Worms1<-as.vector(AfOutcome5yAll_2_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_2_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_2_LinkedPop50High<-eee



#B=10
Worms1<-as.vector(AfOutcome2yAll_10_LinkedPop50High)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_10_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_10_LinkedPop50High<-eee



Worms1<-as.vector(AfOutcome2yAll_25_LinkedPop50High)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_25_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_25_LinkedPop50High<-eee


Worms1<-as.vector(AfOutcome3yAll_10_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_10_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_10_LinkedPop50High<-eee


Worms1<-as.vector(AfOutcome3yAll_25_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_25_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_3y_25_LinkedPop50High<-eee

Worms1<-as.vector(AfOutcome5yAll_10_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_10_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_10_LinkedPop50High<-eee

Worms1<-as.vector(AfOutcome5yAll_25_LinkedPop50High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_25_LinkedPop50High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))
eee

#rename with _B and _Number of y
AfPlot_5y_25_LinkedPop50High<-eee




#New population linked - percentage above original


#Linked Population 75

#B=.5
Worms1<-as.vector(AfOutcome2yAll_0.5_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_0.5_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif")) 
eee

#rename with _B and _Number of y
AfPlot_2y_0.5_LinkedPop75High<-eee



Worms1<-as.vector(AfOutcome3yAll_0.5_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_0.5_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_3y_0.5_LinkedPop75High<-eee



Worms1<-as.vector(AfOutcome5yAll_0.5_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_0.5_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=.5")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_5y_0.5_LinkedPop75High<-eee



#B=2

Worms1<-as.vector(AfOutcome2yAll_2_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_2_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_2y_2_LinkedPop75High<-eee



Worms1<-as.vector(AfOutcome3yAll_2_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_2_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_3y_2_LinkedPop75High<-eee


Worms1<-as.vector(AfOutcome5yAll_2_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_2_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_5y_2_LinkedPop75High<-eee





#B=10
Worms1<-as.vector(AfOutcome2yAll_10_LinkedPop75High)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_10_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) 
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_2y_10_LinkedPop75High<-eee

Worms1<-as.vector(AfOutcome2yAll_25_LinkedPop75High)
my1=as.factor(my)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome2yEndAll_25_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nTwo Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))  
eee

#rename with _B and _Number of y
AfPlot_2y_25_LinkedPop75High<-eee


Worms1<-as.vector(AfOutcome3yAll_10_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_10_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))   
eee

#rename with _B and _Number of y
AfPlot_3y_10_LinkedPop75High<-eee


Worms1<-as.vector(AfOutcome3yAll_25_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome3yEndAll_25_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))   
eee

#rename with _B and _Number of y
AfPlot_3y_25_LinkedPop75High<-eee





Worms1<-as.vector(AfOutcome5yAll_10_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_10_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))   
eee

#rename with _B and _Number of y
AfPlot_5y_10_LinkedPop75High<-eee





Worms1<-as.vector(AfOutcome5yAll_25_LinkedPop75High)
AfMean<- data.frame(my1,Worms1)
Worms2<-as.vector(AfOutcome5yEndAll_25_LinkedPop75High)
AfAll2<- data.frame(my2,Worms2)

eee<-ggplot(AfAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total AF Schistosomes after \nFive Years",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="serif"))   
eee

#rename with _B and _Number of y
AfPlot_5y_25_LinkedPop75High<-eee


# 
# 
# 
# #Unlinked Combined Plot (B and y )
figureUnlinkedHigh<- ggarrange(AfPlot_2y_0.5_UnHigh, AfPlot_2y_2_UnHigh, AfPlot_2y_10_UnHigh,
                               AfPlot_3y_0.5_UnHigh, AfPlot_3y_2_UnHigh, AfPlot_3y_10_UnHigh,
                               AfPlot_5y_0.5_UnHigh, AfPlot_5y_2_UnHigh, AfPlot_5y_10_UnHigh,
                               ncol = 3, nrow = 3)
# #figureUnlinked
# 
# 
# 
# 
# figureLinkedInd<- ggarrange(AfPlot_2y_0.5_LinkedInd, AfPlot_2y_2_LinkedInd, AfPlot_2y_10_LinkedInd, 
#                            AfPlot_3y_0.5_LinkedInd, AfPlot_3y_2_LinkedInd, AfPlot_3y_10_LinkedInd,
#                            AfPlot_5y_0.5_LinkedInd, AfPlot_5y_2_LinkedInd, AfPlot_5y_10_LinkedInd,
#                            ncol = 3, nrow = 3)
# #figureLinkedInd
# 
# 
figureLinkedPopHigh_Af <- ggarrange(AfPlot_2y_0.5_LinkedPopHigh, AfPlot_2y_2_LinkedPopHigh, AfPlot_2y_10_LinkedPopHigh,
                                 AfPlot_3y_0.5_LinkedPopHigh, AfPlot_3y_2_LinkedPopHigh, AfPlot_3y_10_LinkedPopHigh,
                                 AfPlot_5y_0.5_LinkedPopHigh, AfPlot_5y_2_LinkedPopHigh, AfPlot_5y_10_LinkedPopHigh,
                                 ncol = 3, nrow = 3)
# 
# 
# 
figureLinkedPop50High_Af <- ggarrange(AfPlot_2y_0.5_LinkedPop50High, AfPlot_2y_2_LinkedPop50High, AfPlot_2y_10_LinkedPop50High,
                                   AfPlot_3y_0.5_LinkedPop50High, AfPlot_3y_2_LinkedPop50High, AfPlot_3y_10_LinkedPop50High,
                                   AfPlot_5y_0.5_LinkedPop50High, AfPlot_5y_2_LinkedPop50High, AfPlot_5y_10_LinkedPop50High,
                                   ncol = 3, nrow = 3)
# 
# 

figureLinkedPop75High_Af <- ggarrange(AfPlot_2y_0.5_LinkedPop75High, AfPlot_2y_2_LinkedPop75High, AfPlot_2y_10_LinkedPop75High,
                                   AfPlot_3y_0.5_LinkedPop75High, AfPlot_3y_2_LinkedPop75High, AfPlot_3y_10_LinkedPop75High,
                                   AfPlot_5y_0.5_LinkedPop75High, AfPlot_5y_2_LinkedPop75High, AfPlot_5y_10_LinkedPop75High,
                                   ncol = 3, nrow = 3)






#Figures by Year

figure2y_High<-ggarrange(MWBPlot_2y_0.5_UnHigh, MWBPlot_2y_0.5_LinkedPop50High, MWBPlot_2y_0.5_LinkedPop75High, MWBPlot_2y_0.5_LinkedPopHigh,
                         MWBPlot_2y_2_UnHigh, MWBPlot_2y_2_LinkedPop50High, MWBPlot_2y_2_LinkedPop75High, MWBPlot_2y_2_LinkedPopHigh,
                         MWBPlot_2y_10_UnHigh, MWBPlot_2y_10_LinkedPop50High, MWBPlot_2y_10_LinkedPop75High, MWBPlot_2y_10_LinkedPopHigh,
                         MWBPlot_2y_25_UnHigh, MWBPlot_2y_25_LinkedPop50High, MWBPlot_2y_25_LinkedPop75High, MWBPlot_2y_25_LinkedPopHigh,
                         ncol=4, nrow=4)
  

figure3y_High<-ggarrange(MWBPlot_3y_0.5_UnHigh, MWBPlot_3y_0.5_LinkedPop50High, MWBPlot_3y_0.5_LinkedPop75High, MWBPlot_3y_0.5_LinkedPopHigh,
                         MWBPlot_3y_2_UnHigh, MWBPlot_3y_2_LinkedPop50High, MWBPlot_3y_2_LinkedPop75High, MWBPlot_3y_2_LinkedPopHigh,
                         MWBPlot_3y_10_UnHigh, MWBPlot_3y_10_LinkedPop50High, MWBPlot_3y_10_LinkedPop75High, MWBPlot_3y_10_LinkedPopHigh,
                         MWBPlot_3y_25_UnHigh, MWBPlot_3y_25_LinkedPop50High, MWBPlot_3y_25_LinkedPop75High, MWBPlot_3y_25_LinkedPopHigh,
                         ncol=4, nrow=4)


figure5y_High<-ggarrange(MWBPlot_5y_0.5_UnHigh, MWBPlot_5y_0.5_LinkedPop50High, MWBPlot_5y_0.5_LinkedPop75High, MWBPlot_5y_0.5_LinkedPopHigh,
                         MWBPlot_5y_2_UnHigh, MWBPlot_5y_2_LinkedPop50High, MWBPlot_5y_2_LinkedPop75High, MWBPlot_5y_2_LinkedPopHigh,
                         MWBPlot_5y_10_UnHigh, MWBPlot_5y_10_LinkedPop50High, MWBPlot_5y_10_LinkedPop75High, MWBPlot_5y_10_LinkedPopHigh,
                         MWBPlot_5y_25_UnHigh, MWBPlot_5y_25_LinkedPop50High, MWBPlot_5y_25_LinkedPop75High, MWBPlot_5y_25_LinkedPopHigh,
                         ncol=4, nrow=4)
  



figure2y_High_Af<-ggarrange(AfPlot_2y_0.5_UnHigh, AfPlot_2y_0.5_LinkedPop50High, AfPlot_2y_0.5_LinkedPop75High, AfPlot_2y_0.5_LinkedPopHigh,
                         AfPlot_2y_2_UnHigh, AfPlot_2y_2_LinkedPop50High, AfPlot_2y_2_LinkedPop75High, AfPlot_2y_2_LinkedPopHigh,
                         AfPlot_2y_10_UnHigh, AfPlot_2y_10_LinkedPop50High, AfPlot_2y_10_LinkedPop75High, AfPlot_2y_10_LinkedPopHigh,
                         AfPlot_2y_25_UnHigh, AfPlot_2y_25_LinkedPop50High, AfPlot_2y_25_LinkedPop75High, AfPlot_2y_25_LinkedPopHigh,
                         ncol=4, nrow=4)


figure3y_High_Af<-ggarrange(AfPlot_3y_0.5_UnHigh, AfPlot_3y_0.5_LinkedPop50High, AfPlot_3y_0.5_LinkedPop75High, AfPlot_3y_0.5_LinkedPopHigh,
                         AfPlot_3y_2_UnHigh, AfPlot_3y_2_LinkedPop50High, AfPlot_3y_2_LinkedPop75High, AfPlot_3y_2_LinkedPopHigh,
                         AfPlot_3y_10_UnHigh, AfPlot_3y_10_LinkedPop50High, AfPlot_3y_10_LinkedPop75High, AfPlot_3y_10_LinkedPopHigh,
                         AfPlot_3y_25_UnHigh, AfPlot_3y_25_LinkedPop50High, AfPlot_3y_25_LinkedPop75High, AfPlot_3y_25_LinkedPopHigh,
                         ncol=4, nrow=4)


figure5y_High_Af<-ggarrange(AfPlot_5y_0.5_UnHigh, AfPlot_5y_0.5_LinkedPop50High, AfPlot_5y_0.5_LinkedPop75High, AfPlot_5y_0.5_LinkedPopHigh,
                         AfPlot_5y_2_UnHigh, AfPlot_5y_2_LinkedPop50High, AfPlot_5y_2_LinkedPop75High, AfPlot_5y_2_LinkedPopHigh,
                         AfPlot_5y_10_UnHigh, AfPlot_5y_10_LinkedPop50High, AfPlot_5y_10_LinkedPop75High, AfPlot_5y_10_LinkedPopHigh,
                         AfPlot_5y_25_UnHigh, AfPlot_5y_25_LinkedPop50High, AfPlot_5y_25_LinkedPop75High, AfPlot_5y_25_LinkedPopHigh,
                         ncol=4, nrow=4)


# Annotate the figure by adding a common labels
annotate_figure(figure3y_High,
  bottom = text_grob("Months Between Treatments", family="serif"),
                left = text_grob("Total Schistosomes after Three Years", rot = 90, family="serif"))
        


annotate_figure(figure3y_High_Af,
                bottom = text_grob("Months Between Treatments", family="serif"),
                left = text_grob("Adult Female Schistosomes after Three Years", rot = 90, family="serif"))

