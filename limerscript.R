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

TILL009c$Q41.1.<-TILL009c$Q25.1.
TILL009c$Q41.2.<-TILL009c$Q25.2.
TILL009c$Q41.3.<-TILL009c$Q25.3.
TILL009c$Q41.4.<-TILL009c$Q25.4.

DIF040c$Q41.1.<-DIF040c$Q16.1.
DIF040c$Q41.2.<-DIF040c$Q16.2.
DIF040c$Q41.3.<-DIF040c$Q16.3.
DIF040c$Q41.4.<- NA
DIF040c$Q17<-DIF048c$Q15

DIF048c$Q41.1.<-DIF048c$Q16.1.
DIF048c$Q41.2.<-DIF048c$Q16.2.
DIF048c$Q41.3.<-DIF048c$Q16.3.
DIF048c$Q41.4.<- NA
DIF048c$Q17<-DIF048c$Q15


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

#Comine tables

NCCIbind <- rbind.fill(AGA041c, AGA045c, AGA051c, AGA055c, AGA059c, AGA060c, AGA061c, DIF010c, DIF018c, DIF044c,NIA029c, TILL006c, TILL007c, TILL009c, DIF048c)
