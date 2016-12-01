#Use setwd('path/to/project') to set working directory

#Load packages

library(limer)
library(plyr)
library(reshape2)

#connect to limer, change api link, username and password where necessary

options(lime_api = 'http://survey.itechcenter.ne/index.php/admin/remotecontrol')
options(lime_username = 'XXXXX')
options(lime_password = 'XXXXX')
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
