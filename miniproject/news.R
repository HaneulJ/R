library(rvest)
library(XML)
library(httr)
library(rvest)
library(RSelenium)

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(dplyr)
library(tm)
library(htmlwidgets)
library(showtext)
showtext_auto()

windowsFonts(lett=windowsFont("휴먼옛체")) 
windowsFonts(dog=windowsFont("THE개이득"))

# selenium 구동하기
# java -Dwebdriver.chrome.driver="chromedriver.exe" -jar selenium-server-standalone-4.0.0-alpha-1.jar -port 4445



# 취업뉴스


# case 4
remDr <- remoteDriver(remoteServerAddr = 'localhost', port = 4445, browserName ='chrome')
remDr$open() 
site <- "https://www.saramin.co.kr/zf_user/help/live?listType=news&category=10&menu=1&page="
remDr$navigate(site)

ntitle <- NULL; ndate <- NULL
for (n in 2:15) {
  for (i in 1:20){
  jobt <- remDr$findElements(using='css selector', paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.content_tit > a'))
  title <- sapply(jobt, function(x) {x$getElementText()})
  ntitle <- append(ntitle, unlist(title))
  
  jobd <- remDr$findElements(using='css selector', paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.date'))
  date<- sapply(jobd, function(x) {x$getElementText()})
  ndate <- append(ndate, unlist(date))
} 
  nextPage <- remDr$findElement(using='css selector', paste0("#content > div.wrap_board > div.pagination.pagination2 > a:nth-child(",n,")"))
  if(n == 11){
    nP <- remDr$findElement(using='css selector', " #content > div.wrap_board > div.pagination.pagination2 > a.btnNext")
    nP$clickElement()
  }
  else if(n > 11){
    nextPage <- remDr$findElement(using='css selector', paste0("#content > div.wrap_board > div.pagination.pagination2 > a:nth-child(",n-9,")"))
    nextPage$clickElement()
    }
  else  nextPage$clickElement()
  
  Sys.sleep(1)
  
}
newslist <- data.frame(ntitle, ndate)
View(newslist)
write.csv(newslist, "output/newslist.csv")
write.table(newslist$ntitle, "data/newstitle.txt")



# 워드클라우드


jobnews <- read.table("data/newstitle.txt")
jobnews <- sapply(jobnews, extractNoun,USE.NAMES = F)
content <- unlist(jobnews)
head(content)

content <- Filter(function(x){nchar(x) >= 2},content)
content <- gsub("[[:punct:]]"," ", content)
content <- gsub("[[:digit:]]"," ", content)

wordcount <- table(content)
wordcount_head <- head(sort(wordcount, decreasing = T), 100)


sort(wordcount, decreasing = T)

newstitle <- wordcloud2(data = wordcount_head, shape = 'pentagon')

htmltools::save_html(newstitle,"output/newstitle.html")




# 기업뉴스

# case3
remDr <- remoteDriver(remoteServerAddr = 'localhost', port = 4445, browserName ='chrome')
remDr$open() 
company <- "https://www.saramin.co.kr/zf_user/jobarchive/company-news/index/page/"
remDr$navigate(company)

ctitle <- NULL; cdate <- NULL
  for (j in 2:11){
    for (p in 1:20){
      companyt <- remDr$findElements(using='css selector', paste0('#content > div.wrap_recently_news > div.news_list > form > table > tbody > tr:nth-child(',p,') > td:nth-child(1) > dl > dt > a:nth-child(1)'))
      title <- sapply(companyt, function(x) {x$getElementText()})
      ctitle <- append(ctitle, unlist(title))
      
      companyd <- remDr$findElements(using='css selector', paste0('#content > div.wrap_recently_news > div.news_list > form > table > tbody > tr:nth-child(',p,') > td:nth-child(2)'))
      date<- sapply(companyd, function(x) {x$getElementText()})
      cdate <- append(cdate, unlist(date))
    }    
    nextPage <- remDr$findElement(using='css selector', paste0("#content > div.wrap_recently_news > div.news_list > form > div.pagination > a:nth-child(",j,")"))
    nextPage$clickElement()
    Sys.sleep(1)
  }
 
 repeat{
   for (j in 3:12){
   for (p in 1:20){
     companyt <- remDr$findElements(using='css selector', paste0('#content > div.wrap_recently_news > div.news_list > form > table > tbody > tr:nth-child(',p,') > td:nth-child(1) > dl > dt > a:nth-child(1)'))
     title <- sapply(companyt, function(x) {x$getElementText()})
     ctitle <- append(ctitle, unlist(title))
     
     companyd <- remDr$findElements(using='css selector', paste0('#content > div.wrap_recently_news > div.news_list > form > table > tbody > tr:nth-child(',p,') > td:nth-child(2)'))
     date<- sapply(companyd, function(x) {x$getElementText()})
     cdate <- append(cdate, unlist(date))
   }    
   nextPage <- remDr$findElement(using='css selector', paste0("#content > div.wrap_recently_news > div.news_list > form > div.pagination > a:nth-child(",j,")"))
   nextPage$clickElement()
   Sys.sleep(1)
 }
}

companynews <- data.frame(title=ctitle[1:3349], date=cdate[1:3349])
View(companynews)
write.csv(companynews, "output/companynews.csv")

write.table(companynews$title, "data/companytitle.txt")


# 워드클라우드

cpnews <- read.table("data/companytitle.txt")
cpnews<- sapply(cpnews, extractNoun,USE.NAMES = F)
cptitle <- unlist(cpnews)
head(cptitle)

cptitle <- Filter(function(x){nchar(x) >= 2},cptitle)
cptitle <- gsub("[[:punct:]]"," ", cptitle)
cptitle <- gsub("[[:digit:]]"," ", cptitle)

cpcount <- table(cptitle)
cpcount_head <- head(sort(cpcount, decreasing = T), 1000)


cpnewstitle <- wordcloud2(data = cpcount_head, shape = 'circle')

htmltools::save_html(cpnewstitle,"output/cpnewstitle.html")
