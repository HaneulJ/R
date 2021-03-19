library(rvest)
library(XML)
library(httr)
library(rvest)
library(RSelenium)
# selenium 구동하기
# java -Dwebdriver.chrome.driver="chromedriver.exe" -jar selenium-server-standalone-4.0.0-alpha-1.jar -port 4445


remDr <- remoteDriver(remoteServerAddr = 'localhost', port = 4445, browserName ='chrome')
remDr$open() 
remDr$navigate("http://www.google.com")

remDr$navigate("https://www.saramin.co.kr/zf_user/help/live?listType=news&category=10&menu=1&page=")


# 취업뉴스

title <- NULL; date <- NULL

for(n in 1:13){
  site <- paste0('https://www.saramin.co.kr/zf_user/help/live?listType=news&category=10&menu=1&page=',n)
  text <- read_html(site, encoding = "utf-8")
  remDr$navigate(text)
  
  for(idx in 1:20){
    jobt <- html_text(html_nodes(text,xpath=paste0('//*[@id="content"]/div[2]/div[2]/table/tbody/tr[',idx,']/td[1]/a')))
    title[idx] <- jobt
    
    jobd <- html_text(html_nodes(text,xpath=paste0('//*[@id="content"]/div[2]/div[2]/table/tbody/tr[',idx,']/td[2]')))
    date[idx] <- jobd                                     
  }
  nextPage <- remDr$findElement(using='css selector', " #content > div.wrap_board > div.pagination.pagination2 > a.btnNext")
  nextPage$clickElement()
  Sys.sleep(1)
}

joblist <- data.frame(title, date)

View(joblist)

















# case2
for(n in 1:13){
  site <- paste0('https://www.saramin.co.kr/zf_user/help/live?listType=news&category=10&menu=1&page=',n)
  text <- read_html(site, encoding = "utf-8")
  
  jobt <- NULL; jobd <- NULL
  
  jobt <- xpathSApply(htmlParse(site),'//*[@id="content"]/div/div/table/tbody/tr/td/a', xmlValue)
  jobt
  
  jobd <-  xpathSApply(htmlParse(site),'//*[@id="content"]/div/div/table/tbody/tr/td', xmlValue)
  jobd                                     
}
nextPage <- remDR$findElement(using='css selector', " #content > div.wrap_board > div.pagination.pagination2 > a.btnNext")
nextPage$clickElement()
Sys.sleep(1)
}

joblist <- data.frame(jobt, jobd)

View(joblist)


# case 3
jobt <- paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.content_tit > a')
jobd <- paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.date')

jobtitle <- remDr$findElements(using = 'css selector', jobt)
title <- sapply(jobtitle, function(x) {x$getElementText()})
title <- unlist(title)

jobdate <- remDr$findElements(using = 'css selector', jobd)
date <- sapply(jobdate, function(x) {x$getElementText()})
date <- unlist(date)
}

joblist <- cbind(title, date)
joblist <- as.data.frame(joblist)
View(joblist)






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




library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(dplyr)
library(tm)

windowsFonts(lett=windowsFont("휴먼옛체")) 
windowsFonts(dog=windowsFont("THE개이득"))


jobnews <- read.table("data/newstitle.txt", sep="")
head(jobnews)
content <- gsub("[[:punct:]]","", jobnews)

content <- Filter(function(x){nchar(x)>=2},content)





nouns <- extractNoun(content) 

wordcount <- table(unlist(nouns))

df_word <- as.data.frame(wordcount, stringsAsFactors = ctors = F)



wordcloud(content, 
          random.order = F,   # 빈도수가 높을수록 가운데 사수
          rot.per = 0.5, scale = c(4, 1), # 제일 큰 애와 작은 애의 비율
          colors = rainbow(7), family ="dog")

  




warnings()




# 기업뉴스
company <- "https://www.saramin.co.kr/zf_user/jobarchive/company-news"





