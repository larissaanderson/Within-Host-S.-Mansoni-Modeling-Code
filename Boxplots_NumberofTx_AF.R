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
library(extrafont)

par(family = "LM Roman 10")

# create a dataset

# monthstx=c( rep(1,nrow(result)),rep(2,nrow(result)),rep(3,nrow(result)),rep(4,nrow(result)),
#             rep(5,nrow(result)),rep(6,nrow(result)),rep(7,nrow(result)),rep(8,nrow(result)),
#             rep(9,nrow(result)),rep(10,nrow(result)),rep(11,nrow(result)),rep(12,nrow(result)))


monthstx=c( rep(1,runs*nsim),rep(2,runs*nsim),rep(3,runs*nsim),rep(4,runs*nsim),rep(5,runs*nsim),
            rep(6,runs*nsim),rep(7,runs*nsim),rep(8,runs*nsim),rep(9,runs*nsim),rep(10,runs*nsim),
            rep(11,runs*nsim),rep(12,runs*nsim))

mtx=c( rep(1,runs),rep(2,runs),rep(3,runs),rep(4,runs),rep(5,runs),
       rep(6,runs),rep(7,runs),rep(8,runs),rep(9,runs),rep(10,runs),
       rep(11,runs),rep(12,runs))
mtx1<-as.factor(mtx)
mtx2<-as.factor(monthstx)



#Unlinked Plots

#B=.5

Worms1<-as.vector(AfOutcome2txAll_0.5_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_0.5_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=.5") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_0.5_Un<-eee

Worms1<-as.vector(AfOutcome3txAll_0.5_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_0.5_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="Unlinked FOI")+ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5))+
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_0.5_Un<-eee


# Worms1<-as.vector(AfOutcome5txAll_0.5_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_0.5_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=.5")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_0.5_Un<-eee

# 
# 
# #B=1
# Worms1<-as.vector(AfOutcome2txAll_1_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_1_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_1_Un<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3txAll_1_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_1_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_1_Un<-eee
# 
# Worms1<-as.vector(AfOutcome5txAll_1_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_1_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_1_Un<-eee




#B=2
Worms1<-as.vector(AfOutcome2txAll_2_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_2_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_2_Un<-eee

Worms1<-as.vector(AfOutcome3txAll_2_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_2_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2",title="")+ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5))+
theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 

eee

#rename with _B and _Number of TX
AfPlot_3tx_2_Un<-eee



# Worms1<-as.vector(AfOutcome5txAll_2_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_2_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_2_Un<-eee



#B = 10
Worms1<-as.vector(AfOutcome2txAll_10_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_10_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_10_Un<-eee

Worms1<-as.vector(AfOutcome3txAll_10_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_10_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10",title="")+ 
  theme(plot.subtitle = element_text(hjust = 0.5))+
theme(plot.title = element_text(hjust = 0.5))+
theme(text= element_text(size=10, family="LM Roman 10")) 

eee

#rename with _B and _Number of TX
AfPlot_3tx_10_Un<-eee


# 
# Worms1<-as.vector(AfOutcome5txAll_10_Unlinked)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_10_Unlinked)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_10_Un<-eee






#Linked Individual
# 
# #B=.5
# 
# Worms1<-as.vector(AfOutcome2txAll_0.5_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_0.5_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=.5") +
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_0.5_LinkedInd<-eee
# 
# Worms1<-as.vector(AfOutcome3txAll_0.5_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_0.5_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=.5")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_0.5_LinkedInd<-eee
# 
# 
# # Worms1<-as.vector(AfOutcome5txAll_0.5_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd5txAll_0.5_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
# #                title="B=.5")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_5tx_0.5_LinkedInd<-eee
# 
# 
# 
# # #B=1
# # Worms1<-as.vector(AfOutcome2txAll_1_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd2txAll_1_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="",
# #                title="B=1")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_2tx_1_LinkedInd<-eee
# # 
# # 
# # Worms1<-as.vector(AfOutcome3txAll_1_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd3txAll_1_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="",
# #                title="B=1")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_3tx_1_LinkedInd<-eee
# # 
# # Worms1<-as.vector(AfOutcome5txAll_1_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd5txAll_1_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
# #                title="B=1")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_5tx_1_LinkedInd<-eee
# 
# 
# 
# 
# #B=2
# Worms1<-as.vector(AfOutcome2txAll_2_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_2_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_2_LinkedInd<-eee
# 
# Worms1<-as.vector(AfOutcome3txAll_2_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_2_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_2_LinkedInd<-eee
# 
# 
# # 
# # Worms1<-as.vector(AfOutcome5txAll_2_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd5txAll_2_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
# #                title="B=2")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_5tx_2_LinkedInd<-eee
# 
# 
# 
# #B = 10
# 
# Worms1<-as.vector(AfOutcome2txAll_10_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_10_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_10_LinkedInd<-eee
# 
# Worms1<-as.vector(AfOutcome3txAll_10_LinkedInd)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_10_LinkedInd)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_10_LinkedInd<-eee
# 
# 
# # 
# # Worms1<-as.vector(AfOutcome5txAll_10_LinkedInd)
# # AfMean<- data.frame(mtx1,Worms1)
# # Worms2<-as.vector(AfOutcomeEnd5txAll_10_LinkedInd)
# # AfAll2<- data.frame(mtx2,Worms2)
# # 
# # eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
# #   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# # eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
# #                title="B=10")+
# #   theme(plot.title = element_text(hjust = 0.5)) +
# #   theme(text= element_text(size=10, family="LM Roman 10")) 
# # eee
# # 
# # #rename with _B and _Number of TX
# # AfPlot_5tx_10_LinkedInd<-eee
# 
# 
# 

#Population Linked 

#LinkedInd

#B=.5

Worms1<-as.vector(AfOutcome2txAll_0.5_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_0.5_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="100% Linked FOI")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5))
theme(plot.title = element_text(hjust = 0.5)) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_0.5_LinkedPop<-eee

Worms1<-as.vector(AfOutcome3txAll_0.5_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_0.5_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="100% Linked FOI")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5))+
theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 

