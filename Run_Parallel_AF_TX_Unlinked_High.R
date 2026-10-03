
#rm(list=ls(all=TRUE))
# install.packages("dplyr")
# library(dplyr)
 #library(matrixStats)


source('~/Desktop/TreatmentTiming/tauleapmodel_unlinked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50_4.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_75_4.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop_4.R')


aaa="Unlinked"
#aaa="LinkedPop"
#aaa="LinkedPop50"
#aaa="LinkedPop75"

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
runs=2

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
  
  source('~/Desktop/November_Outcome_AF_1.R')
  
  #Results for #s of treatments:
  
  Allworms=cbind(AfOutcomeEnd2tx,AfOutcomeEnd3tx,AfOutcomeEnd4tx,AfOutcomeEnd5tx)
  
 Meanworms=cbind(AfOutcome2tx,AfOutcome3tx,AfOutcome4tx,AfOutcome5tx)
 
 vvv=cbind(Allworms,Meanworms) 
}

 xnew=colMeans(result)
 

 
 #For # of treatments:
 AfOutcomeEnd2tx=result[1:runs,1:nsim]
 AfOutcomeEnd3tx=result[1:runs,(1+nsim):(2*nsim)]
 AfOutcomeEnd4tx=result[1:runs,(1+(2*nsim)):(3*nsim)]
 AfOutcomeEnd5tx=result[1:runs,(1+(3*nsim)):(4*nsim)]
 
 

#means for each individual

AfOutcome2tx=result[1:runs,(1+(4*nsim))]
AfOutcome3tx=result[1:runs,(2+(4*nsim))]
AfOutcome4tx=result[1:runs,(3+(4*nsim))]
AfOutcome5tx=result[1:runs,(4+(4*nsim))]


assign(paste0("AfOutcomeEnd2tx_",j), AfOutcomeEnd2tx)
assign(paste0("AfOutcomeEnd3tx_",j), AfOutcomeEnd3tx)
assign(paste0("AfOutcomeEnd4tx_",j), AfOutcomeEnd4tx)
assign(paste0("AfOutcomeEnd5tx_",j), AfOutcomeEnd5tx)


assign(paste0("AfOutcome2tx_",j), AfOutcome2tx)
assign(paste0("AfOutcome3tx_",j), AfOutcome3tx)
assign(paste0("AfOutcome4tx_",j), AfOutcome4tx)
assign(paste0("AfOutcome5tx_",j), AfOutcome5tx)


  }




#Mean Values
AfOutcome2txAll=cbind(AfOutcome2tx_1,AfOutcome2tx_2,AfOutcome2tx_3,
                       AfOutcome2tx_4,AfOutcome2tx_5,AfOutcome2tx_6,
                       AfOutcome2tx_7,AfOutcome2tx_8,AfOutcome2tx_9,
                       AfOutcome2tx_10,AfOutcome2tx_11,AfOutcome2tx_12)



AfOutcome3txAll=cbind(AfOutcome3tx_1,AfOutcome3tx_2,AfOutcome3tx_3,
                       AfOutcome3tx_4,AfOutcome3tx_5,AfOutcome3tx_6,
                       AfOutcome3tx_7,AfOutcome3tx_8,AfOutcome3tx_9,
                       AfOutcome3tx_10,AfOutcome3tx_11,AfOutcome3tx_12)



AfOutcome4txAll=cbind(AfOutcome4tx_1,AfOutcome4tx_2,AfOutcome4tx_3,
                       AfOutcome4tx_4,AfOutcome4tx_5,AfOutcome4tx_6,
                       AfOutcome4tx_7,AfOutcome4tx_8,AfOutcome4tx_9,
                       AfOutcome4tx_10,AfOutcome4tx_11,AfOutcome4tx_12)


