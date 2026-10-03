
#rm(list=ls(all=TRUE))
# install.packages("dplyr")
# library(dplyr)
 #library(matrixStats)





#INITIAL CONDITIONS


#source('~/Desktop/TreatmentTiming/tauleapmodel_unlinked.R')
#ource('~/Desktop/TreatmentTiming/tauleapmodel_linked_50_4.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_75_4.R')
source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop_4.R')



#aaa="Unlinked"
#aaa="LinkedPop50"
aaa="LinkedPop"
#aaa="LinkedInd"
#aaa="LinkedPop75"

bbb="Low"
#bbb="Moderate"
#bbb="High"
#bbb=''


#INITIAL CONDITIONS
#source('~/Desktop/TreatmentTiming/InitialWormBurden_1.R')

#source('~/Desktop/TreatmentTiming/InitialWormBurden_1_High.R')


#Initial Conditions Low
source('~/Desktop/TreatmentTiming/InitialWormBurden_1_Low.R')


#Run the model!


#To make sure nsim is equal to the vectors we have created, in case there are weird rounding things...
nsim=length(Adultvector)
#Set the initial conditions

# Bnew <- seq(0,Bmax,by =Bstep)
# 
# 
# 
sc=500000


library(doParallel)  
no_cores <- detectCores() - 1  
registerDoParallel(cores=no_cores)  
cl <- makeCluster(no_cores, type="FORK")  


#Bnew2=10



#(need to check this beforehand)
t0=Sys.time()

#runs = number of replicates
runs=50


#Bnew2=50
#B=.5
#B=1

#B=1.5
#B=2
#w=1
top=length(Bnew2)

