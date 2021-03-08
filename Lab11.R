# gs25 사이트에서 2+1 행사를 진행하는 모든 상품들의 상품명과 가격을 추출하여 데이터 프레임으로 생성한 다음 gs25_twotoone.csv 에 저장하는 R 코드를 작성하시오.
# 저장할 때 상품명의 변수명은 goodsname, 가격의 변수명은 goodsprice 가 되도록 한다.
# 동적 웹 페이지의 크롤링과 스크래핑 실습으로 제출 파일명은 lab11.R와 gs25_twotoone.csv이다.
# http://gs25.gsretail.com/gscvs/ko/products/event-goods
library(RSelenium)
library(httr)
library(rvest)
library(XML)


remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)

tto <- remDr$findElement(using = 'css selector', "#TWO_TO_ONE")
tto$clickElement()

TTO <- NULL; btn<- NULL
goodsname <- NULL; name <- NULL
goodsprice <- NULL; price <- NULL

repeat{
  goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  name <- sapply(goodsnodes, function(x) {x$getElementText()})
  goodsname <- append(goodsname, unlist(name))
  
  goodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  price <- sapply(goodsnodes, function(x) {x$getElementText()})
  goodsprice <- append(goodsprice, unlist(price))
  
  
  btn <- remDr$findElement(using='css selector',"#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next")
  
  if(length(btn$getElementAttribute("onclick"))==0){
    cat("종료\n") 
    break; 
    }
  btn$clickElement()
  Sys.sleep(2)
} 

TTO <- data.frame(goodsname, goodsprice)
View(TTO)
write.csv(TTO, 'output/gs25_twotoone.csv')
