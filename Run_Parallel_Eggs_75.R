
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
#aaa="LinkedInd"
#aaa="LinkedPop50"
aaa="LinkedPop75"




#INITIAL CONDITIONS
source('~/Desktop/TreatmentTiming/InitialWormBurden_1_High.R')




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
runs=5

#B=.5
#B=1
#B=1.5
#B=2

#w=1

#LOOPS
for (w in 1:top ){
#   #   
#   
B = Bnew2[w]
for(j in 1:12) {

result<-foreach(q=1:runs, .combine='rbind') %dopar% {
  
  source('~/Desktop/November_Outcome_Eggs.R')
  
  #Results for #s of treatments:
  
  AllEggs=cbind(EOutcome2yEnd,EOutcome3yEnd,EOutcome5yEnd)
  
 MeanEggs=cbind(EOutcome2y,EOutcome3y,EOutcome5y)
 
 vvv=cbind(AllEggs,MeanEggs) 
}

 xnew=colMeans(result)
 

 
 #For all eggs in population at end of intervention
 EOutcome2yEnd=result[1:runs,1:nsim]
 EOutcome3yEnd=result[1:runs,(1+nsim):(2*nsim)]
 EOutcome5yEnd=result[1:runs,(1+(2*nsim)):(3*nsim)]

 #Population Mean Eggs at End of intervention

EOutcome2y=result[1:runs,(1+(3*nsim))]
EOutcome3y=result[1:runs,(2+(3*nsim))]
EOutcome5y=result[1:runs,(3+(3*nsim))]





#Mean eggs in population at end of intervention

assign(paste0("EOutcome2y_",j), EOutcome2y)
assign(paste0("EOutcome3y_",j), EOutcome3y)
assign(paste0("EOutcome5y_",j), EOutcome5y)



#Eggs for each individual at end of intervention

assign(paste0("EOutcomeEnd2y_",j),  EOutcome2yEnd)
assign(paste0("EOutcomeEnd3y_",j),  EOutcome3yEnd)
assign(paste0("EOutcomeEnd5y_",j),  EOutcome5yEnd)


  }



#Mean Eggs
EOutcome2yAll=cbind(EOutcome2y_1,EOutcome2y_2,EOutcome2y_3,
                       EOutcome2y_4,EOutcome2y_5,EOutcome2y_6,
                       EOutcome2y_7,EOutcome2y_8,EOutcome2y_9,
                       EOutcome2y_10,EOutcome2y_11,EOutcome2y_12)



EOutcome3yAll=cbind(EOutcome3y_1,EOutcome3y_2,EOutcome3y_3,
                    EOutcome3y_4,EOutcome3y_5,EOutcome3y_6,
                    EOutcome3y_7,EOutcome3y_8,EOutcome3y_9,
                    EOutcome3y_10,EOutcome3y_11,EOutcome3y_12)


EOutcome5yAll=cbind(EOutcome5y_1,EOutcome5y_2,EOutcome5y_3,
                    EOutcome5y_4,EOutcome5y_5,EOutcome5y_6,
                    EOutcome5y_7,EOutcome5y_8,EOutcome5y_9,
                    EOutcome5y_10,EOutcome5y_11,EOutcome5y_12)



#All Eggs
EOutcome2yEndAll=cbind(EOutcomeEnd2y_1,EOutcomeEnd2y_2,EOutcomeEnd2y_3,
                    EOutcomeEnd2y_4,EOutcomeEnd2y_5,EOutcomeEnd2y_6,
                    EOutcomeEnd2y_7,EOutcomeEnd2y_8,EOutcomeEnd2y_9,
                    EOutcomeEnd2y_10,EOutcomeEnd2y_11,EOutcomeEnd2y_12)



EOutcome3yEndAll=cbind(EOutcomeEnd3y_1,EOutcomeEnd3y_2,EOutcomeEnd3y_3,
                    EOutcomeEnd3y_4,EOutcomeEnd3y_5,EOutcomeEnd3y_6,
                    EOutcomeEnd3y_7,EOutcomeEnd3y_8,EOutcomeEnd3y_9,
                    EOutcomeEnd3y_10,EOutcomeEnd3y_11,EOutcomeEnd3y_12)


EOutcome5yEndAll=cbind(EOutcomeEnd5y_1,EOutcomeEnd5y_2,EOutcomeEnd5y_3,
                    EOutcomeEnd5y_4,EOutcomeEnd5y_5,EOutcomeEnd5y_6,
                    EOutcomeEnd5y_7,EOutcomeEnd5y_8,EOutcomeEnd5y_9,
                    EOutcomeEnd5y_10,EOutcomeEnd5y_11,EOutcomeEnd5y_12)




#SAVE WITH B AND FOI TYPE
#assign(paste0("EOutcome2yAll_",B), EOutcome2yAll)  

#aaa = the type of FOI
assign(paste0("EOutcome2yAll_",B,'_',aaa), EOutcome2yAll)                 
assign(paste0("EOutcome3yAll_",B,'_',aaa), EOutcome3yAll)                 
assign(paste0("EOutcome5yAll_",B,'_',aaa), EOutcome5yAll)                 


assign(paste0("EOutcome2yEndAll_",B,'_',aaa), EOutcome2yEndAll)                 
assign(paste0("EOutcome3yEndAll_",B,'_',aaa), EOutcome3yEndAll)                 
assign(paste0("EOutcome5yEndAll_",B,'_',aaa), EOutcome5yEndAll)        

}


stopCluster(cl)
timetotal=Sys.time()-t0
print(timetotal)
#Save with the B values!


#assign(paste0("EOutcomeEnd2y_",Bnew2[w]), EOutcomeEnd2y)

#TO CONVERT TO VECTOR FOR PLOTTING:
#vvv=as.vector(EOutcomeEnd2y_2)

