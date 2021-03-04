library() # 설치된 패키지 리스트
installed.packages()
search()

install.packages("rvest") 
install.packages("XML")
install.packages("httr")

library(rvest)
library(XML)
library(httr)


# [ 예제1 ]
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url) # 끌어오고자 하는 url 열기
text


nodes <- html_nodes(text, "div") # 태그 선택자 # 모든 div태그에 대한 DOM객체를 리턴하라
nodes                            # css = "div"
title <- html_text(nodes)  # 태그들의 컨텐트가 벡터로 출력
title

node1 <- html_nodes(text, "div:nth-of-type(1)") # 첫번째 div태그
node1
html_text(node1)
html_attr(node1, "style")  # _attr: 속성 추출

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)

# [ 예제2 ]
# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

# 목록 아이템 추출
title <- html_text(html_nodes(html, "#apiDataList .title")) # html_nodes에 의해 선택자에 알맞는 텍스트 호출?
title <- html_text(html_nodes(html, "#apiDataList .title"), trim=T) # trim=T: 주어진 내용에 앞뒤에 있는 분리문자(공백, 개행, 탭 등) 제거
title

# 목록 아이템 설명 추출
desc <- html_text(html_nodes(html, "#apiDataList .ellipsis")) # 작성된 만큼만 내용 추출
desc

# 데이터 정제: 제어문자를 공백으로 대체
title <- gsub("[[:cntrl:]]", "", title) # ctnrl: control character, \n, \t 등
title

desc <- gsub("[[:cntrl:](</br>)∙]", "", desc) # cntrl과 </br>, ∙ 제거 # ∙은 data.frame때문에 제거해야함!!
desc

# 데이터 출력
api <- data.frame(title, desc)
api


# [ 예제3 ]
# 단일 페이지(rvest 패키지 사용)
library(rvest)
# 영화 제목과 평점 읽기
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url,  encoding="CP949")  # CP949, EUC-KR, KSC5601 다 같은 char셋
text
#save(text, file="imsi.rda")
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
page <- data.frame(title, point)
print(page)


# 영화 제목과 평점, 리뷰글 읽기
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url,  encoding="CP949")
text
#save(text, file="imsi.rda")
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em") # CSS 선택자
point <- html_text(nodes)
point
page <- data.frame(title, point)
print(page)
# 영화리뷰(글이 비어져있을 때는 문제될 수 있음)
review <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()") # xpath는 element도 선택 가능
review <- html_text(review, trim=TRUE)
review <- review[nchar(review)>0] #nchar: 분리문자 # 공백제거?!, null문자열은 그대로
review
page <- data.frame(title, point, review)
print(page)


# [ 예제4 ]
# 영화 제목, 평점, 리뷰글 읽기
text<- NULL; vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=4"
text <- read_html(url,  encoding="CP949")
text

for (index in 1:10) {
  # 영화제목
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b")) # 정해진 룰?
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 
  node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  print(node)
  review = node[4] 
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
View(page)
write.csv(page, "output/movie_reviews1.csv")

# [ 예제5 ]
# 여러 페이지1
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "output/movie_reviews2.csv")

# [ 예제6 ]
# 여러 페이지2
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  for (index in 1:10) {
    # 영화제목
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    title <- html_text(node)
    vtitle[index] <- title
    # 영화평점
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    point <- html_text(node)
    vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    print(node)
    review = node[4] # 질문!!
    vreview <- append(vreview, review)
  }
  page <- data.frame(vtitle, vpoint, vreview)
  movie.review <- rbind(movie.allreview, page)
  
}
write.csv(movie.review, "output/movie_reviews3.csv")


# [ 예제7 ]
# 한겨레 페이지(XML 패키지 사용)
library(XML)
library(rvest)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue);  # //~:(조상이 있든 없든)~를 찾고, # /:최상위 태그
content # xpath는 @사용? # 모든 div 출력?(48개)

# [ 예제8 ]
# W3C의 HTTP 프로토콜 스팩에서 Table of Contents 읽기
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), 'div.toc h2')
title2 = html_text(title2)
title2

