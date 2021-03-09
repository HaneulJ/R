# 워드 클라우드
install.packages("wordcloud")
install.packages("wordcloud2")
library(wordcloud)
library(wordcloud2)

(words <- read.csv("data/wc.csv"))
head(words)
?windowsFonts
windowsFonts(lett=windowsFont("휴먼옛체")) # 설치가 되어있는 폰트 load하기
windowsFonts(dog=windowsFont("THE개이득"))
wordcloud(words$keyword, words$freq) # plots에서 나타남, 모양 랜덤하게 출력
wordcloud(words$keyword, words$freq,family="lett") # family: 폰트 설정
wordcloud(words$keyword, words$freq,family="dog")
wordcloud(words$keyword, words$freq, 
          min.freq = 2, 
          random.order = F,   # 빈도수가 높을수록 가운데 사수
          rot.per = 0.5, scale = c(4, 1), # 제일 큰 애와 작은 애의 비율
          colors = rainbow(7))

wordcloud(words$keyword, words$freq, 
          min.freq = 2, 
          random.order = F, 
          rot.per = 0.5, scale = c(4, 1), 
          colors = rainbow(20), family="lett") # rainbow: RGB값 기반(무지개 계열 선택)
# wordcloud: 이미지로 만들어져서 png로 저장


# wordcloud2: html, css, javascript로 동적으로 표현, 웹페이지로 만듦(간단한 이벤트 발생가능)
wordcloud2(words, fontFamily = "휴먼옛체")
wordcloud2(words,rotateRatio = 1) # ratio: 글씨 굵기?
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0)
wordcloud2(words,size=0.5,col="random-dark")
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
wordcloud2(data = demoFreq) # str(demoFreq) : R이 내장하고 있는 데이터 셋
wordcloud2(data = demoFreq, shape = 'diamond')
wordcloud2(data = demoFreq, shape = 'star')
wordcloud2(data = demoFreq, shape = 'cardioid')
wordcloud2(data = demoFreq, shape = 'triangle-forward') # 오른쪽 방향 세모
wordcloud2(data = demoFreq, shape = 'triangle')
result<-wordcloud2(data = demoFreq, shape = 'pentagon')
library(htmlwidgets)
saveWidget(result,"output/tmpwc1.html",selfcontained = T) # selfcontained = T : HTML 문서안에 필요한 정보를 다 넣어라
saveWidget(result,"output/tmpwc2.html",selfcontained = F) # F: 필요한 정보는 다른 곳에서 끌어와라(더 간단)
htmltools::save_html(result,"output/tmpwc3.html") # 호출방법


head(demoFreq)
str(demoFreq)

wordcloud(names(final),final)
wordcloud(names(final),final, min.freq = 1)
wordcloud2(final)

# 트위터 글 워드클라우드
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "취업"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)

content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content <- gsub("취업", "", content)  
word <- extractNoun(content)
cdata <- unlist(word)

cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))

wordcloud2(wordcount, fontFamily = "맑은고딕", size=0.5,
           color="random-light", backgroundColor="black")

wordcloud2(wordcount, fontFamily = "THE개이득", size=0.5,
           color="random-light", backgroundColor="black")

wordcloud2(wordcount, size=0.5,
           color="random-light")



install.packages("tm")
library(tm)

getSources() # 코퍼스 객체를 만들 수 있는 소스객체


lunch <- c("커피 파스타 치킨 샐러드 아이스크림",
           "커피 우동 소고기김밥 귤",
           "참치김밥 커피 오뎅",
           "샐러드 피자 파스타 콜라",
           "티라무슈 햄버거 콜라",
           "파스타 샐러드 커피"
)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps)
tdm
as.matrix(tdm)

cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps, 
                          control=list(wordLengths = c(1, Inf)))

tdm
(m <- as.matrix(tdm))

#가장 많이 선택된 메뉴나 학생?
rowSums(m) 
colSums(m)

