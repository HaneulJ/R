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



# 취업뉴스
remDr$navigate("https://www.saramin.co.kr/zf_user/help/live?category=10")

title <- NULL; date <- NULL

for (i in 1:20){
jobt <- paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.content_tit > a')
jobd <- paste0('#content > div.wrap_board > div.tblType > table > tbody > tr:nth-child(',i,') > td.date')

jobtitle <- remDr$findElement(using = 'css selector', jobt)
title <- sapply(jobtitle, function(x) {x$getElementText()})
title <- unlist(title)

jobdate <- remDr$findElement(using = 'css selector', jobd)
date <- sapply(jobdate, function(x) {x$getElementText()})
date <- unlist(date)
}

joblist <- cbind(title, date)
joblist <- as.data.frame(joblist)
View(joblist)



# https://quantumcomputer.tistory.com/98
# 파이프이용해섣 ㅏ시해보기
html_nodes()








# 기업뉴스
remDr$navigate("https://www.saramin.co.kr/zf_user/jobarchive/company-news")