eee

#rename with _B and _Number of TX
AfPlot_3tx_0.5_LinkedPop<-eee


Worms1<-as.vector(AfOutcome4txAll_0.5_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_0.5_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=.5")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_0.5_LinkedPop<-eee


# 
# Worms1<-as.vector(AfOutcome5txAll_0.5_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_0.5_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=.5")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_0.5_LinkedPop<-eee



# #B=1
# Worms1<-as.vector(AfOutcome2txAll_1_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_1_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_1_LinkedPop<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3txAll_1_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_1_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_1_LinkedPop<-eee
# 
# Worms1<-as.vector(AfOutcome5txAll_1_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_1_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_1_LinkedPop<-eee




#B=2
Worms1<-as.vector(AfOutcome2txAll_2_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_2_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_2_LinkedPop<-eee

Worms1<-as.vector(AfOutcome3txAll_2_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_2_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_2_LinkedPop<-eee


Worms1<-as.vector(AfOutcome4txAll_2_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_2_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_2_LinkedPop<-eee



# 
# 
# Worms1<-as.vector(AfOutcome5txAll_2_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_2_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_2_LinkedPop<-eee



#B = 10

Worms1<-as.vector(AfOutcome2txAll_10_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_10_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_10_LinkedPop<-eee

Worms1<-as.vector(AfOutcome3txAll_10_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_10_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_10_LinkedPop<-eee




Worms1<-as.vector(AfOutcome4txAll_10_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_10_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_10_LinkedPop<-eee




# 
# Worms1<-as.vector(AfOutcome5txAll_10_LinkedPop)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_10_LinkedPop)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_10_LinkedPop<-eee




# POPULATION LINKED 50%

#Population Linked 

#LinkedInd

#B=.5

Worms1<-as.vector(AfOutcome2txAll_0.5_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_0.5_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="50% PopulationLinked FOI") + ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) 
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_0.5_LinkedPop50<-eee

Worms1<-as.vector(AfOutcome3txAll_0.5_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_0.5_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="50% PopulationLinked FOI") + ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_0.5_LinkedPop50<-eee


Worms1<-as.vector(AfOutcome4txAll_0.5_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_0.5_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=.5")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_0.5_LinkedPop50<-eee


# 
# Worms1<-as.vector(AfOutcome5txAll_0.5_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_0.5_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=.5")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_0.5_LinkedPop50<-eee



# #B=1
# Worms1<-as.vector(AfOutcome2txAll_1_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_1_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_1_LinkedPop50<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3txAll_1_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_1_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_1_LinkedPop50<-eee
# 
# Worms1<-as.vector(AfOutcome5txAll_1_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_1_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_1_LinkedPop50<-eee




#B=2
Worms1<-as.vector(AfOutcome2txAll_2_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_2_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) 
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_2_LinkedPop50<-eee

Worms1<-as.vector(AfOutcome3txAll_2_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_2_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5))+
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_2_LinkedPop50<-eee


Worms1<-as.vector(AfOutcome4txAll_2_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_2_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_2_LinkedPop50<-eee



# 
# 
# Worms1<-as.vector(AfOutcome5txAll_2_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_2_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_2_LinkedPop50<-eee



#B = 10

Worms1<-as.vector(AfOutcome2txAll_10_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_10_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_10_LinkedPop50<-eee

Worms1<-as.vector(AfOutcome3txAll_10_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_10_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_10_LinkedPop50<-eee




Worms1<-as.vector(AfOutcome4txAll_10_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_10_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_10_LinkedPop50<-eee


# POPULATION LINKED 75%



#B=.5

Worms1<-as.vector(AfOutcome2txAll_0.5_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_0.5_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="75% PopulationLinked FOI") + ylim(0,40)+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.subtitle = element_text(hjust = 0.5))+
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_0.5_LinkedPop75<-eee

Worms1<-as.vector(AfOutcome3txAll_0.5_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_0.5_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=.5",title="75% PopulationLinked FOI") + ylim(0,40)+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_0.5_LinkedPop75<-eee


Worms1<-as.vector(AfOutcome4txAll_0.5_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_0.5_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=.5")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_0.5_LinkedPop75<-eee


# 
# Worms1<-as.vector(AfOutcome5txAll_0.5_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_0.5_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=.5")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_0.5_LinkedPop75<-eee



# #B=1
# Worms1<-as.vector(AfOutcome2txAll_1_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd2txAll_1_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_2tx_1_LinkedPop75<-eee
# 
# 
# Worms1<-as.vector(AfOutcome3txAll_1_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd3txAll_1_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_3tx_1_LinkedPop75<-eee
# 
# Worms1<-as.vector(AfOutcome5txAll_1_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_1_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_1_LinkedPop75<-eee




#B=2
Worms1<-as.vector(AfOutcome2txAll_2_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_2_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_2_LinkedPop75<-eee

Worms1<-as.vector(AfOutcome3txAll_2_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_2_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=2")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) + 
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_2_LinkedPop75<-eee


Worms1<-as.vector(AfOutcome4txAll_2_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_2_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=2")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_2_LinkedPop75<-eee



# 
# 
# Worms1<-as.vector(AfOutcome5txAll_2_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_2_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=2")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_2_LinkedPop75<-eee



#B = 10

Worms1<-as.vector(AfOutcome2txAll_10_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd2txAll_10_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_2tx_10_LinkedPop75<-eee

Worms1<-as.vector(AfOutcome3txAll_10_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_10_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=10")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_10_LinkedPop75<-eee




Worms1<-as.vector(AfOutcome4txAll_10_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd4txAll_10_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="Total Schistosomes after \nFour Treatments",
               title="B=10")+
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_4tx_10_LinkedPop75<-eee



#B=25
Worms1<-as.vector(AfOutcome3txAll_25_Unlinked)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_25_Unlinked)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_25_Unlinked<-eee


Worms1<-as.vector(AfOutcome3txAll_25_LinkedPop50)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_25_LinkedPop50)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_25_LinkedPop50<-eee

Worms1<-as.vector(AfOutcome3txAll_25_LinkedPop75)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_25_LinkedPop75)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_25_LinkedPop75<-eee

Worms1<-as.vector(AfOutcome3txAll_25_LinkedPop)
AfMean<- data.frame(mtx1,Worms1)
Worms2<-as.vector(AfOutcomeEnd3txAll_25_LinkedPop)
AfAll2<- data.frame(mtx2,Worms2)

eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
  geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
eee<-eee+ labs(x = "", y="",
               subtitle="B=25")+ ylim(0,40)+
  theme(plot.subtitle = element_text(hjust = 0.5)) +
  theme(text= element_text(size=10, family="LM Roman 10")) 
eee

#rename with _B and _Number of TX
AfPlot_3tx_25_LinkedPop<-eee

# Worms1<-as.vector(AfOutcome5txAll_10_LinkedPop75)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_10_LinkedPop75)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_10_LinkedPop75<-eee




# 
# Worms1<-as.vector(AfOutcome5txAll_10_LinkedPop50)
# AfMean<- data.frame(mtx1,Worms1)
# Worms2<-as.vector(AfOutcomeEnd5txAll_10_LinkedPop50)
# AfAll2<- data.frame(mtx2,Worms2)
# 
# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="Total Schistosomes after \nFive Treatments",
#                title="B=10")+
#   theme(plot.title = element_text(hjust = 0.5)) +
#   theme(text= element_text(size=10, family="LM Roman 10")) 
# eee
# 
# #rename with _B and _Number of TX
# AfPlot_5tx_10_LinkedPop50<-eee





#Prettier Boxplots

#Individual

#qq<-ggplot(AfMean, aes(x=mtx1, y=Worms1))+geom_boxplot()

#v<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point()


#COMBINED BOXPLOT

#REMEMBER TO SET # OF TX AND B VALUES MANUALLY

# eee<-ggplot(AfAll2, aes(x=mtx2, y=Worms2)) +geom_point(colour="lightblue", alpha=0.5) + 
#   geom_boxplot(data = AfMean,aes(x=mtx1, y=Worms1),colour="darkblue") 
# eee<-eee+ labs(x = "", y="",
#                title="B=1")+
#   theme(plot.title = element_text(hjust = 0.5)) +
# theme(text= element_text(size=10, family="LM Roman 10")) 
# eee



# Subplots for each B values and # of treatments


# figure <- ggarrange(bxp, dp, lp,
#                     labels = c("A", "B", "C"),
#                     ncol = 2, nrow = 2)
# figure
# 
# figure4_1 <- ggarrange(AfPlot_2tx_0.5, AfPlot_3tx_0.5, AfPlot_4tx_0.5,AfPlot_5tx_0.5,
#                        ncol = 1, nrow = 4)
# figure4_1
# 
# 
# figure4_2 <- ggarrange(AfPlot_2tx_1, AfPlot_3tx_1, AfPlot_4tx_1,AfPlot_5tx_1,
#                        ncol = 1, nrow = 4)
# figure4_2
# 
# 
# figure4_3 <- ggarrange(AfPlot_2tx_1.5, AfPlot_3tx_1.5, AfPlot_4tx_1.5,AfPlot_5tx_1.5,
#                     ncol = 1, nrow = 4)
# figure4_3



#figure comparing # of treatments over varying FOI values for the same FOI type
#figureUnlinked
#figureLinkedPop
#figureLinkedInd


# figureUnlinked<- ggarrange(AfPlot_2tx_0.5_Un, AfPlot_2tx_2_Un, AfPlot_2tx_10_Un, 
#                            AfPlot_3tx_0.5_Un, AfPlot_3tx_2_Un, AfPlot_3tx_10_Un,
#                            AfPlot_5tx_0.5_Un, AfPlot_5tx_2_Un, AfPlot_5tx_10_Un,
#                            ncol = 3, nrow = 3)
# figureUnlinked
# 
# 
# 
# 
# figureLinkedInd<- ggarrange(AfPlot_2tx_0.5_LinkedInd, AfPlot_2tx_2_LinkedInd, AfPlot_2tx_10_LinkedInd, 
#                             AfPlot_3tx_0.5_LinkedInd, AfPlot_3tx_2_LinkedInd, AfPlot_3tx_10_LinkedInd,
#                             AfPlot_5tx_0.5_LinkedInd, AfPlot_5tx_2_LinkedInd, AfPlot_5tx_10_LinkedInd,
#                             ncol = 3, nrow = 3)
# figureLinkedInd
# 
# 
# figureLinkedPop<- ggarrange(AfPlot_2tx_0.5_LinkedPop, AfPlot_2tx_2_LinkedPop, AfPlot_2tx_10_LinkedPop, 
#                             AfPlot_3tx_0.5_LinkedPop, AfPlot_3tx_2_LinkedPop, AfPlot_3tx_10_LinkedPop,
#                             AfPlot_5tx_0.5_LinkedPop, AfPlot_5tx_2_LinkedPop, AfPlot_5tx_10_LinkedPop,
#                             ncol = 3, nrow = 3)
# figureLinkedPop
# 
# 




#Figure comparing different FOI types and FOI Values


figure_3tx<- ggarrange(AfPlot_3tx_0.5_Un,AfPlot_3tx_0.5_LinkedPop50,AfPlot_3tx_0.5_LinkedPop75,AfPlot_3tx_0.5_LinkedPop,
                       AfPlot_3tx_2_Un,AfPlot_3tx_2_LinkedPop50,AfPlot_3tx_2_LinkedPop75,AfPlot_3tx_2_LinkedPop,
                       AfPlot_3tx_10_Un,AfPlot_3tx_10_LinkedPop50,AfPlot_3tx_10_LinkedPop75,AfPlot_3tx_10_LinkedPop,
                       AfPlot_3tx_25_Unlinked,AfPlot_3tx_25_LinkedPop50,AfPlot_3tx_25_LinkedPop75,AfPlot_3tx_25_LinkedPop,
                       ncol = 4, nrow = 4)
annotate_figure(figure_3tx,
                bottom = text_grob("Months Between Treatments", family="LM Roman 10"),
                left = text_grob("Adult Female Schistosomes after Three Treatments", rot = 90, family="LM Roman 10"))


