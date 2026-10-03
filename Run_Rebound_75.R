




#Run no treatment - end of previous treated runs = input into this model 

#Initial Worm burden and then:
#source('~/Desktop/Intervention_2y_6m.R)


#source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_unlinked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_linkedpop.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_linkedpop25.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_linkedpop50.R')
source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_linkedpop75.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_rebound_linkedind.R')




#aaa="Unlinked"
#aaa="LinkedPop"
#aaa="LinkedInd"
#aaa="LinkedPop50"
aaa="LinkedPop75"



tau = 1 #in days
#Bmax=2.5
#Bstep=.5
#top <- (Bmax/Bstep);
#B=.2
y=.5
fd=150
#mated pairs to epg
epg=5.5
maxworm=3200

#Time we are running this model after interventions have been completed
monthsafter=24
days=(30*monthsafter)+1
maxmonth=monthsafter
time=seq(1,days,1)

#Bnew <- seq(.25,Bmax,by =Bstep)
Bnew<-c(.5,2,5,10,25)
top=length(Bnew)




#Calculate the number of rows there should be
Sch1=matrix(nrow=days,ncol=nsim)
Sch2=matrix(nrow=days,ncol=nsim)
FJ1=matrix(nrow=days,ncol=nsim)
FJ2=matrix(nrow=days,ncol=nsim)
FJ3=matrix(nrow=days,ncol=nsim)
MJ1=matrix(nrow=days,ncol=nsim)
MJ2=matrix(nrow=days,ncol=nsim)
MJ3=matrix(nrow=days,ncol=nsim)
Af1=matrix(nrow=days,ncol=nsim)
Am1=matrix(nrow=days,ncol=nsim)
Af2=matrix(nrow=days,ncol=nsim)
Am2=matrix(nrow=days,ncol=nsim)
E=matrix(nrow=days,ncol=nsim)
vnew2=matrix(nrow=days,ncol=nsim)



# Sch1[1,]= oldSch1
# Sch2[1,]= oldSch2
# FJ1[1,]= oldFJ1
# FJ2[1,]= oldFJ2
# FJ3[1,]= oldFJ3
# Af1[1,]=oldAf1
# Am1[1,]=oldAm1
# Af2[1,]=oldAf2
# Am2[1,]=oldAm2
# E[1,]= oldE
# MJ1[1,]= oldMJ1
# MJ2[1,]= oldMJ2
# MJ3[1,]= oldMJ3

t0=Sys.time()

#xstart2=(cbind(Sch1[1,],Sch2[1,],FJ1[1,],FJ2[1,],FJ3[1,],Af1[1,],Am1[1,],Af2[1,],Am2[1,],E[1,],MJ1[1,],MJ2[1,],MJ3[1,]))
#round so there are no weird partial worms etc.
xstart2=round(xstart2)
params = c(B=B,u6=u6,u1=u1,A=A,u2=u2,z=z,p1=p1,p2=p2,u3=u3,u4=u4,R=R,y=y,sc=sc)



#Make matrices to store data 




# 

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
registerDoParallel(cores=3)  




#(need to check this beforehand)
t0=Sys.time()




#Make matrices to store data 

rebound10=matrix(0,days,nsim)
rebound20=matrix(0,days,nsim)
rebound30=matrix(0,days,nsim)
rebound40=matrix(0,days,nsim)
rebound50=matrix(0,days,nsim)
rebound60=matrix(0,days,nsim)
rebound70=matrix(0,days,nsim)
rebound80=matrix(0,days,nsim)
rebound90=matrix(0,days,nsim)
rebound100=matrix(0,days,nsim)
ReboundMax=matrix(0,days,nsim)


AfOutcome5=matrix(0,days,nsim)
AmOutcome5=matrix(0,days,nsim)
EOutcome5=matrix(0,days,nsim)
MJOutcome5=matrix(0,days,nsim)
FJOutcome5=matrix(0,days,nsim)
SchOutcome5=matrix(0,days,nsim)
MWBOutcome5=matrix(0,days,nsim)
MWBAdult5=matrix(0,days,nsim)







#LOOPS
for (w in 1:top ){
  #   
  

  params['B'] =Bnew[w]
  
  result<-foreach(q=1:100, .combine='rbind') %dopar% {
     

source('~/Desktop/TreatmentTiming/NoTx_Nov2_par.R')

return(AdultsMeans2)

 #    vvv=cbind(AfOutcome,AmOutcome,EOutcome,MJOutcome,FJOutcome,SchOutcome,MWBOutcome,
  #             MWBAdult)
#     
#     
  #   return(vvv)
  }
  AdultsMeans3<-colMeans(result)
  
assign(paste0("AdultsMeans3_",Bnew[w],"_",aaa), AdultsMeans3)

#ReboundMax[q]=100*((max(AdultsMeans3, na.rm = TRUE ))/rebound)

}
#   xnew=colMeans(result)
#   AfOutcome5[w,]=xnew[1:month]
#   AmOutcome5[w,]=xnew[(1+month):(2*month)]
#   
#   EOutcome5[w,]=xnew[(1+(2*month)):(3*month)]
#   MJOutcome5[w,]=xnew[(1+(3*month)):(4*month)]
#   FJOutcome5[w,]=xnew[(1+(4*month)):(5*month)]
#   SchOutcome3[w,]=xnew[(1+(5*month)):(6*month)]
#   MWBOutcome5[w,]=xnew[(1+(6*month)):(7*month)]
#   MWBAdult5[w,]=xnew[(1+(7*month)):(8*month)]
#   
#   Afprop5[w,]=xnew[(1+(8*month)):(9*month)]
#   Amprop5[w,]=xnew[(1+(9*month)):(10*month)]
#   Eprop5[w,]=xnew[(1+(10*month)):(11*month)]
#   MJprop3[w,]=xnew[(1+(11*month)):(12*month)]
#   FJprop5[w,]=xnew[(1+(12*month)):(13*month)]
#   Schprop5[w,]=xnew[(1+(13*month)):(14*month)]
#   
#   FDieNum5[w,]=xnew[(1+(14*month)):(14*month)]
#   MDieNum5[w,]=xnew[(1+(15*month)):(15*month)]
#   ADieNum5[w,]=xnew[(1+(16*month)):(16*month)]
#   JDieNum5[w,]=xnew[(1+(17*month)):(17*month)]
#   TotDieNum5[w,]=xnew[(1+(18*month)):(18*month)]
#   EDieNum5[w,]=xnew[(1+(19*month)):(20*month)]
#   
#   FDieProp5[w,]=xnew[(1+(20*month)):(21*month)]
#   MDieProp5[w,]=xnew[(1+(21*month)):(22*month)]
#   ADieProp5[w,]=xnew[(1+(22*month)):(23*month)]
#   JDieProp5[w,]=xnew[(1+(23*month)):(24*month)]
#   EDieProp5[w,]=xnew[(1+(24*month)):(25*month)]
#   TotDieProp5[w,]=xnew[(1+(25*month)):(26*month)]
# 
stopCluster(cl)
 timetotal=Sys.time()-t0
 print(timetotal)



#}