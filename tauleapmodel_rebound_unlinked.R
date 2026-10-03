tauleapmodel2 <- function (xstart2, params, tau, nsim,v) {
  # Extract the state variables
  Sch1 =xstart2[,1]
  Sch2= xstart2[,2]
  FJ1 = xstart2[,3]
  FJ2=  xstart2[,4]
  FJ3=  xstart2[,5]
  Af1= xstart2[,6]
  Am1= xstart2[,7]
  Af2 =xstart2[,8]
  Am2 =xstart2[,9]
  E  = xstart2[,10]
  MJ1 = xstart2[,11]
  MJ2=  xstart2[,12]
  MJ3=  xstart2[,13]
  
  v=rep(.95,nsim)
  
  # Extract the parameter values
  
  
  
  #   B = Foi cercaria to people
  #   U6 - death rate for cercariae
  #   U1 - death rate for larvae - 
  #   A = rate of transition from larvae to juvenile
  #   U2 = death rate for juveniles
  #   Z = rate of transition from juveniles to adults
  #   P1 = proportion of juveniles that become female adult worms
  #   P2 = proportion of juveniles that become male adult worms
  #   U3 = mortality rate for adult females
  #   U4 = mortality rate for adult males
  #   R = rate of production of eggs per mated adult female
  #   V = probability that a female worm is mated ( could base this on the male female ratio.)
  #   Y = rate of passage of eggs to the outside
  
  
  B =  params['B']
  u6 = params['u6']
  u1 = params['u1']
  A =  params['A']
  u2 = params['u2']
  z =  params['z']
  p1 = params['p1']
  p2 = params['p2']
  u3 = params['u3']
  u4 = params['u4']
  R =  params['R']
  #v =  params['v']
  y =  params['y']
  sc = params['sc']
  
  
  # Iterating the model
  
  
  # Calculate the number of events the differential equations at time t
  
  #Based off of median egg values
 # newSch1=rpois(nsim,(B*(median(tail(E,1)))/(median(Einit)))*tau)
  
  #Individually linked
  # newSch1=rpois(nsim,(B*(1+(((tail(E,1))-median(Einit))/median(Einit))))*tau)
  
  
  #Linked to total population - certain proportion from treated and certain from others
  #Intermediate
  #newSch1=rpois(nsim,(B*((.5*(median(tail(E,1)))/(median(Einit)))+.5)*tau))
  
  # Unlinked to this population
  newSch1=rpois(nsim,B*tau)
  
  
  deathSch1=pmin(Sch1,rpois(nsim,u1*Sch1*tau))
  transitionSch1=pmin(Sch1-deathSch1,rpois(nsim,A*Sch1*tau))
  
  deathSch2=pmin(Sch2,rpois(nsim,u1*Sch2*tau))
  transitionSch2=pmin(Sch2-deathSch2,rpois(nsim,A*Sch2*tau))
  
  newMJ1=pmin(Sch2-deathSch2,rpois(nsim,Sch2*p2*A*tau))
  newFJ1=pmin(Sch2-deathSch2,rpois(nsim,Sch2*p1*A*tau))
  
  deathMJ1=pmin(MJ1,rpois(nsim,u2*MJ1*tau))
  transitionMJ1=pmin(MJ1-deathMJ1,rpois(nsim,z*MJ1*tau))
  
  deathMJ2=pmin(MJ2,rpois(nsim,u2*MJ2*tau))
  transitionMJ2=pmin(MJ2-deathMJ2,rpois(nsim,z*MJ2*tau))
  
  deathMJ3=pmin(MJ3,rpois(nsim,u2*MJ3*tau))
  transitionMJ3=pmin(MJ3-deathMJ3,rpois(nsim,z*MJ3*tau))
  
  
  deathFJ1=pmin(FJ1,rpois(nsim,u2*FJ1*tau))
  transitionFJ1=pmin(FJ1-deathFJ1,rpois(nsim,z*FJ1*tau))
  
  deathFJ2=pmin(FJ2,rpois(nsim,u2*FJ2*tau))
  transitionFJ2=pmin(FJ2-deathFJ2,rpois(nsim,z*FJ2*tau))
  
  deathFJ3=pmin(FJ3,rpois(nsim,u2*FJ3*tau))
  transitionFJ3=pmin(FJ3-deathFJ3,rpois(nsim,z*FJ3*tau))
  
  newfem1=pmin(FJ3-deathFJ3,rpois(nsim,z*FJ3*tau*(1-(Af1+Am1+Af2+Am2)/maxworm)))
  deathfem1=pmin(Af1,rpois(nsim,u3*Af1*tau))
  
  transitionfem1=pmin(Af1-deathfem1,rpois(nsim,z*Af1*tau))
  deathfem2=pmin(Af2,rpois(nsim,u3*Af2*tau))
  
  newmale1=pmin(MJ3-deathMJ3,rpois(nsim,z*MJ3*tau*(1-((Af1+Am1+Af2+Am2)/maxworm))))
  deathmale1=pmin(Am1,rpois(nsim,u4*Am1*tau))
  
  transitionmale1=pmin(Am1-deathmale1,rpois(nsim,z*Am1*tau))
  deathmale2=pmin(Am2,rpois(nsim,u4*Am2*tau))
  
  newegg=pmin(rpois(nsim,v*R*(Af1+Af2)*tau))
  eggdischarge=pmin(E,rpois(nsim,y*E*tau))
  
  
  dSch1=newSch1 - deathSch1 - transitionSch1
  dSch2=transitionSch1 - deathSch2 - transitionSch2
  dMJ1= newMJ1 - deathMJ1 - transitionMJ1 
  dMJ2= transitionMJ1-deathMJ2-transitionMJ2
  dMJ3= transitionMJ2-deathMJ3-transitionMJ3
  dFJ1= newFJ1- deathFJ1 - transitionFJ1
  dFJ2= transitionFJ1-deathFJ2-transitionFJ2
  dFJ3= transitionFJ2-deathFJ3-transitionFJ3 
  dAf1=newfem1 -deathfem1 - transitionfem1
  dAm1= newmale1 -deathmale1 - transitionmale1
  dAf2= transitionfem1-deathfem2
  dAm2= transitionmale1 - deathmale2
  dE=newegg-eggdischarge
  
  
  # Combine into a single vector
  newmodel = cbind(Sch1+dSch1,Sch2+dSch2,FJ1+dFJ1,FJ2+dFJ2,FJ3+dFJ3,Af1+dAf1,Am1+dAm1,Af2+dAf2,Am2+dAm2,E+dE,MJ1+dMJ1,MJ2+dMJ2,MJ3+dMJ3)
  # Return as a list 
  return(newmodel)       
  
}
