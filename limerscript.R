#Use setwd('path/to/project') to set working directory

#Load packages

library(limer)
library(plyr)
library(reshape2)

#connect to limer, change api link, username and password where necessary

options(lime_api = 'http://survey.itechcenter.ne/index.php/admin/remotecontrol')
options(lime_username = 'your_username')
options(lime_password = 'your_password')
get_session_key()

survey_df<-call_limer(method='list_surveys')
View(survey_df)

#save date
date<-Sys.time()

#Download surveys. Check 'survey_df' table for any new files and add to list below.

AGA046<-get_responses(iSurveyID= 954197, sLanguageCode = 'fr', sResponseType = 'short')
DIF010<-get_responses(iSurveyID= 397193, sLanguageCode = 'fr', sResponseType = 'short')
AGA051<-get_responses(iSurveyID= 335852, sLanguageCode = 'fr', sResponseType = 'short')
DIF018<-get_responses(iSurveyID= 669388, sLanguageCode = 'fr', sResponseType = 'short')
NIA029<-get_responses(iSurveyID= 215531, sLanguageCode = 'fr', sResponseType = 'short')
AGA045<-get_responses(iSurveyID= 139427, sLanguageCode = 'fr', sResponseType = 'short')
AGA041<-get_responses(iSurveyID= 318229, sLanguageCode = 'fr', sResponseType = 'short')
DIF044<-get_responses(iSurveyID= 251232, sLanguageCode = 'fr', sResponseType = 'short')
AGA055<-get_responses(iSurveyID= 731787, sLanguageCode = 'fr', sResponseType = 'short')
TILL006<-get_responses(iSurveyID= 828848, sLanguageCode = 'fr', sResponseType = 'short')
AGA060<-get_responses(iSurveyID= 675145, sLanguageCode = 'fr', sResponseType = 'short')
AGA059<-get_responses(iSurveyID= 212898, sLanguageCode = 'fr', sResponseType = 'short')
AGA061<-get_responses(iSurveyID= 191773, sLanguageCode = 'fr', sResponseType = 'short')
DIF059<-get_responses(iSurveyID= 485985, sLanguageCode = 'fr', sResponseType = 'short')
TILL007<-get_responses(iSurveyID= 943461, sLanguageCode = 'fr', sResponseType = 'short')
TILL009<-get_responses(iSurveyID= 541311, sLanguageCode = 'fr', sResponseType = 'short')
DIF040<-get_responses(iSurveyID= 448111, sLanguageCode = 'fr', sResponseType = 'short')
DIF048<-get_responses(iSurveyID= 716422, sLanguageCode = 'fr', sResponseType = 'short')
DIF045<-get_responses(iSurveyID= 259664, sLanguageCode = 'fr', sResponseType = 'short')
AGA062<-get_responses(iSurveyID= 517332, sLanguageCode = 'fr', sResponseType = 'short')
DIF038<-get_responses(iSurveyID= 852367, sLanguageCode = 'fr', sResponseType = 'short')
AGA031<-get_responses(iSurveyID= 584813, sLanguageCode = 'fr', sResponseType = 'short')

#Make copies with only the columns of interest, also excluding empty surveys

