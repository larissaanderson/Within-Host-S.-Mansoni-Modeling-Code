





library(tidyverse)
#library(hrbrthemes)
library(viridis)
library(grid)
library(ggpubr)

par(family = "LM Roman 10")

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





#POPULATION LINKED

#Linked Plots
#B=.5
Worms1<-as.vector(MWBOutcome2yAll_0.5_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_0.5_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Two Year Intervention")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,40)
eee

#rename with _B and _Number of y
MWBPlot_2y_0.5_LinkedIndHigh<-eee



Worms1<-as.vector(MWBOutcome3yAll_0.5_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_0.5_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="Three Year Intervention")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,40)
eee

#rename with _B and _Number of y
MWBPlot_3y_0.5_LinkedIndHigh<-eee


# 
Worms1<-as.vector(MWBOutcome5yAll_0.5_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_0.5_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Five Year Intervention")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,40)
eee

#rename with _B and _Number of y
MWBPlot_5y_0.5_LinkedIndHigh<-eee



#B=1

# Worms1<-as.vector(MWBOutcome2yAll_1_LinkedIndHigh)
# MWBMean<- data.frame(my1,Worms1)
# 
# Worms2<-as.vector(MWBOutcome2yEndAll_1_LinkedIndHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_2y_1_LinkedIndHigh<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome3yAll_1_LinkedIndHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome3yEndAll_1_LinkedIndHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_3y_1_LinkedIndHigh<-eee
# 
# 
# 
# Worms1<-as.vector(MWBOutcome5yAll_1_LinkedIndHigh)
# MWBMean<- data.frame(my1,Worms1)
# Worms2<-as.vector(MWBOutcome5yEndAll_1_LinkedIndHigh)
# MWBAll2<- data.frame(my2,Worms2)
# 
# eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# MWBPlot_5y_1_LinkedIndHigh<-eee
# 



#B=2

Worms1<-as.vector(MWBOutcome2yAll_2_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_2_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,100)
eee

#rename with _B and _Number of y
MWBPlot_2y_2_LinkedIndHigh<-eee



Worms1<-as.vector(MWBOutcome3yAll_2_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_2_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,100)
eee

#rename with _B and _Number of y
MWBPlot_3y_2_LinkedIndHigh<-eee



Worms1<-as.vector(MWBOutcome5yAll_2_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_2_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,100)
eee

#rename with _B and _Number of y
MWBPlot_5y_2_LinkedIndHigh<-eee



#B=10
Worms1<-as.vector(MWBOutcome2yAll_10_LinkedIndHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_10_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,350)
eee

#rename with _B and _Number of y
MWBPlot_2y_10_LinkedIndHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_10_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_10_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,350)
eee

#rename with _B and _Number of y
MWBPlot_3y_10_LinkedIndHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_10_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_10_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,350)
eee

#rename with _B and _Number of y
MWBPlot_5y_10_LinkedIndHigh<-eee

#B=25
Worms1<-as.vector(MWBOutcome2yAll_25_LinkedIndHigh)
my1=as.factor(my)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome2yEndAll_25_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,700)
eee

#rename with _B and _Number of y
MWBPlot_2y_25_LinkedIndHigh<-eee


Worms1<-as.vector(MWBOutcome3yAll_25_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome3yEndAll_25_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,700)
eee

#rename with _B and _Number of y
MWBPlot_3y_25_LinkedIndHigh<-eee


Worms1<-as.vector(MWBOutcome5yAll_25_LinkedIndHigh)
MWBMean<- data.frame(my1,Worms1)
Worms2<-as.vector(MWBOutcome5yEndAll_25_LinkedIndHigh)
MWBAll2<- data.frame(my2,Worms2)

eee<-ggplot(MWBAll2, aes(x=my2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = MWBMean,aes(x=my1, y=Worms1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,700)
eee

#rename with _B and _Number of y
MWBPlot_5y_25_LinkedIndHigh<-eee


figureInd_High<-ggarrange(MWBPlot_2y_0.5_LinkedIndHigh,MWBPlot_3y_0.5_LinkedIndHigh,MWBPlot_5y_0.5_LinkedIndHigh,
                         MWBPlot_2y_2_LinkedIndHigh,MWBPlot_3y_2_LinkedIndHigh,MWBPlot_5y_2_LinkedIndHigh,
                         MWBPlot_2y_10_LinkedIndHigh,MWBPlot_3y_10_LinkedIndHigh,MWBPlot_5y_10_LinkedIndHigh,
                         MWBPlot_2y_25_LinkedIndHigh,MWBPlot_3y_25_LinkedIndHigh,MWBPlot_5y_25_LinkedIndHigh,
                         ncol=3, nrow=4)