# https://comic.naver.com/genre/bestChallenge.nhn 사이트의 콘텐츠 일부 박스로 표시된 내용을 추출하고
# comicName, comicSummary, comicGrade 열명으로 DataFrame을 생성하여 navercomic.csv로 저장하고 소스는 navercomic.R 로 저장한다 .
# 20페이지를 크롤링하고 스크래핑한다

library(rvest)
library(XML)
library(httr)

navercomic <- NULL
comicName <- NULL; comicSummary <- NULL; comicGrade <- NULL; 

for(n in 1:20){
  site <- paste0("https://comic.naver.com/genre/bestChallenge.nhn?&page=",n)
  text <- read_html(site, encoding = 'utf-8')
  
  for(id in 1: 12){
    title1 <- html_text(html_nodes(text, "#content > div:nth-child(5) > table > tr > td > div.challengeInfo > h6 > a")[id])
    title2 <- gsub(" ", "", title1)
    title3 <- gsub("\n","",title2)
    comicName[((n-1)*24) + id]  <- title3
    
    summary <- html_text(html_nodes(text, "#content > div:nth-child(5) > table > tr > td > div.challengeInfo > div.summary")[id])
    comicSummary[((n-1)*24) + id] <- summary
    
    Grade<-html_text(html_nodes(text,"#content > div:nth-child(5) > table > tr > td > div.challengeInfo > div.rating_type > strong")[id])
    comicGrade[((n-1)*24) + id] <- Grade
  }
  for(id in 1: 12){
    title1 <- html_text(html_nodes(text,"#content > div:nth-child(7) > table > tr > td > div.challengeInfo > h6 > a")[id])
    title2 <- gsub(" ", "", title1)
    title3 <- gsub("\n", "", title2)
    comicName[((n-1)*24) + id + 12] <- title3
    
    summary <- html_text(html_nodes(text,"#content > div:nth-child(7) > table > tr > td > div.challengeInfo > div.summary")[id])
    comicSummary[((n-1)*24) + id + 12] <- summary
    
    Grade <- html_text(html_nodes(text,"#content > div:nth-child(7) > table > tr > td > div.challengeInfo > div.rating_type > strong")[id])
    comicGrade[((n-1)*24) + id + 12] <- Grade
  }
}

navercomic <- data.frame(comicName, comicSummary, comicGrade)
View(navercomic)

write.csv(navercomic,'output/navercomic.csv')