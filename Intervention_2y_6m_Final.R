


#THE FREQUENCY OF MDA
#EVERY THIS MANY MONTHS (J)!!!!!

j=6




#FOR THIS MANY YEARS
years=4

monthtx=j
dpp = 30*monthtx

#FOR THIS FOI (B)

B=.5


#FOR THIS TYPE OF FOI
#source('~/Desktop/TreatmentTiming/tauleapmodel_linked.R')
source('~/Desktop/TreatmentTiming/tauleapmodel_unlinked.R')
#source('~/Desktop/TreatmentTiming/tauleapmodel_linkedpop.R')
# source('~/Desktop/TreatmentTiming/tauleapmodel_linked_50.R')


years=3
#Periods (years )
per = round(365*years/dpp,digits=0)
per2=round(365*2/dpp,digits=0)
per3=round(365*3/dpp,digits=0)



# Set initial values for state variables

#can also create a vector with certain proportion in various burden levels....
#there is an issue with discordant levels between male and female adults, 
#if you have a lot of females you are more likely to have more males as well



#Calculate the number of rows there should be
days <- dpp*per/tau+10;

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



Sch1[1,]= Sch1init
Sch2[1,]= Sch2init
FJ1[1,]= FJ1init
FJ2[1,]= FJ2init
FJ3[1,]= FJ3init
Af1[1,]=Af1init
Am1[1,]=Am1init
Af2[1,]=Af2init
Am2[1,]=Am2init
E[1,]= Einit
MJ1[1,]= MJ1init
MJ2[1,]= MJ2init
MJ3[1,]= MJ3init

t0=Sys.time()