AGA041c <- AGA041[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10")]
AGA045c <- AGA045[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10")]
#AGA046c <- AGA046[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q17")]
AGA051c <- AGA051[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q17","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
AGA055c <- AGA055[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
AGA059c <- AGA059[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q23.1.","Q23.2.","Q23.3.","Q23.4.")]
AGA060c <- AGA060[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q16","Q23.1.","Q23.2.","Q23.3.","Q23.4.")]
AGA061c <- AGA061[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10")]
DIF010c <- DIF010[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q17","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
DIF018c <- DIF018[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q17","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
DIF044c <- DIF044[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
NIA029c <- NIA029[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q41.1.","Q41.2.","Q41.3.","Q41.4.")]
TILL006c <- TILL006[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10")]
TILL007c <- TILL007[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q23.1.","Q23.2.","Q23.3.","Q23.4.")]
TILL009c <- TILL009[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q21","Q25.1.","Q25.2.","Q25.3.","Q25.4.")]
#DIF040c <- DIF040[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q15","Q16.1.","Q16.2.","Q16.3.")]
DIF048c <- DIF048[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q15","Q16.1.","Q16.2.","Q16.3.")]
DIF045c <- DIF045[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q15","Q16.1.","Q16.2.","Q16.3.")]
AGA062c <- AGA062[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q18","Q32.1.","Q32.2.","Q32.3.","Q32.4.")]
DIF038c <- DIF038[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q16","Q32.1.","Q32.2.","Q32.3.","Q32.4.")]
AGA031c <- AGA031[c("Q1","Q2","Q6","Q7","Q8","Q9","Q10","Q45","Q53.1.","Q53.2.","Q53.3.","Q53.4.")]

#Add identification column

AGA041c$Survey <- 'AGA041'
AGA045c$Survey <- 'AGA045'
#AGA046c$Survey <- 'AGA046'
AGA051c$Survey <- 'AGA051'
AGA055c$Survey <- 'AGA055'
AGA059c$Survey <- 'AGA059'
AGA060c$Survey <- 'AGA060'
AGA061c$Survey <- 'AGA061'
DIF010c$Survey <- 'DIF010'
DIF018c$Survey <- 'DIF018'
DIF044c$Survey <- 'DIF044'
NIA029c$Survey <- 'NIA029'
TILL006c$Survey <- 'TILL006'
TILL007c$Survey <- 'TILL007'
TILL009c$Survey <- 'TILL009'
#DIF040c$Survey <- 'DIF040'
DIF048c$Survey <- 'DIF048'
DIF045c$Survey <- 'DIF045'
AGA062c$Survey <- 'AGA062'
DIF038c$Survey <- 'DIF038'
AGA031c$Survey <- 'AGA031'

#Move misaligned columns to desired, consistent location

AGA059c$Q41.1.<-AGA059c$Q23.1.
AGA059c$Q41.2.<-AGA059c$Q23.2.
AGA059c$Q41.3.<-AGA059c$Q23.3.
AGA059c$Q41.4.<-AGA059c$Q23.4.

AGA060c$Q41.1.<-AGA060c$Q23.1.
AGA060c$Q41.2.<-AGA060c$Q23.2.
AGA060c$Q41.3.<-AGA060c$Q23.3.
AGA060c$Q41.4.<-AGA060c$Q23.4.

TILL007c$Q41.1.<-TILL007c$Q23.1.
TILL007c$Q41.2.<-TILL007c$Q23.2.
TILL007c$Q41.3.<-TILL007c$Q23.3.
TILL007c$Q41.4.<-TILL007c$Q23.4.

TILL009c$Q41.1.<-TILL009c$Q25.1.
TILL009c$Q41.2.<-TILL009c$Q25.2.
TILL009c$Q41.3.<-TILL009c$Q25.3.
TILL009c$Q41.4.<-TILL009c$Q25.4.

TILL009c$Q17 <-TILL009c$Q21
TILL009c$Q21<-NULL

#DIF040c$Q41.1.<-DIF040c$Q16.1.
#DIF040c$Q41.2.<-DIF040c$Q16.2.
#DIF040c$Q41.3.<-DIF040c$Q16.3.
#DIF040c$Q41.4.<- NA
#DIF040c$Q17<-DIF048c$Q15

DIF048c$Q41.1.<-DIF048c$Q16.1.
DIF048c$Q41.2.<-DIF048c$Q16.2.
DIF048c$Q41.3.<-DIF048c$Q16.3.
DIF048c$Q41.4.<- NA
DIF048c$Q17<-DIF048c$Q15

DIF045c$Q41.1.<-DIF045c$Q16.1.
DIF045c$Q41.2.<-DIF045c$Q16.2.
DIF045c$Q41.3.<-DIF045c$Q16.3.
DIF045c$Q41.4.<- NA
DIF045c$Q17<-DIF045c$Q15

AGA062c$Q41.1.<-AGA062c$Q32.1.
AGA062c$Q41.2.<-AGA062c$Q32.2.
AGA062c$Q41.3.<-AGA062c$Q32.3.
AGA062c$Q41.4.<- AGA062c$Q32.4.
AGA062c$Q17<-AGA062c$Q18

AGA059c$Q23.1.<-NULL
AGA059c$Q23.2.<-NULL
AGA059c$Q23.3.<-NULL
AGA059c$Q23.4.<-NULL

AGA060c$Q23.1.<-NULL
AGA060c$Q23.2.<-NULL
AGA060c$Q23.3.<-NULL
AGA060c$Q23.4.<-NULL

TILL007c$Q23.1.<-NULL
TILL007c$Q23.2.<-NULL
TILL007c$Q23.3.<-NULL
TILL007c$Q23.4.<-NULL

AGA060c$Q17<-AGA060c$Q16
AGA060c$Q16<-NULL

TILL009c$Q25.1.<-NULL
TILL009c$Q25.2.<-NULL
TILL009c$Q25.3.<-NULL
TILL009c$Q25.4.<-NULL

#DIF040c$Q16.1.<-NULL
#DIF040c$Q16.2.<-NULL
#DIF040c$Q16.3.<-NULL
#DIF040c$Q15<-NULL

DIF048c$Q16.1.<-NULL
DIF048c$Q16.2.<-NULL
DIF048c$Q16.3.<-NULL
DIF048c$Q15<-NULL

DIF045c$Q16.1.<-NULL
DIF045c$Q16.2.<-NULL
DIF045c$Q16.3.<-NULL
DIF045c$Q15<-NULL

AGA062c$Q32.1.<-NULL
AGA062c$Q32.2.<-NULL
AGA062c$Q32.3.<-NULL
AGA062c$Q32.4.<-NULL
AGA062c$Q18<-NULL

DIF038c$Q41.1.<-DIF038c$Q32.1.
DIF038c$Q41.2.<-DIF038c$Q32.2.
DIF038c$Q41.3.<-DIF038c$Q32.3.
DIF038c$Q41.4.<-DIF038c$Q32.4.
DIF038c$Q17<-DIF038c$Q16

DIF038c$Q32.1.<- NULL
DIF038c$Q32.2.<- NULL
DIF038c$Q32.3.<- NULL
DIF038c$Q32.4.<- NULL
DIF038c$Q16<- NULL

AGA031c$Q41.1.<-AGA031c$Q53.1.
AGA031c$Q41.2.<-AGA031c$Q53.2.
AGA031c$Q41.3.<-AGA031c$Q53.3.
AGA031c$Q41.4.<-AGA031c$Q53.4.
AGA031c$Q17<-AGA031c$Q45

AGA031c$Q53.1.<- NULL
AGA031c$Q53.2.<- NULL
AGA031c$Q53.3.<- NULL
AGA031c$Q53.4.<- NULL
AGA031c$Q45<- NULL


#Combine tables

NCCIbind <- rbind.fill(AGA041c, AGA045c, AGA051c, AGA055c, AGA059c, AGA060c, AGA061c, DIF010c, DIF018c, DIF044c,NIA029c, TILL006c, TILL007c, TILL009c, DIF048c, DIF045c, AGA062c, DIF038c, AGA031c)

#Replace numerical codes with text labels

NCCIbind$Language <- factor(NCCIbind$Q1, levels = c(1,2,3,4,5,6,7,8), labels = c("Haussa", "Français", "Toubou", "Tamasheq","Kanouri","Zarma","Fulfulde Adamawa","Arabe"))
NCCIbind$Region <- factor(NCCIbind$Q2, levels = c(1,2,3,4,"-oth-"), labels = c("Agadez","Diffa","Niamey","Tillabery","Other"))
NCCIbind$Age.Group<-cut(NCCIbind$Q7,breaks=c(0,17,30,45,60,100), labels=c("Under 18","18-30","31-45","46-60","60+" ))
NCCIbind$Ethnicity <- factor(NCCIbind$Q9, levels = c(1,2,3,4,5,6,7,8), labels = c("Haussa", "Touareg", "Peul", "Zarma/Songhai","Toubou","Kanouri","Arabe","Je préfère ne pas répondre"))
NCCIbind$Gender<-NCCIbind$Q8
NCCIbind$Participation<-factor(NCCIbind$Q10, labels = c("Je suis un jeune participant à la formation et un membre de l'équipe qui va bénéficier des unités de production d'eau","Je suis un organisateur (autorité, partenaire)","Je suis un membre de la communauté (spectateur de processus)", "Sans réponse" ))
NCCIbind$Selection.Beneficiaries <- factor(NCCIbind$Q17, levels = c(1,2,3,4,5,6), labels = c("Très juste", "Juste", "Neutre", "Peu juste","Très injuste","Sans Response"))


#Create separate table for ‘multiple selection’ questions

NCCImelt2 = melt(subset(NCCIbind, Q41.1.=="Y" | Q41.2.=="Y" | Q41.3.=="Y" | Q41.4.=="Y"), id.vars=c("Q1","Q2","Q6","Q7","Q8","Q9","Q10"), measure.vars=c("Q41.1.","Q41.2.","Q41.3.","Q41.4."))
NCCImelt2$QForm <- paste(NCCImelt2$variable,NCCImelt2$value)
NCCImelt2$Comment.Entendu <- factor(NCCImelt2$QForm, levels = c("Q41.1. Y","Q41.2. Y", "Q41.3. Y", "Q41.4. Y"), labels = c("Via les cartes d'information ", "Au travers d'annonces pendant l'activité ", "A la radio", "Par le bouche à oreille"))
NCCImelt2$QForm<-NULL

NCCIbind$Cartes.information<-NCCIbind$Q41.1.
NCCIbind$Annonces.pendant<-NCCIbind$Q41.2.
NCCIbind$radio<-NCCIbind$Q41.3.
NCCIbind$bouche.orielle<-NCCIbind$Q41.4.

NCCIbind$Q41.1.<-NULL
NCCIbind$Q41.2.<-NULL
NCCIbind$Q41.3.<-NULL
NCCIbind$Q41.4.<-NULL

save.image()

