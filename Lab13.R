# yes24.txt 파일을 읽고 명사만을 추출한다.
# 텍스트 전처리 - 한글이 아닌 것은 모두 제거한다.
# 단어의 길이가 2자이상이고 4자 이하인 단어만을 필터링한다.
# 각 단어의 개수를 센다.
# 많은 순으로 정렬한다.
# 데이터프레임으로 만든다.
# 다음과 같이 워드크라우드2로 시각화한다. 
# 시각화 한 것을 htmltools::save_html () 함수를 사용하여 yes24.html 로 저장한다.

library(KoNLP)
library(htmlwidgets)
library(wordcloud2)


txt <- readLines("output/yes24.txt", encoding= "UTF-8")
yes24N <- unlist(extractNoun(txt))

yes24N <- gsub("[^가-힣]", "", yes24N)
yes24N <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, yes24N)

yes24 <- table(yes24N)
yes24 <- sort(yes24, decreasing = T)
yes24 <- as.data.frame(yes24)
View(yes24)

wordcloud2(yes24, fontFamily ="THE개이득",)
result <- wordcloud2(data= yes24, shape="star")
htmltools::save_html(result,"output/yes24.html")

# [^가-힣[:space:]]