#LOOPS
for (w in 1:top ){
#   #   
#   
B = Bnew2[w]
for(j in 1:12) {

result<-foreach(q=1:runs, .combine='rbind') %dopar% {
  
  #source('~/Desktop/November_Outcome_MWB_Years.R')
  source('~/Desktop/November_Outcome_MWB_Years_4.R')
  
  #Results for #s of treatments:
  

  AllwormsYear=cbind(AfOutcome2yEnd,AfOutcome3yEnd,AfOutcome5yEnd,MWBOutcome2yEnd,MWBOutcome3yEnd,MWBOutcome5yEnd)
  
 MeanwormsYear=cbind(AfOutcome2y,AfOutcome3y,AfOutcome5y,MWBOutcome2y,MWBOutcome3y,MWBOutcome5y)
 
 vvv=cbind(AllwormsYear,MeanwormsYear) 
}

 xnew=colMeans(result)
 
 #For treatments at varying intervals over 2, 3, or 5 year interventions
 AfOutcome2yEnd=result[1:runs,1:nsim]
 AfOutcome3yEnd=result[1:runs,(1+nsim):(2*nsim)]
 AfOutcome5yEnd=result[1:runs,(1+(2*nsim)):(3*nsim)]
 
 MWBOutcome2yEnd=result[1:runs,(1+(3*nsim)):(4*nsim)]
 MWBOutcome3yEnd=result[1:runs,(1+(4*nsim)):(5*nsim)]
 MWBOutcome5yEnd=result[1:runs,(1+(5*nsim)):(6*nsim)]
 
#Means of the population at the end of the intervention

AfOutcome2y=result[1:runs,(1+(6*nsim))]
AfOutcome3y=result[1:runs,(2+(6*nsim))]
AfOutcome5y=result[1:runs,(3+(6*nsim))] 
 
MWBOutcome2y=result[1:runs,(4+(6*nsim))]
MWBOutcome3y=result[1:runs,(5+(6*nsim))]
MWBOutcome5y=result[1:runs,(6+(6*nsim))]


assign(paste0("AfOutcome2yEnd_",j), AfOutcome2yEnd)
assign(paste0("AfOutcome3yEnd_",j), AfOutcome3yEnd)
assign(paste0("AfOutcome5yEnd_",j), AfOutcome5yEnd)

assign(paste0("MWBOutcome2yEnd_",j), MWBOutcome2yEnd)
assign(paste0("MWBOutcome3yEnd_",j), MWBOutcome3yEnd)
assign(paste0("MWBOutcome5yEnd_",j), MWBOutcome5yEnd)

assign(paste0("AfOutcome2y_",j), AfOutcome2y)
assign(paste0("AfOutcome3y_",j), AfOutcome3y)
assign(paste0("AfOutcome5y_",j), AfOutcome5y)

assign(paste0("MWBOutcome2y_",j), MWBOutcome2y)
assign(paste0("MWBOutcome3y_",j), MWBOutcome3y)
assign(paste0("MWBOutcome5y_",j), MWBOutcome5y)


  }





#Mean Values

#make sure they are vectors so that each run is a different row and each column is a different person for the cbind
AfOutcome2y_1=as.vector(AfOutcome2y_1)
AfOutcome2y_2=as.vector(AfOutcome2y_2)
AfOutcome2y_3=as.vector(AfOutcome2y_3)
AfOutcome2y_4=as.vector(AfOutcome2y_4)
AfOutcome2y_5=as.vector(AfOutcome2y_5)
AfOutcome2y_6=as.vector(AfOutcome2y_6)
AfOutcome2y_7=as.vector(AfOutcome2y_7)
AfOutcome2y_8=as.vector(AfOutcome2y_8)
AfOutcome2y_9=as.vector(AfOutcome2y_9)
AfOutcome2y_10=as.vector(AfOutcome2y_10)
AfOutcome2y_11=as.vector(AfOutcome2y_11)
AfOutcome2y_12=as.vector(AfOutcome2y_12)


AfOutcome3y_1=as.vector(AfOutcome3y_1)
AfOutcome3y_2=as.vector(AfOutcome3y_2)
AfOutcome3y_3=as.vector(AfOutcome3y_3)
AfOutcome3y_4=as.vector(AfOutcome3y_4)
AfOutcome3y_5=as.vector(AfOutcome3y_5)
AfOutcome3y_6=as.vector(AfOutcome3y_6)
AfOutcome3y_7=as.vector(AfOutcome3y_7)
AfOutcome3y_8=as.vector(AfOutcome3y_8)
AfOutcome3y_9=as.vector(AfOutcome3y_9)
AfOutcome3y_10=as.vector(AfOutcome3y_10)
AfOutcome3y_11=as.vector(AfOutcome3y_11)
AfOutcome3y_12=as.vector(AfOutcome3y_12)



AfOutcome5y_1=as.vector(AfOutcome5y_1)
AfOutcome5y_2=as.vector(AfOutcome5y_2)
AfOutcome5y_3=as.vector(AfOutcome5y_3)
AfOutcome5y_4=as.vector(AfOutcome5y_4)
AfOutcome5y_5=as.vector(AfOutcome5y_5)
AfOutcome5y_6=as.vector(AfOutcome5y_6)
AfOutcome5y_7=as.vector(AfOutcome5y_7)
AfOutcome5y_8=as.vector(AfOutcome5y_8)
AfOutcome5y_9=as.vector(AfOutcome5y_9)
AfOutcome5y_10=as.vector(AfOutcome5y_10)
AfOutcome5y_11=as.vector(AfOutcome5y_11)
AfOutcome5y_12=as.vector(AfOutcome5y_12)




MWBOutcome2y_1=as.vector(MWBOutcome2y_1)
MWBOutcome2y_2=as.vector(MWBOutcome2y_2)
MWBOutcome2y_3=as.vector(MWBOutcome2y_3)
MWBOutcome2y_4=as.vector(MWBOutcome2y_4)
MWBOutcome2y_5=as.vector(MWBOutcome2y_5)
MWBOutcome2y_6=as.vector(MWBOutcome2y_6)
MWBOutcome2y_7=as.vector(MWBOutcome2y_7)
MWBOutcome2y_8=as.vector(MWBOutcome2y_8)
MWBOutcome2y_9=as.vector(MWBOutcome2y_9)
MWBOutcome2y_10=as.vector(MWBOutcome2y_10)
MWBOutcome2y_11=as.vector(MWBOutcome2y_11)
MWBOutcome2y_12=as.vector(MWBOutcome2y_12)


MWBOutcome3y_1=as.vector(MWBOutcome3y_1)
MWBOutcome3y_2=as.vector(MWBOutcome3y_2)
MWBOutcome3y_3=as.vector(MWBOutcome3y_3)
MWBOutcome3y_4=as.vector(MWBOutcome3y_4)
MWBOutcome3y_5=as.vector(MWBOutcome3y_5)
MWBOutcome3y_6=as.vector(MWBOutcome3y_6)
MWBOutcome3y_7=as.vector(MWBOutcome3y_7)
MWBOutcome3y_8=as.vector(MWBOutcome3y_8)
MWBOutcome3y_9=as.vector(MWBOutcome3y_9)
MWBOutcome3y_10=as.vector(MWBOutcome3y_10)
MWBOutcome3y_11=as.vector(MWBOutcome3y_11)
MWBOutcome3y_12=as.vector(MWBOutcome3y_12)



MWBOutcome5y_1=as.vector(MWBOutcome5y_1)
MWBOutcome5y_2=as.vector(MWBOutcome5y_2)
MWBOutcome5y_3=as.vector(MWBOutcome5y_3)
MWBOutcome5y_4=as.vector(MWBOutcome5y_4)
MWBOutcome5y_5=as.vector(MWBOutcome5y_5)
MWBOutcome5y_6=as.vector(MWBOutcome5y_6)
MWBOutcome5y_7=as.vector(MWBOutcome5y_7)
MWBOutcome5y_8=as.vector(MWBOutcome5y_8)
MWBOutcome5y_9=as.vector(MWBOutcome5y_9)
MWBOutcome5y_10=as.vector(MWBOutcome5y_10)
MWBOutcome5y_11=as.vector(MWBOutcome5y_11)
MWBOutcome5y_12=as.vector(MWBOutcome5y_12)

#All Values
#make sure they are vectors so that each run is a different row and each column is a different person for the cbind
AfOutcome2yEnd_1=as.vector(AfOutcome2yEnd_1)
AfOutcome2yEnd_2=as.vector(AfOutcome2yEnd_2)
AfOutcome2yEnd_3=as.vector(AfOutcome2yEnd_3)
AfOutcome2yEnd_4=as.vector(AfOutcome2yEnd_4)
AfOutcome2yEnd_5=as.vector(AfOutcome2yEnd_5)
AfOutcome2yEnd_6=as.vector(AfOutcome2yEnd_6)
AfOutcome2yEnd_7=as.vector(AfOutcome2yEnd_7)
AfOutcome2yEnd_8=as.vector(AfOutcome2yEnd_8)
AfOutcome2yEnd_9=as.vector(AfOutcome2yEnd_9)
AfOutcome2yEnd_10=as.vector(AfOutcome2yEnd_10)
AfOutcome2yEnd_11=as.vector(AfOutcome2yEnd_11)
AfOutcome2yEnd_12=as.vector(AfOutcome2yEnd_12)


AfOutcome3yEnd_1=as.vector(AfOutcome3yEnd_1)
AfOutcome3yEnd_2=as.vector(AfOutcome3yEnd_2)
AfOutcome3yEnd_3=as.vector(AfOutcome3yEnd_3)
AfOutcome3yEnd_4=as.vector(AfOutcome3yEnd_4)
AfOutcome3yEnd_5=as.vector(AfOutcome3yEnd_5)
AfOutcome3yEnd_6=as.vector(AfOutcome3yEnd_6)
AfOutcome3yEnd_7=as.vector(AfOutcome3yEnd_7)
AfOutcome3yEnd_8=as.vector(AfOutcome3yEnd_8)
AfOutcome3yEnd_9=as.vector(AfOutcome3yEnd_9)
AfOutcome3yEnd_10=as.vector(AfOutcome3yEnd_10)
AfOutcome3yEnd_11=as.vector(AfOutcome3yEnd_11)
AfOutcome3yEnd_12=as.vector(AfOutcome3yEnd_12)



AfOutcome5yEnd_1=as.vector(AfOutcome5yEnd_1)
AfOutcome5yEnd_2=as.vector(AfOutcome5yEnd_2)
AfOutcome5yEnd_3=as.vector(AfOutcome5yEnd_3)
AfOutcome5yEnd_4=as.vector(AfOutcome5yEnd_4)
AfOutcome5yEnd_5=as.vector(AfOutcome5yEnd_5)
AfOutcome5yEnd_6=as.vector(AfOutcome5yEnd_6)
AfOutcome5yEnd_7=as.vector(AfOutcome5yEnd_7)
AfOutcome5yEnd_8=as.vector(AfOutcome5yEnd_8)
AfOutcome5yEnd_9=as.vector(AfOutcome5yEnd_9)
AfOutcome5yEnd_10=as.vector(AfOutcome5yEnd_10)
AfOutcome5yEnd_11=as.vector(AfOutcome5yEnd_11)
AfOutcome5yEnd_12=as.vector(AfOutcome5yEnd_12)




MWBOutcome2yEnd_1=as.vector(MWBOutcome2yEnd_1)
MWBOutcome2yEnd_2=as.vector(MWBOutcome2yEnd_2)
MWBOutcome2yEnd_3=as.vector(MWBOutcome2yEnd_3)
MWBOutcome2yEnd_4=as.vector(MWBOutcome2yEnd_4)
MWBOutcome2yEnd_5=as.vector(MWBOutcome2yEnd_5)
MWBOutcome2yEnd_6=as.vector(MWBOutcome2yEnd_6)
MWBOutcome2yEnd_7=as.vector(MWBOutcome2yEnd_7)
MWBOutcome2yEnd_8=as.vector(MWBOutcome2yEnd_8)
MWBOutcome2yEnd_9=as.vector(MWBOutcome2yEnd_9)
MWBOutcome2yEnd_10=as.vector(MWBOutcome2yEnd_10)
MWBOutcome2yEnd_11=as.vector(MWBOutcome2yEnd_11)
MWBOutcome2yEnd_12=as.vector(MWBOutcome2yEnd_12)


MWBOutcome3yEnd_1=as.vector(MWBOutcome3yEnd_1)
MWBOutcome3yEnd_2=as.vector(MWBOutcome3yEnd_2)
MWBOutcome3yEnd_3=as.vector(MWBOutcome3yEnd_3)
MWBOutcome3yEnd_4=as.vector(MWBOutcome3yEnd_4)
MWBOutcome3yEnd_5=as.vector(MWBOutcome3yEnd_5)
MWBOutcome3yEnd_6=as.vector(MWBOutcome3yEnd_6)
MWBOutcome3yEnd_7=as.vector(MWBOutcome3yEnd_7)
MWBOutcome3yEnd_8=as.vector(MWBOutcome3yEnd_8)
MWBOutcome3yEnd_9=as.vector(MWBOutcome3yEnd_9)
MWBOutcome3yEnd_10=as.vector(MWBOutcome3yEnd_10)
MWBOutcome3yEnd_11=as.vector(MWBOutcome3yEnd_11)
MWBOutcome3yEnd_12=as.vector(MWBOutcome3yEnd_12)



MWBOutcome5yEnd_1=as.vector(MWBOutcome5yEnd_1)
MWBOutcome5yEnd_2=as.vector(MWBOutcome5yEnd_2)
MWBOutcome5yEnd_3=as.vector(MWBOutcome5yEnd_3)
MWBOutcome5yEnd_4=as.vector(MWBOutcome5yEnd_4)
MWBOutcome5yEnd_5=as.vector(MWBOutcome5yEnd_5)
MWBOutcome5yEnd_6=as.vector(MWBOutcome5yEnd_6)
MWBOutcome5yEnd_7=as.vector(MWBOutcome5yEnd_7)
MWBOutcome5yEnd_8=as.vector(MWBOutcome5yEnd_8)
MWBOutcome5yEnd_9=as.vector(MWBOutcome5yEnd_9)
MWBOutcome5yEnd_10=as.vector(MWBOutcome5yEnd_10)
MWBOutcome5yEnd_11=as.vector(MWBOutcome5yEnd_11)
MWBOutcome5yEnd_12=as.vector(MWBOutcome5yEnd_12)



#bind them into new dataframe

AfOutcome2yAll=cbind(AfOutcome2y_1,AfOutcome2y_2,AfOutcome2y_3,
                      AfOutcome2y_4,AfOutcome2y_5,AfOutcome2y_6,
                      AfOutcome2y_7,AfOutcome2y_8,AfOutcome2y_9,
                      AfOutcome2y_10,AfOutcome2y_11,AfOutcome2y_12)



AfOutcome3yAll=cbind(AfOutcome3y_1,AfOutcome3y_2,AfOutcome3y_3,
                      AfOutcome3y_4,AfOutcome3y_5,AfOutcome3y_6,
                      AfOutcome3y_7,AfOutcome3y_8,AfOutcome3y_9,
                      AfOutcome3y_10,AfOutcome3y_11,AfOutcome3y_12)


AfOutcome5yAll=cbind(AfOutcome5y_1,AfOutcome5y_2,AfOutcome5y_3,
                      AfOutcome5y_4,AfOutcome5y_5,AfOutcome5y_6,
                      AfOutcome5y_7,AfOutcome5y_8,AfOutcome5y_9,
                      AfOutcome5y_10,AfOutcome5y_11,AfOutcome5y_12)


MWBOutcome2yAll=cbind(MWBOutcome2y_1,MWBOutcome2y_2,MWBOutcome2y_3,
                       MWBOutcome2y_4,MWBOutcome2y_5,MWBOutcome2y_6,
                       MWBOutcome2y_7,MWBOutcome2y_8,MWBOutcome2y_9,
                       MWBOutcome2y_10,MWBOutcome2y_11,MWBOutcome2y_12)



MWBOutcome3yAll=cbind(MWBOutcome3y_1,MWBOutcome3y_2,MWBOutcome3y_3,
                       MWBOutcome3y_4,MWBOutcome3y_5,MWBOutcome3y_6,
                       MWBOutcome3y_7,MWBOutcome3y_8,MWBOutcome3y_9,
                       MWBOutcome3y_10,MWBOutcome3y_11,MWBOutcome3y_12)


MWBOutcome5yAll=cbind(MWBOutcome5y_1,MWBOutcome5y_2,MWBOutcome5y_3,
                       MWBOutcome5y_4,MWBOutcome5y_5,MWBOutcome5y_6,
                       MWBOutcome5y_7,MWBOutcome5y_8,MWBOutcome5y_9,
                       MWBOutcome5y_10,MWBOutcome5y_11,MWBOutcome5y_12)


#All values


AfOutcome2yEndAll=cbind(AfOutcome2yEnd_1,AfOutcome2yEnd_2,AfOutcome2yEnd_3,
                          AfOutcome2yEnd_4,AfOutcome2yEnd_5,AfOutcome2yEnd_6,
                          AfOutcome2yEnd_7,AfOutcome2yEnd_8,AfOutcome2yEnd_9,
                          AfOutcome2yEnd_10,AfOutcome2yEnd_11,AfOutcome2yEnd_12)



AfOutcome3yEndAll=cbind(AfOutcome3yEnd_1,AfOutcome3yEnd_2,AfOutcome3yEnd_3,
                          AfOutcome3yEnd_4,AfOutcome3yEnd_5,AfOutcome3yEnd_6,
                          AfOutcome3yEnd_7,AfOutcome3yEnd_8,AfOutcome3yEnd_9,
                          AfOutcome3yEnd_10,AfOutcome3yEnd_11,AfOutcome3yEnd_12)



AfOutcome5yEndAll=cbind(AfOutcome5yEnd_1,AfOutcome5yEnd_2,AfOutcome5yEnd_3,
                          AfOutcome5yEnd_4,AfOutcome5yEnd_5,AfOutcome5yEnd_6,
                          AfOutcome5yEnd_7,AfOutcome5yEnd_8,AfOutcome5yEnd_9,
                          AfOutcome5yEnd_10,AfOutcome5yEnd_11,AfOutcome5yEnd_12)



MWBOutcome2yEndAll=cbind(MWBOutcome2yEnd_1,MWBOutcome2yEnd_2,MWBOutcome2yEnd_3,
                       MWBOutcome2yEnd_4,MWBOutcome2yEnd_5,MWBOutcome2yEnd_6,
                       MWBOutcome2yEnd_7,MWBOutcome2yEnd_8,MWBOutcome2yEnd_9,
                       MWBOutcome2yEnd_10,MWBOutcome2yEnd_11,MWBOutcome2yEnd_12)



MWBOutcome3yEndAll=cbind(MWBOutcome3yEnd_1,MWBOutcome3yEnd_2,MWBOutcome3yEnd_3,
                       MWBOutcome3yEnd_4,MWBOutcome3yEnd_5,MWBOutcome3yEnd_6,
                       MWBOutcome3yEnd_7,MWBOutcome3yEnd_8,MWBOutcome3yEnd_9,
                       MWBOutcome3yEnd_10,MWBOutcome3yEnd_11,MWBOutcome3yEnd_12)



MWBOutcome5yEndAll=cbind(MWBOutcome5yEnd_1,MWBOutcome5yEnd_2,MWBOutcome5yEnd_3,
                       MWBOutcome5yEnd_4,MWBOutcome5yEnd_5,MWBOutcome5yEnd_6,
                       MWBOutcome5yEnd_7,MWBOutcome5yEnd_8,MWBOutcome5yEnd_9,
                       MWBOutcome5yEnd_10,MWBOutcome5yEnd_11,MWBOutcome5yEnd_12)





#SAVE WITH B AND FOI TYPE
#assign(paste0("MWBOutcome2txAll_",B), MWBOutcome2txAll)  

#aaa = the type of FOI


assign(paste0("AfOutcome2yAll_",B,'_',aaa,bbb), AfOutcome2yAll)                 
assign(paste0("AfOutcome3yAll_",B,'_',aaa,bbb), AfOutcome3yAll)                 
assign(paste0("AfOutcome5yAll_",B,'_',aaa,bbb), AfOutcome5yAll)                 


assign(paste0("AfOutcome2yEndAll_",B,'_',aaa,bbb), AfOutcome2yEndAll)                 
assign(paste0("AfOutcome3yEndAll_",B,'_',aaa,bbb), AfOutcome3yEndAll)                 
assign(paste0("AfOutcome5yEndAll_",B,'_',aaa,bbb), AfOutcome5yEndAll)    



assign(paste0("MWBOutcome2yAll_",B,'_',aaa,bbb), MWBOutcome2yAll)                 
assign(paste0("MWBOutcome3yAll_",B,'_',aaa,bbb), MWBOutcome3yAll)                 
assign(paste0("MWBOutcome5yAll_",B,'_',aaa,bbb), MWBOutcome5yAll)                 


assign(paste0("MWBOutcome2yEndAll_",B,'_',aaa,bbb), MWBOutcome2yEndAll)                 
assign(paste0("MWBOutcome3yEndAll_",B,'_',aaa,bbb), MWBOutcome3yEndAll)                 
assign(paste0("MWBOutcome5yEndAll_",B,'_',aaa,bbb), MWBOutcome5yEndAll)    


}


stopCluster(cl)
timetotal=Sys.time()-t0
print(timetotal)
#Save with the B values!


#assign(paste0("MWBOutcomeEnd2tx_",Bnew2[w]), MWBOutcomeEnd2tx)

#TO CONVERT TO VECTOR FOR PLOTTING:
#vvv=as.vector(MWBOutcomeEnd2tx_2)

