# 다음에제시된 웹 페이지는 다음뉴스의 랭킹페이지 이다 http://media.daum.net/ranking/popular/
# 이 페이지에서 각 뉴스의 제목과 이 뉴스를 올린 신문사명칭을 스크래핑 
# (50 개하여 newstitle, newspapername형식의 데이터프레임을 만들어 CSV 파일로 저장한다 output/ daumnews.csv)

# 인덱싱방법
newstitle <- NULL; newspapername <- NULL; page <- NULL;

daumNews <-  read_html('http://media.daum.net/ranking/popular/', encoding="CP949")

for (index in 1:50){
  dnewstitle <-html_text(html_nodes(daumNews, xpath=paste0('//*[@id="mArticle"]/div[2]/ul[3]/li[',index , ']/div[2]/strong/a')))
  newstitle[index] <-  dnewstitle
  
  dnewspapername <- html_text(html_nodes(daumNews, xpath=paste0('//*[@id="mArticle"]/div[2]/ul[3]/li[', index,']/div[2]/strong/span')))
  newspapername[index] <- dnewspapername 
  
}
page <- data.frame(newstitle, newspapername) 
View(page)
write.csv(page, "data/daumnews.csv")


# 인덱싱 & 반복문 안쓰고 더 간단히!
library(XML)
library(rvest)
newstitle <- NULL; newspapername <- NULL; page1 <- NULL; daumNews <- NULL

daumNews1 <-  read_html('http://media.daum.net/ranking/popular/')

dnewstitle1 <- xpathSApply(htmlParse(daumNews1), '//*[@id="mArticle"]/div/ul/li/div/strong/a', xmlValue)
dnewstitle1
dnewspapername1 <- xpathSApply(htmlParse(daumNews1), '//*[@id="mArticle"]/div/ul/li/div/strong/span', xmlValue)
dnewspapername1

page1 <- data.frame(newstitle=dnewstitle1 , newspapername=dnewspapername1) 
View(page1)