#Set the initial conditions
xstart=(cbind(Sch1[1,],Sch2[1,],FJ1[1,],FJ2[1,],FJ3[1,],Af1[1,],Am1[1,],Af2[1,],Am2[1,],E[1,],MJ1[1,],MJ2[1,],MJ3[1,]))
params = c(B=B,u6=u6,u1=u1,A=A,u2=u2,z=z,p1=p1,p2=p2,u3=u3,u4=u4,R=R,y=y,sc=sc)


  
#params["B"] = Bnew2[q]
#set the initial conditions of x, x will end up iterating through and being put back into the system
 x <- xstart

   
  
  for (i in 1:per) {
    time = seq((i-1)*dpp, ((i*dpp)),by=tau)

    
    
   #B is linked to population egg output only updates once a period...
    # B=B*(mean(tail(E))/mean(Einit))
    

   for (k in 2:length(time)-1)
      
    {
    #A time keeping variable cur serves to show which row we should currently be in
    cur = (length(time)-1)*(i-1);

    vnew = numeric(nsim)
    
    # Save Ratio of Males to Females
    
    RATIO_FM = (Am1+Am2)/(Af1+Af2)
    
    # Clear all infinites where there were no females by setting to 0
    RATIO_FM[is.infinite(RATIO_FM)] = 0
    
    # Clear all NANS where there were no males or females by setting to 0
    RATIO_FM[is.nan(RATIO_FM)] = 0
    
    # Set vnew = RATIO_FM
    vnew = RATIO_FM
    
    # Find Places where Af1+Af2 < Am1+Am2
    v_index = which((Af1+Af2)<=(Am1+Am2))
    
    
    # Set vnew at those places equal to v
    vnew[v_index] = .95
    vnew2=vnew
    v=vnew

    x <- tauleapmodel(x,params,tau,nsim)
    #update the next value for the simulation
    Sch1[cur+k+1,]=x[,1]
    Sch2[cur+k+1,]=x[,2]
    FJ1[cur+k+1,]=x[,3]
    FJ2[cur+k+1,]=x[,4]
    FJ3[cur+k+1,]=x[,5]
    Af1[cur+k+1,]=x[,6]
    Am1[cur+k+1,]=x[,7]
    Af2[cur+k+1,]=x[,8]
    Am2[cur+k+1,]=x[,9]
    E[cur+k+1,] =x[,10]
    MJ1[cur+k+1,]=x[,11]
    MJ2[cur+k+1,]=x[,12]
    MJ3[cur+k+1,]=x[,13]


 
    
    #Set the conditions that are going to be put back into the function
    x=matrix(c(Sch1[cur+k+1,], Sch2[cur+k+1,], FJ1[cur+k+1,], FJ2[cur+k+1,], FJ3[cur+k+1,], (Af1[cur+k+1,]), (Am1[cur+k+1,]), (Af2[cur+k+1,]), (Am2[cur+k+1,]), (E[cur+k+1,]), (MJ1[cur+k+1,]), (MJ2[cur+k+1,]), (MJ3[cur+k+1,])),nrow=nsim,ncol=13,byrow = F)

  
    
    
    
    
    
  }


  
  #Reset the values by decreasing them with treatment efficacy. The floor() command is used to keep these as whole numbers
  
  # #For Praziquantel
   x=matrix(c(floor(.15*Sch1[cur+k+1,]), floor(.30*Sch2[cur+k+1,]), floor(.90*FJ1[cur+k+1,]),
                  floor(.90*FJ2[cur+k+1,]), floor(.90*FJ3[cur+k+1,]), floor(.40*(Af1[cur+k+1,])),
                   floor(.40*(Am1[cur+k+1,])), floor(.05*(Af2[cur+k+1,])), floor(.05*(Am2[cur+k+1,])), floor(.7*(E[cur+k+1,])),floor(.90*MJ1[cur+k+1,])
            ,floor(.90*MJ2[cur+k+1,]), floor(.90*MJ3[cur+k+1,])),nrow=nsim,ncol=13,byrow = F)

   
}
 
 
 Af2y=Af1[1:((per2*dpp)+2),]+Af2[1:((per2*dpp)+2),]
 Af3y=Af1[1:((per3*dpp)+2),]+Af2[1:((per3*dpp)+2),]

 Am2y=Am1[1:((per2*dpp)+2),]+Am2[1:((per2*dpp)+2),]
 Am3y=Am1[1:((per3*dpp)+2),]+Am2[1:((per3*dpp)+2),]

 MJ2y=MJ1[1:((per2*dpp)+2),]+MJ2[1:((per2*dpp)+2),]+
  MJ3[1:((per2*dpp)+2),]
 MJ3y=MJ1[1:((per3*dpp)+2),]+MJ2[1:((per3*dpp)+2),]+
   MJ3[1:((per3*dpp)+2),]


 FJ2y=FJ1[1:((per2*dpp)+2),]+FJ2[1:((per2*dpp)+2),]+
   FJ3[1:((per2*dpp)+2),]
 FJ3y=FJ1[1:((per3*dpp)+2),]+FJ2[1:((per3*dpp)+2),]+
   FJ3[1:((per3*dpp)+2),]


 Sch2y= Sch1[1:((per2*dpp)+2),]+Sch2[1:((per2*dpp)+2),]
 Sch3y= Sch1[1:((per3*dpp)+2),]+Sch2[1:((per3*dpp)+2),]


 MWB2y=Am1[1:((per2*dpp)+2),]+Am2[1:((per2*dpp)+2),]+Af1[1:((per2*dpp)+2),]+
   Af2[1:((per2*dpp)+2),]+MJ1[1:((per2*dpp)+2),]+MJ2[1:((per2*dpp)+2),]+
   MJ3[1:((per2*dpp)+2),]+ Sch1[1:((per2*dpp)+2),]+Sch2[1:((per2*dpp)+2),]

 MWB3y=Am1[1:((per3*dpp)+2),]+Am2[1:((per3*dpp)+2),]+Af1[1:((per3*dpp)+2),]+
   Af2[1:((per3*dpp)+2),]+MJ1[1:((per3*dpp)+2),]+MJ2[1:((per3*dpp)+2),]+
   MJ3[1:((per3*dpp)+2),]+ Sch1[1:((per3*dpp)+2),]+Sch2[1:((per3*dpp)+2),]


 MWBA2y=Am1[1:((per2*dpp)+2),]+Am2[1:((per2*dpp)+2),]+Af1[1:((per2*dpp)+2),]+Af2[1:((per2*dpp)+2),]
 MWBA3y=Am1[1:((per3*dpp)+2),]+Am2[1:((per3*dpp)+2),]+Af1[1:((per3*dpp)+2),]+Af2[1:((per3*dpp)+2),]


#ADULTS ONLY
AdultWorms=Af1+Af2+Am1+Am2
Adult0m=AdultWorms[1,]
Adult3m=AdultWorms[92,]
Adult6m=AdultWorms[182,]
Adult9m=AdultWorms[272,]
Adult12m=AdultWorms[362,]
Adult15m=AdultWorms[452,]
Adult18m=AdultWorms[542,]
Adult21m=AdultWorms[632,]
Adult24m=AdultWorms[722,]




#Values for rebound calculations


#last value = lv
lv=per3*dpp+1

#This gets the final values for all the states and then these can be
#used as the start for rebound calculations

xstart2=(cbind(Sch1[lv,],Sch2[lv,],FJ1[lv,],FJ2[lv,],
               FJ3[lv,],Af1[lv,],Am1[lv,],Af2[lv,],
               Am2[lv,],E[lv,],MJ1[lv,],MJ2[lv,],MJ3[lv,]))


