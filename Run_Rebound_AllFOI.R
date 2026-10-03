

##Initial Worm burden such as:

#
sc=500000
source('~/Desktop/TreatmentTiming/InitialWormBurden_1_High.R')
source('~/Desktop/TreatmentTiming/Intervention_2y_6m_Final.R')

#Then run each type of FOI

#Unlinked

source('~/Desktop/TreatmentTiming/Run_Rebound_Unlinked.R')

#Linked 50% FOI
source('~/Desktop/TreatmentTiming/Run_Rebound_50.R')

#Linked 75% FOI
source('~/Desktop/TreatmentTiming/Run_Rebound_75.R')

#Linked 100% FOI
source('~/Desktop/TreatmentTiming/Run_Rebound_100.R')