AfOutcome5txAll=cbind(AfOutcome5tx_1,AfOutcome5tx_2,AfOutcome5tx_3,
                       AfOutcome5tx_4,AfOutcome5tx_5,AfOutcome5tx_6,
                       AfOutcome5tx_7,AfOutcome5tx_8,AfOutcome5tx_9,
                       AfOutcome5tx_10,AfOutcome5tx_11,AfOutcome5tx_12)


#All values

AfOutcomeEnd2txAll=cbind(AfOutcomeEnd2tx_1,AfOutcomeEnd2tx_2,AfOutcomeEnd2tx_3,
                       AfOutcomeEnd2tx_4,AfOutcomeEnd2tx_5,AfOutcomeEnd2tx_6,
                       AfOutcomeEnd2tx_7,AfOutcomeEnd2tx_8,AfOutcomeEnd2tx_9,
                       AfOutcomeEnd2tx_10,AfOutcomeEnd2tx_11,AfOutcomeEnd2tx_12)



AfOutcomeEnd3txAll=cbind(AfOutcomeEnd3tx_1,AfOutcomeEnd3tx_2,AfOutcomeEnd3tx_3,
                       AfOutcomeEnd3tx_4,AfOutcomeEnd3tx_5,AfOutcomeEnd3tx_6,
                       AfOutcomeEnd3tx_7,AfOutcomeEnd3tx_8,AfOutcomeEnd3tx_9,
                       AfOutcomeEnd3tx_10,AfOutcomeEnd3tx_11,AfOutcomeEnd3tx_12)



AfOutcomeEnd4txAll=cbind(AfOutcomeEnd4tx_1,AfOutcomeEnd4tx_2,AfOutcomeEnd4tx_3,
                       AfOutcomeEnd4tx_4,AfOutcomeEnd4tx_5,AfOutcomeEnd4tx_6,
                       AfOutcomeEnd4tx_7,AfOutcomeEnd4tx_8,AfOutcomeEnd4tx_9,
                       AfOutcomeEnd4tx_10,AfOutcomeEnd4tx_11,AfOutcomeEnd4tx_12)


AfOutcomeEnd5txAll=cbind(AfOutcomeEnd5tx_1,AfOutcomeEnd5tx_2,AfOutcomeEnd5tx_3,
                       AfOutcomeEnd5tx_4,AfOutcomeEnd5tx_5,AfOutcomeEnd5tx_6,
                       AfOutcomeEnd5tx_7,AfOutcomeEnd5tx_8,AfOutcomeEnd5tx_9,
                       AfOutcomeEnd5tx_10,AfOutcomeEnd5tx_11,AfOutcomeEnd5tx_12)





#SAVE WITH B AND FOI TYPE
#assign(paste0("AfOutcome2txAll_",B), AfOutcome2txAll)  

#aaa = the type of FOI
assign(paste0("AfOutcome2txAll_",B,'_',aaa), AfOutcome2txAll)                 
assign(paste0("AfOutcome3txAll_",B,'_',aaa), AfOutcome3txAll)                 
assign(paste0("AfOutcome4txAll_",B,'_',aaa), AfOutcome4txAll)                 
assign(paste0("AfOutcome5txAll_",B,'_',aaa), AfOutcome5txAll)                 


assign(paste0("AfOutcomeEnd2txAll_",B,'_',aaa), AfOutcomeEnd2txAll)                 
assign(paste0("AfOutcomeEnd3txAll_",B,'_',aaa), AfOutcomeEnd3txAll)                 
assign(paste0("AfOutcomeEnd4txAll_",B,'_',aaa), AfOutcomeEnd4txAll)                 
assign(paste0("AfOutcomeEnd5txAll_",B,'_',aaa), AfOutcomeEnd5txAll)    

}


stopCluster(cl)
timetotal=Sys.time()-t0
print(timetotal)


#Save with the B values!


#assign(paste0("AfOutcomeEnd2tx_",Bnew2[w]), AfOutcomeEnd2tx)

#TO CONVERT TO VECTOR FOR PLOTTING:
#vvv=as.vector(AfOutcomeEnd2tx_2)