com <- m %*% t(m)  # 행열 곱 연산
com # 동시출현한 단어의 개수 알 수 있음




install.packages("qgraph")
library(qgraph) 
# 같이 등장한 term에 대한 관계 시각화?(횟수나 연관성 표시)

qgraph(com, labels=rownames(com), diag=F, 
       layout='spring',  edge.color='blue', 
       vsize=log(diag(com)*800))

library(rvest)
library(XML)
html.parsed <- htmlParse("data/TextofSteveJobs.html")
text <- xpathSApply(html.parsed, path="//p", xmlValue)
text

text <- text[4:30]
text
docs <- VCorpus(VectorSource(text))
docs

# tm_map: 

toSpace <- content_transformer(function(x, pattern){return(gsub(pattern, " ", x))})
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, ";")
docs <- tm_map(docs, toSpace, "'")

docs[[17]]
docs[[19]]
docs[[17]]$content
docs[[19]]$content

docs <- tm_map(docs, removePunctuation)
text[17]
docs[[17]]$content


docs <- tm_map(docs, content_transformer(tolower))
docs[[17]]$content
docs <- tm_map(docs, removeNumbers)
docs[[17]]$content
docs <- tm_map(docs, removeWords, stopwords("english"))
docs[[17]]$content
docs <- tm_map(docs, stripWhitespace)
docs[[17]]$content
docs <- tm_map(docs, stemDocument)
docs[[17]]$content

tdm <- TermDocumentMatrix(docs)
tdm

inspect(tdm[50:60, 1:5])

termFreq <- rowSums(as.matrix(tdm))
head(termFreq)
termFreq[head(order(termFreq, decreasing=T))]

# 막대그래프
barplot(termFreq[termFreq >= 7], 
        horiz=T, las=1, cex.names=0.8,  # horiz: 가로
        col=rainbow(16), xlab="word Frequency", ylab="Words")




# 문서(문장)의 유사도 분석


install.packages("proxy")
library(proxy)
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)   # d1, d3 동일 # d4는 완전히 다름
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps) # DocumentTermMatrix: Document가 행, Document에 포함되는 모든 단어들이 열
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm) # Document간의 유사성
com <- m %*% t(m) # 행열 곱 연산
com

# 0: 똑같음, 1: 완전 다름
dist(com, method = "cosine") # dist: distance 거리의 약어, 코사인 거리(음수 x)
dist(com, method = "Euclidean")
# 음의 값 X

?dist

?DocumentTermMatrix

# tm 패키지에서 제공, 아규먼트를 안주면 영어가 기본
stopwords()


# tm 패키지를 활용한 숫자, 특수문자, 불용어 삭제하기
# 불용어: 

mystopwords <- readLines("data/stopwords_ko.txt", encoding="UTF-8")
text <- readLines("data/stopwords_testdata.txt", encoding="UTF-8")
docs <- Corpus(VectorSource(text))
inspect(docs)
docs <- tm_map(docs, removeNumbers)
inspect(docs)
docs <- tm_map(docs, removePunctuation)
inspect(docs)
docs <- tm_map(docs, removeWords, mystopwords)
inspect(docs)


# 더 간단히
docs2 <- Corpus(VectorSource(text))
tdm1 <- TermDocumentMatrix(docs2, control=list(wordLengths = c(1, Inf)))
as.matrix(tdm1)
tdm2 <- TermDocumentMatrix(docs2, control=list(
  removePunctuation = T, 
  removeNumbers = T,
  wordLengths = c(1, Inf),
  stopwords=mystopwords))
as.matrix(tdm2)


stopwords()


# 한국어 불용어
# https://www.rdocumentation.org/packages/stopwords/versions/2.2

install.packages("stopwords")

stopwords::stopwords_getsources()
stopwords::stopwords_getlanguages("marimo") #마리모에서 지원하는 나라 언어 확인
head(stopwords::stopwords("ko", source = "marimo"), 100)

