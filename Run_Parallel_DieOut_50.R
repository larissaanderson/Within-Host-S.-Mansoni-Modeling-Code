
#rm(list=ls(all=TRUE))
# install.packages("dplyr")
# library(dplyr)
 #library(matrixStats)



#INITIAL CONDITIONS
#source('~/Desktop/TreatmentTiming/InitialWormBurden_1.R')

#High Burden Initially
#source('~/Desktop/TreatmentTiming/InitialWormBurden_1_High.R')

#Low Burden Initially
#source('~/Desktop/TreatmentTiming/InitialWormBurden_1_Low.R')

#50% Infected
#source('~/Desktop/TreatmentTiming/InitialWormBurden_1_50.R')

#Run the model!

#source('~/Desktop/TreatmentTiming/tauleapmodel_linked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_unlinked.R')
 #source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop.R')
# source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50.R')

#source('~/Desktop/TreatmentTiming/tauleapmodel_linked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50_2.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop_new2.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_25.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked_75.R')


source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50_4.R')


#aaa="Unlinked"
#aaa="LinkedPop"
#aaa="LinkedInd"
aaa="LinkedPop50"
#aaa="LinkedPop25"
#aaa="LinkedPop75"


#bbb="Low"
#bbb="Moderate"
#bbb="High"

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
registerDoParallel(cores=3)  




#(need to check this beforehand)
t0=Sys.time()

#runs = number of replicates
runs=20

#B=.5
#B=1
#B=1.5

#w=1

#LOOPS
#LOOPS
# for (w in 1:top ){
#   #   #   
#   #   
#  B = Bnew2[w]
#   

    
  result<-foreach(q=1:runs, .combine='rbind') %dopar% {
      
      
     
  source('~/Desktop/Run_DieOut.R')
  

   
 IndDieOut=cbind(AfDieProp2y,AfDieProp3y,AfDieProp5y,TotDieProp2y,TotDieProp3y,
                 TotDieProp5y,EDieProp2y,EDieProp3y,EDieProp5y)
  
TimeDieOut=cbind(AfProp2y,AfProp3y,AfProp5y,TotProp2y,TotProp3y,
                 TotProp5y,EProp2y,EProp3y,EProp5y)
 
 vvv=cbind(IndDieOut,TimeDieOut) 

}

# xnew=colMeans(result)
 
 #Proportion of Individuals who experience die out
 
AfDieProp2y=result[,1:12]
AfDieProp3y=result[,(1+12):(12*2)]
AfDieProp5y=result[,(1+24):(12*3)]
 
TotProp2y=result[,(1+36):(12*4)]
TotProp3y=result[,(1+48):(12*5)]
TotProp5y=result[,(1+60):(12*6)]

EDieProp2y=result[,(1+72):(12*7)]
EDieProp3y=result[,(1+84):(12*8)]
EDieProp5y=result[,(1+96):(12*9)]

#Proportion of runs (time) with die out

AfProp2y=result[,(1+108):(12*10)]
AfProp3y=result[,(1+120):(12*11)]
AfProp5y=result[,(1+132):(12*12)]

TotProp2y=result[,(1+144):(12*13)]
TotProp3y=result[,(1+156):(12*14)]
TotProp5y=result[,(1+168):(12*15)]

EProp2y=result[,(1+180):(12*16)]
EProp3y=result[,(1+192):(12*17)]
EProp5y=result[,(1+204):(12*18)]

  



#SAVE WITH B AND FOI TYPE

#aaa = the type of FOI
assign(paste0("AfDieProp2y_",B,'_',aaa,bbb), AfDieProp2y)      
assign(paste0("AfDieProp3y_",B,'_',aaa,bbb), AfDieProp3y)                 
assign(paste0("AfDieProp5y_",B,'_',aaa,bbb), AfDieProp5y)                 

assign(paste0("TotDieProp2y_",B,'_',aaa,bbb), TotDieProp2y)                 
assign(paste0("TotDieProp3y_",B,'_',aaa,bbb), TotDieProp3y)                 
assign(paste0("TotDieProp5y_",B,'_',aaa,bbb), TotDieProp5y)                 

assign(paste0("EDieProp2y_",B,'_',aaa,bbb), EDieProp2y)                 
assign(paste0("EDieProp3y_",B,'_',aaa,bbb), EDieProp3y)                 
assign(paste0("EDieProp5y_",B,'_',aaa,bbb), EDieProp5y)                 


assign(paste0("AfProp2y_",B,'_',aaa,bbb), AfProp2y)      
assign(paste0("AfProp3y_",B,'_',aaa,bbb), AfProp3y)                 
assign(paste0("AfProp5y_",B,'_',aaa,bbb), AfProp5y)                 

assign(paste0("TotProp2y_",B,'_',aaa,bbb), TotProp2y)                 
assign(paste0("TotProp3y_",B,'_',aaa,bbb), TotProp3y)                 
assign(paste0("TotProp5y_",B,'_',aaa,bbb), TotProp5y)                 

assign(paste0("EProp2y_",B,'_',aaa,bbb), EProp2y)                 
assign(paste0("EProp3y_",B,'_',aaa,bbb), EProp3y)                 
assign(paste0("EProp5y_",B,'_',aaa,bbb), EProp5y)




stopCluster(cl)
timetotal=Sys.time()-t0
print(timetotal)

#Save with the B values!


#assign(paste0("EOutcomeEnd2y_",Bnew2[w]), EOutcomeEnd2y)

#TO CONVERT TO VECTOR FOR PLOTTING:
#vvv=as.vector(EOutcomeEnd2y_2)

