library(shiny)
library("tm")
load("./data/uni_full.Rda")
print("uni OK")
load("./data/bi_freq.Rda")
print("bi OK")
load("./data/tri_freq.Rda")
print("tri OK")
load("./data/four_freq.Rda")
print("four OK")
badwords <- readLines("./data/badwords.txt")
print("badwords OK")
 
shinyServer(
    function(input, output) {
        observeEvent(input$predict, {
            corps <- VCorpus(VectorSource(c(input$phrase)))
            corps <- tm_map(corps, tolower)
            corps <- tm_map(corps, removePunctuation)
            corps <- tm_map(corps, removeNumbers)
            corps <- tm_map(corps, removeWords, badwords)
            corps <- tm_map(corps, stripWhitespace)
            text<-corps[[1]]
            data<-strsplit(text," ")[[1]]
            len<-length(data)
            if(len>2){
                #df<-df_four_fin[df_four_fin$FirstWord==data[len-2] & df_four_fin$SecondWord==data[len-1] & df_four_fin$ThirdWord==data[len], "Prediction1"]
                df<-subset(df_four_fin, FirstWord==data[len-2] & SecondWord==data[len-1] & ThirdWord==data[len], "Prediction1")
                if(nrow(df)>0){
                    output$prediction <- renderText({df$Prediction1})
                    print("four")
                    return(1) 
                }
            }
            if(len>1){
                df<-subset(df_tri_fin, FirstWord==data[len-1] & SecondWord==data[len], "Prediction1")
                if(nrow(df)>0){
                    output$prediction <- renderText({df$Prediction1})
                    print("three")
                    return(1) 
                }
            }
            
            if(len>0){
                df<-subset(bi_df, FirstWord==data[len], "Prediction")
                if(nrow(df)>0){
                    output$prediction <- renderText({df$Prediction})
                    print("two")
                    return(1) 
                } else {
                    output$prediction <- renderText({"the"})
                    print("one")
                    return(1)
                }
            }
            output$prediction <- renderText({""})
            
            
        })
    }    
)