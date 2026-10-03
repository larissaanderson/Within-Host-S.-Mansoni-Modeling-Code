#Distribution plot example
#ggplot(mpg, aes(x=reorder(manufacturer, cty, FUN=mean), y=cty)) + 
# geom_jitter(colour="lightblue", alpha=0.5, width=0.1) +
#geom_point(stat="summary", fun.y="mean") + 
#geom_errorbar(stat="summary", fun.data="mean_se", fun.args = list(mult = 1.96), width=0) +
#labs(x="Manufacturer", y="Mileage per gallon of fuel (mean + 95%CI)") +
#theme_bw() +
#theme(axis.text.x=element_text(angle=45, hjust=1)) 

#theme(text= element_text(size=10, family="LM Roman 10")) 



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



#End worm burden after treatments
#("EOutcome2yEndAll_",B,'_',aaa), EOutcome2yEndAll)      


#EOutcome2yEndAll<-as.vector(EOutcome2yEndAll_0.5_Unlinked)
#EOutcome3yEndAll<-as.vector(EOutcome3yEndAll_0.5_Unlinked)
#EOutcome5yEndAll<-as.vector(EOutcome5yEndAll_0.5_Unlinked)



#Mean worm burden after treatments
#EOutcome2yAll<- as.vector("EOutcome2yAll_",B,'_',aaa)

#EOutcome2yAll<- as.vector(EOutcome2yAll_0.5_Unlinked)
#EOutcome3yAll<- as.vector(EOutcome3yAll_0.5_Unlinked)
#EOutcome5yAll<- as.vector(EOutcome5yAll_0.5_Unlinked)



#Unlinked

#B=.5

