setwd("c:/Users/Basov_il/Documents/GitHub/Capstone/")
uni_tdm_freq<-uni_freq[1:15000]
bi_tdm_freq<-bi_freq[1:700000]
tri_tdm_freq<-tri_freq[1:3000000]
four_tdm_freq<-four_freq[1:4000000]
dict<-list()
#tri_tdm_freq<-c("thanks for that"=5,"all of that"=3,"is that all"=1,"sorry for that"=1, "nothinf of these"=0)
# for(name in names(tri_tdm_freq)){
#   data<-strsplit(name," ")[[1]]
#   if (data[2] %in% names(dict)){
#     if(data[1] %in% names(dict[[data[2]]]["l"])){
#     } else{
#         dict[[data[2]]][["l"]][[data[1]]]<-data[3]
#     }
#   }else{
#     dict[[data[2]]]<-list("val"="", "l"=list())
#     dict[[data[2]]][["l"]][[data[1]]]<-data[3]
#   }
# }
fourth_word<-function(x){
  data<-strsplit(x," ")[[1]]
  data[4]
}
first_word<-function(x){
  data<-strsplit(x," ")[[1]]
  data[1]
}
second_word<-function(x){
  data<-strsplit(x," ")[[1]]
  data[2]
}
third_word<-function(x){
  data<-strsplit(x," ")[[1]]
  data[3]
}
# tri_tdm_freq<-c("thanks for that"=5,"all of that"=3,"is that all"=1,"sorry for that"=1, "nothinf of these"=0)
v<-sapply(names(tri_tdm_freq), last_word)
v1<-sapply(names(tri_tdm_freq), first_word)
v2<-sapply(names(tri_tdm_freq), second_word)
df_tri_fin<-data.frame(SecondWord = v2, FirstWord = v1, Prediction1 = v, Ind=1:3000000, stringsAsFactors=FALSE)
save(df_tri_fin, file="tri_full.Rda")
df1<-aggregate(Ind~FirstWord+SecondWord, df_tri_fin, min)
df_tri_fin<-df_tri_fin[df_tri_fin$Ind %in% df1$Ind,]
save(df_tri_fin, file="tri_freq.Rda")

df_tri_fin$FirstWord<-tolower(df_tri_fin$FirstWord)
df_tri_fin$SecondtWord<-tolower(df_tri_fin$SecondWord)
df_tri_fin$Prediction1<-tolower(df_tri_fin$Prediction1)
df1<-aggregate(Ind~FirstWord+SecondWord+Prediction1, df_tri_fin, min)

bi_df$FirstWord<-tolower(bi_df$FirstWord)
bi_df$Prediction<-tolower(bi_df$Prediction)
df1<-aggregate(Ind~FirstWord+Prediction, bi_df, min)

v<-sapply(names(four_tdm_freq), fourth_word)
v1<-sapply(names(four_tdm_freq), first_word)
v2<-sapply(names(four_tdm_freq), second_word)
v3<-sapply(names(four_tdm_freq), third_word)
df_four_fin<-data.frame(ThirdWord = v3, FirstWord = v1, SecondWord = v2, Prediction1 = v, Ind=1:4000000, stringsAsFactors=FALSE)
save(df_four_fin, file="four_full.Rda")
df1<-aggregate(Ind~FirstWord+SecondWord+ThirdWord, df_four_fin, min)
df_four_fin<-df_four_fin[df_four_fin$Ind %in% df1$Ind,]
save(df_four_fin, file="four_freq.Rda")

bi_v<-sapply(names(bi_tdm_freq), second_word)
bi_v1<-sapply(names(bi_tdm_freq), first_word)
bi_df<-data.frame(FirstWord=bi_v1, Prediction=bi_v, Ind=1:700000,  stringsAsFactors=FALSE)
save(bi_df, file="bi_full.Rda")
bi_df1<-aggregate(Ind~FirstWord, bi_df, min)
bi_df_fin<-bi_df[bi_df$Ind %in% bi_df1$Ind,]
save(bi_df_fin, file="bi_freq.Rda")

df_uni_fin<-data.frame(Prediction=names(uni_tdm_freq), Ind=1:15000,  stringsAsFactors=FALSE)
save(df_uni_fin, file="uni_full.Rda")



head(df[df$LastWord=="a" & df$PreviousWord=="take","Prediction1"],50)
head(bi_df[bi_df$LastWord=="bouqet","Prediction"],20)