
#rm(list=ls(all=TRUE))
# install.packages("dplyr")
# library(dplyr)
 #library(matrixStats)


#source('~/Desktop/TreatmentTiming/tauleapmodel_unlinked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50_4.R')
source('~/Desktop/TreatmentTiming/tauleapmodel_linked_75_4.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop_4.R')


#aaa="Unlinked"
#aaa="LinkedPop"
#aaa="LinkedPop50"
aaa="LinkedPop75"

#aaa="LinkedInd"


#INITIAL CONDITIONS
source('~/Desktop/TreatmentTiming/InitialWormBurden_1_High.R')

sc=500000


#Run the model!


#To make sure nsim is equal to the vectors we have created, in case there are weird rounding things...
nsim=length(Adultvector)
#Set the initial conditions

# Bnew <- seq(0,Bmax,by =Bstep)
# 
# 
# 



library(doParallel)  
no_cores <- detectCores() - 1  
registerDoParallel(cores=no_cores)  
cl <- makeCluster(no_cores, type="FORK")  
#registerDoParallel(cores=3)  




#(need to check this beforehand)
t0=Sys.time()

#runs = number of replicates
runs=10

#B=.5
#B=1

#B=10
#B=2
#w=1
#Bnew2=10
#top=1

#LOOPS
for (w in 1:top ){
#   #   
#   
B = Bnew2[w]
for(j in 1:12) {

result<-foreach(q=1:runs, .combine='rbind') %dopar% {
  
  source('~/Desktop/November_Outcome_MWB_1.R')
  
  #Results for #s of treatments:
  
  Allworms=cbind(MWBOutcomeEnd2tx,MWBOutcomeEnd3tx,MWBOutcomeEnd4tx,MWBOutcomeEnd5tx)
  
 Meanworms=cbind(MWBOutcome2tx,MWBOutcome3tx,MWBOutcome4tx,MWBOutcome5tx)
 
 vvv=cbind(Allworms,Meanworms) 
}

 xnew=colMeans(result)
 

 
 #For # of treatments:
 MWBOutcomeEnd2tx=result[1:runs,1:nsim]
 MWBOutcomeEnd3tx=result[1:runs,(1+nsim):(2*nsim)]
 MWBOutcomeEnd4tx=result[1:runs,(1+(2*nsim)):(3*nsim)]
 MWBOutcomeEnd5tx=result[1:runs,(1+(3*nsim)):(4*nsim)]
 
 

#means for each individual

MWBOutcome2tx=result[1:runs,(1+(4*nsim))]
MWBOutcome3tx=result[1:runs,(2+(4*nsim))]
MWBOutcome4tx=result[1:runs,(3+(4*nsim))]
MWBOutcome5tx=result[1:runs,(4+(4*nsim))]


assign(paste0("MWBOutcomeEnd2tx_",j), MWBOutcomeEnd2tx)
assign(paste0("MWBOutcomeEnd3tx_",j), MWBOutcomeEnd3tx)
assign(paste0("MWBOutcomeEnd4tx_",j), MWBOutcomeEnd4tx)
assign(paste0("MWBOutcomeEnd5tx_",j), MWBOutcomeEnd5tx)


assign(paste0("MWBOutcome2tx_",j), MWBOutcome2tx)
assign(paste0("MWBOutcome3tx_",j), MWBOutcome3tx)
assign(paste0("MWBOutcome4tx_",j), MWBOutcome4tx)
assign(paste0("MWBOutcome5tx_",j), MWBOutcome5tx)


  }




#Mean Values
MWBOutcome2txAll=cbind(MWBOutcome2tx_1,MWBOutcome2tx_2,MWBOutcome2tx_3,
                       MWBOutcome2tx_4,MWBOutcome2tx_5,MWBOutcome2tx_6,
                       MWBOutcome2tx_7,MWBOutcome2tx_8,MWBOutcome2tx_9,
                       MWBOutcome2tx_10,MWBOutcome2tx_11,MWBOutcome2tx_12)



MWBOutcome3txAll=cbind(MWBOutcome3tx_1,MWBOutcome3tx_2,MWBOutcome3tx_3,
                       MWBOutcome3tx_4,MWBOutcome3tx_5,MWBOutcome3tx_6,
                       MWBOutcome3tx_7,MWBOutcome3tx_8,MWBOutcome3tx_9,
                       MWBOutcome3tx_10,MWBOutcome3tx_11,MWBOutcome3tx_12)



MWBOutcome4txAll=cbind(MWBOutcome4tx_1,MWBOutcome4tx_2,MWBOutcome4tx_3,
                       MWBOutcome4tx_4,MWBOutcome4tx_5,MWBOutcome4tx_6,
                       MWBOutcome4tx_7,MWBOutcome4tx_8,MWBOutcome4tx_9,
                       MWBOutcome4tx_10,MWBOutcome4tx_11,MWBOutcome4tx_12)


MWBOutcome5txAll=cbind(MWBOutcome5tx_1,MWBOutcome5tx_2,MWBOutcome5tx_3,
                       MWBOutcome5tx_4,MWBOutcome5tx_5,MWBOutcome5tx_6,
                       MWBOutcome5tx_7,MWBOutcome5tx_8,MWBOutcome5tx_9,
                       MWBOutcome5tx_10,MWBOutcome5tx_11,MWBOutcome5tx_12)


#All values

MWBOutcomeEnd2txAll=cbind(MWBOutcomeEnd2tx_1,MWBOutcomeEnd2tx_2,MWBOutcomeEnd2tx_3,
                       MWBOutcomeEnd2tx_4,MWBOutcomeEnd2tx_5,MWBOutcomeEnd2tx_6,
                       MWBOutcomeEnd2tx_7,MWBOutcomeEnd2tx_8,MWBOutcomeEnd2tx_9,
                       MWBOutcomeEnd2tx_10,MWBOutcomeEnd2tx_11,MWBOutcomeEnd2tx_12)



MWBOutcomeEnd3txAll=cbind(MWBOutcomeEnd3tx_1,MWBOutcomeEnd3tx_2,MWBOutcomeEnd3tx_3,
                       MWBOutcomeEnd3tx_4,MWBOutcomeEnd3tx_5,MWBOutcomeEnd3tx_6,
                       MWBOutcomeEnd3tx_7,MWBOutcomeEnd3tx_8,MWBOutcomeEnd3tx_9,
                       MWBOutcomeEnd3tx_10,MWBOutcomeEnd3tx_11,MWBOutcomeEnd3tx_12)



MWBOutcomeEnd4txAll=cbind(MWBOutcomeEnd4tx_1,MWBOutcomeEnd4tx_2,MWBOutcomeEnd4tx_3,
                       MWBOutcomeEnd4tx_4,MWBOutcomeEnd4tx_5,MWBOutcomeEnd4tx_6,
                       MWBOutcomeEnd4tx_7,MWBOutcomeEnd4tx_8,MWBOutcomeEnd4tx_9,
                       MWBOutcomeEnd4tx_10,MWBOutcomeEnd4tx_11,MWBOutcomeEnd4tx_12)


MWBOutcomeEnd5txAll=cbind(MWBOutcomeEnd5tx_1,MWBOutcomeEnd5tx_2,MWBOutcomeEnd5tx_3,
                       MWBOutcomeEnd5tx_4,MWBOutcomeEnd5tx_5,MWBOutcomeEnd5tx_6,
                       MWBOutcomeEnd5tx_7,MWBOutcomeEnd5tx_8,MWBOutcomeEnd5tx_9,
                       MWBOutcomeEnd5tx_10,MWBOutcomeEnd5tx_11,MWBOutcomeEnd5tx_12)





#SAVE WITH B AND FOI TYPE
#assign(paste0("MWBOutcome2txAll_",B), MWBOutcome2txAll)  

#aaa = the type of FOI
assign(paste0("MWBOutcome2txAll_",B,'_',aaa), MWBOutcome2txAll)                 
assign(paste0("MWBOutcome3txAll_",B,'_',aaa), MWBOutcome3txAll)                 
assign(paste0("MWBOutcome4txAll_",B,'_',aaa), MWBOutcome4txAll)                 
assign(paste0("MWBOutcome5txAll_",B,'_',aaa), MWBOutcome5txAll)                 


assign(paste0("MWBOutcomeEnd2txAll_",B,'_',aaa), MWBOutcomeEnd2txAll)                 
assign(paste0("MWBOutcomeEnd3txAll_",B,'_',aaa), MWBOutcomeEnd3txAll)                 
assign(paste0("MWBOutcomeEnd4txAll_",B,'_',aaa), MWBOutcomeEnd4txAll)                 
assign(paste0("MWBOutcomeEnd5txAll_",B,'_',aaa), MWBOutcomeEnd5txAll)    

}


stopCluster(cl)
timetotal=Sys.time()-t0
print(timetotal)


#Save with the B values!


#assign(paste0("MWBOutcomeEnd2tx_",Bnew2[w]), MWBOutcomeEnd2tx)

#TO CONVERT TO VECTOR FOR PLOTTING:
#vvv=as.vector(MWBOutcomeEnd2tx_2)