Eggs1<-as.vector(EOutcome2yAll_0.5_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_0.5_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_2y_0.5_Un<-eee


Eggs1<-as.vector(EOutcome3yAll_0.5_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_0.5_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_3y_0.5_Un<-eee


Eggs1<-as.vector(EOutcome5yAll_0.5_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_0.5_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="Unlinked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_5y_0.5_Un<-eee



# #B=1
# 
# Eggs1<-as.vector(EOutcome2yAll_1_Unlinked)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome2yEndAll_1_Unlinked)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_1_Un<-eee
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_1_Unlinked)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_1_Unlinked)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_1_Un<-eee
# 
# 
# Eggs1<-as.vector(EOutcome5yAll_1_Unlinked)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_1_Unlinked)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_1_Un<-eee



#B=2
Eggs1<-as.vector(EOutcome2yAll_2_Unlinked)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_2_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_2y_2_Un<-eee


Eggs1<-as.vector(EOutcome3yAll_2_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_2_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_3y_2_Un<-eee


Eggs1<-as.vector(EOutcome5yAll_2_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_2_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_5y_2_Un<-eee

#B=10
Eggs1<-as.vector(EOutcome2yAll_10_Unlinked)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_10_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_2y_10_Un<-eee


Eggs1<-as.vector(EOutcome3yAll_10_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_10_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_3y_10_Un<-eee


Eggs1<-as.vector(EOutcome5yAll_10_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_10_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_5y_10_Un<-eee

#B=25
Eggs1<-as.vector(EOutcome2yAll_25_Unlinked)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_25_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_2y_25_Un<-eee


Eggs1<-as.vector(EOutcome3yAll_25_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_25_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_3y_25_Un<-eee


Eggs1<-as.vector(EOutcome5yAll_25_Unlinked)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_25_Unlinked)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_5y_25_Un<-eee





# #Linked Plots
# #B=.5
# Eggs1<-as.vector(EOutcome2yAll_0.5_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome2yEndAll_0.5_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_0.5_LinkedInd<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_0.5_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_0.5_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_0.5_LinkedInd<-eee



# Eggs1<-as.vector(EOutcome5yAll_0.5_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_0.5_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=.5")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_0.5_LinkedInd<-eee


# 
# #B=1
# 
# Eggs1<-as.vector(EOutcome2yAll_1_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# 
# Eggs2<-as.vector(EOutcome2yEndAll_1_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_1_LinkedInd<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_1_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_1_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_1_LinkedInd<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome5yAll_1_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_1_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_1_LinkedInd<-eee




#B=2

# Eggs1<-as.vector(EOutcome2yAll_2_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome2yEndAll_2_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_2_LinkedInd<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_2_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_2_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_2_LinkedInd<-eee


# 
# Eggs1<-as.vector(EOutcome5yAll_2_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_2_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=2")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_2_LinkedInd<-eee



#B=10
# Eggs1<-as.vector(EOutcome2yAll_10_LinkedInd)
# my1=as.factor(my)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome2yEndAll_10_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_10_LinkedInd<-eee
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_10_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_10_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_10_LinkedInd<-eee


# Eggs1<-as.vector(EOutcome5yAll_10_LinkedInd)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_10_LinkedInd)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=10")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_10_LinkedInd<-eee




#POPULATION LINKED

#Linked Plots
#B=.5
Eggs1<-as.vector(EOutcome2yAll_0.5_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_0.5_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="100% Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_2y_0.5_LinkedPop<-eee



Eggs1<-as.vector(EOutcome3yAll_0.5_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_0.5_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="100% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_3y_0.5_LinkedPop<-eee


# 
Eggs1<-as.vector(EOutcome5yAll_0.5_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_0.5_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="100% Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_5y_0.5_LinkedPop<-eee



#B=1

# Eggs1<-as.vector(EOutcome2yAll_1_LinkedPop)
# EggMean<- data.frame(my1,Eggs1)
# 
# Eggs2<-as.vector(EOutcome2yEndAll_1_LinkedPop)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_2y_1_LinkedPop<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome3yAll_1_LinkedPop)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome3yEndAll_1_LinkedPop)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_3y_1_LinkedPop<-eee
# 
# 
# 
# Eggs1<-as.vector(EOutcome5yAll_1_LinkedPop)
# EggMean<- data.frame(my1,Eggs1)
# Eggs2<-as.vector(EOutcome5yEndAll_1_LinkedPop)
# EggsAll2<- data.frame(my2,Eggs2)
# 
# eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                subtitle="B=1")+
#   theme(plot.subtitle = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of y
# EPlot_5y_1_LinkedPop<-eee
# 



#B=2

Eggs1<-as.vector(EOutcome2yAll_2_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_2_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_2y_2_LinkedPop<-eee



Eggs1<-as.vector(EOutcome3yAll_2_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_2_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_3y_2_LinkedPop<-eee



Eggs1<-as.vector(EOutcome5yAll_2_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_2_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_5y_2_LinkedPop<-eee



#B=10
Eggs1<-as.vector(EOutcome2yAll_10_LinkedPop)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_10_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_2y_10_LinkedPop<-eee


Eggs1<-as.vector(EOutcome3yAll_10_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_10_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_3y_10_LinkedPop<-eee


Eggs1<-as.vector(EOutcome5yAll_10_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_10_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_5y_10_LinkedPop<-eee

#B=25
Eggs1<-as.vector(EOutcome2yAll_25_LinkedPop)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_25_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_2y_25_LinkedPop<-eee


Eggs1<-as.vector(EOutcome3yAll_25_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_25_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_3y_25_LinkedPop<-eee


Eggs1<-as.vector(EOutcome5yAll_25_LinkedPop)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_25_LinkedPop)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_5y_25_LinkedPop<-eee



#Linked Population 50 / Individual 50

#B=.5
Eggs1<-as.vector(EOutcome2yAll_0.5_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_0.5_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_2y_0.5_LinkedPop50<-eee



Eggs1<-as.vector(EOutcome3yAll_0.5_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_0.5_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_3y_0.5_LinkedPop50<-eee


# 
Eggs1<-as.vector(EOutcome5yAll_0.5_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_0.5_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="50% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_5y_0.5_LinkedPop50<-eee




#B=2

Eggs1<-as.vector(EOutcome2yAll_2_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_2_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_2y_2_LinkedPop50<-eee



Eggs1<-as.vector(EOutcome3yAll_2_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_2_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_3y_2_LinkedPop50<-eee



Eggs1<-as.vector(EOutcome5yAll_2_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_2_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_5y_2_LinkedPop50<-eee



#B=10
Eggs1<-as.vector(EOutcome2yAll_10_LinkedPop50)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_10_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_2y_10_LinkedPop50<-eee


Eggs1<-as.vector(EOutcome3yAll_10_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_10_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_3y_10_LinkedPop50<-eee


Eggs1<-as.vector(EOutcome5yAll_10_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_10_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_5y_10_LinkedPop50<-eee

#B=25
Eggs1<-as.vector(EOutcome2yAll_25_LinkedPop50)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_25_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_2y_25_LinkedPop50<-eee


Eggs1<-as.vector(EOutcome3yAll_25_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_25_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_3y_25_LinkedPop50<-eee


Eggs1<-as.vector(EOutcome5yAll_25_LinkedPop50)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_25_LinkedPop50)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) +
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue")
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))+ ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_5y_25_LinkedPop50<-eee



#New population linked - percentage above original


#Linked Population 75

#B=.5
Eggs1<-as.vector(EOutcome2yAll_0.5_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_0.5_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_2y_0.5_LinkedPop75<-eee



Eggs1<-as.vector(EOutcome3yAll_0.5_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_0.5_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_3y_0.5_LinkedPop75<-eee



Eggs1<-as.vector(EOutcome5yAll_0.5_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_0.5_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5", title="75% Population Linked FOI")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,25000)
eee

#rename with _B and _Number of y
EPlot_5y_0.5_LinkedPop75<-eee




#B=2

Eggs1<-as.vector(EOutcome2yAll_2_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_2_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_2y_2_LinkedPop75<-eee



Eggs1<-as.vector(EOutcome3yAll_2_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_2_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_3y_2_LinkedPop75<-eee


Eggs1<-as.vector(EOutcome5yAll_2_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_2_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,75000)
eee

#rename with _B and _Number of y
EPlot_5y_2_LinkedPop75<-eee





#B=10
Eggs1<-as.vector(EOutcome2yAll_10_LinkedPop75)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_10_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_2y_10_LinkedPop75<-eee


Eggs1<-as.vector(EOutcome3yAll_10_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_10_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_3y_10_LinkedPop75<-eee




Eggs1<-as.vector(EOutcome5yAll_10_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_10_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,200000)
eee

#rename with _B and _Number of y
EPlot_5y_10_LinkedPop75<-eee

# 
# 

#B=25
Eggs1<-as.vector(EOutcome2yAll_25_LinkedPop75)
my1=as.factor(my)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome2yEndAll_25_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10"))  + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_2y_25_LinkedPop75<-eee


Eggs1<-as.vector(EOutcome3yAll_25_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome3yEndAll_25_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_3y_25_LinkedPop75<-eee




Eggs1<-as.vector(EOutcome5yAll_25_LinkedPop75)
EggMean<- data.frame(my1,Eggs1)
Eggs2<-as.vector(EOutcome5yEndAll_25_LinkedPop75)
EggsAll2<- data.frame(my2,Eggs2)

eee<-ggplot(EggsAll2, aes(x=my2, y=Eggs2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = EggMean,aes(x=my1, y=Eggs1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) + ylim(0,300000)
eee

#rename with _B and _Number of y
EPlot_5y_25_LinkedPop75<-eee

# 
# #Unlinked Combined Plot (B and y )
figureUnlinked<- ggarrange(EPlot_2y_0.5_Un, EPlot_2y_2_Un, EPlot_2y_10_Un,
                               EPlot_3y_0.5_Un, EPlot_3y_2_Un, EPlot_3y_10_Un,
                               EPlot_5y_0.5_Un, EPlot_5y_2_Un, EPlot_5y_10_Un,
                               ncol = 3, nrow = 3)
# #figureUnlinked
# 
# 
# 
# 
# figureLinkedInd<- ggarrange(EPlot_2y_0.5_LinkedInd, EPlot_2y_2_LinkedInd, EPlot_2y_10_LinkedInd, 
#                            EPlot_3y_0.5_LinkedInd, EPlot_3y_2_LinkedInd, EPlot_3y_10_LinkedInd,
#                            EPlot_5y_0.5_LinkedInd, EPlot_5y_2_LinkedInd, EPlot_5y_10_LinkedInd,
#                            ncol = 3, nrow = 3)
# #figureLinkedInd
# 





#Figures by Year

figure2y_<-ggarrange(EPlot_2y_0.5_Un, EPlot_2y_0.5_LinkedPop50, EPlot_2y_0.5_LinkedPop75, EPlot_2y_0.5_LinkedPop,
                         EPlot_2y_2_Un, EPlot_2y_2_LinkedPop50, EPlot_2y_2_LinkedPop75, EPlot_2y_2_LinkedPop,
                         EPlot_2y_10_Un, EPlot_2y_10_LinkedPop50, EPlot_2y_10_LinkedPop75, EPlot_2y_10_LinkedPop,
                         EPlot_2y_25_Un, EPlot_2y_25_LinkedPop50, EPlot_2y_25_LinkedPop75, EPlot_2y_25_LinkedPop,
                         ncol=4, nrow=4)


figure3y_<-ggarrange(EPlot_3y_0.5_Un, EPlot_3y_0.5_LinkedPop50, EPlot_3y_0.5_LinkedPop75, EPlot_3y_0.5_LinkedPop,
                         EPlot_3y_2_Un, EPlot_3y_2_LinkedPop50, EPlot_3y_2_LinkedPop75, EPlot_3y_2_LinkedPop,
                         EPlot_3y_10_Un, EPlot_3y_10_LinkedPop50, EPlot_3y_10_LinkedPop75, EPlot_3y_10_LinkedPop,
                         EPlot_3y_25_Un, EPlot_3y_25_LinkedPop50, EPlot_3y_25_LinkedPop75, EPlot_3y_25_LinkedPop,
                         ncol=4, nrow=4)


figure5y_<-ggarrange(EPlot_5y_0.5_Un, EPlot_5y_0.5_LinkedPop50, EPlot_5y_0.5_LinkedPop75, EPlot_5y_0.5_LinkedPop,
                         EPlot_5y_2_Un, EPlot_5y_2_LinkedPop50, EPlot_5y_2_LinkedPop75, EPlot_5y_2_LinkedPop,
                         EPlot_5y_10_Un, EPlot_5y_10_LinkedPop50, EPlot_5y_10_LinkedPop75, EPlot_5y_10_LinkedPop,
                         EPlot_5y_25_Un, EPlot_5y_25_LinkedPop50, EPlot_5y_25_LinkedPop75, EPlot_5y_25_LinkedPop,
                         ncol=4, nrow=4)

annotate_figure(figure3y_,
                bottom = text_grob("Months Between Treatments", family="LM Roman 10"),
                left = text_grob("Egg Production after Three Year Intervention", rot = 90, family="LM Roman 10"))



