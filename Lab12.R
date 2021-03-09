intall.packages(stringr)
library(stringr)

# 문제 1
# 'Happy', 'Birthday', 'to', You'로 구성된 5텍스트 벡터 v1 생성한 후 벡터의 길이와 문자 개수의 합을 계산한다. 
v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1)
sum(nchar(v1))

str_count(v1)
cat(length(v1))
cat(sum(v1))

# 문제 2
# 1번 문제에서 생성한 텍스트 벡터 v1의 개별 원소들을 연결하여 다음과 같은 텍스트 벡터를 생성한다. 
# 연결된 새로운 텍스트 벡터의 길이와 문자 개수의 합을 계산한다.
v2 <- paste(v1, collapse = " "); v2
length(v2)
nchar(v2)



# 문제 3
# paste() 함수와 LETTERS 상수 벡터를 이용하여 다음과 같은 문자 벡터를 생성한다(첫 번째 벡터는 문자와 숫자 사이에 공백이 있으며, 두 번째 벡터는 문자와 숫자가 서로 붙어 있음).
paste(LETTERS[1:10],seq=(1:10), sep=" ")
paste(LETTERS[1:10],seq=(1:10), sep="")

paste(LETTERS[1:10],seq=(1:10))
paste0(LETTERS[1:10],seq=(1:10))


# 문제 4
# 텍스트 'Good Morning'을 분할하여 다음과 같은 리스트 형식으로 출력한다.
v4 <- list("Good", "Morning"); v4

text1 <- "Good Moring"
(splited_text = strsplit(text1, split = " ")[[1]])
list(splited_text[1], splited_text[2])

list(str_sub(text1,1,4), str_sub(text1,-7))
list(substr(text1,1,4), substring(text1,6))

(a <- strsplit(text1," "))
text1.list <- list(a[[1]][1], a[[1]][2]); text1.list


# 문제 5
# 다음 텍스트 벡터를 단어 단위로 분할한다. 단, 모든 쉼표(,)와 하이픈(-)을 제거한다.
v5 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", "That's why we call it the present – from kung fu Panda")
# v5 <- gsub( "[[:punct:]]", "" ,v5) # -와 ,만 없애야함
# v5 <- gsub("[,–]", "", v5)
v5 <- gsub("\\s{2}", " ", v5)  # \\{2}: 공백이 2개 이어서 나오는 거를 " "로 대체
v5_split <- unlist(strsplit(v5, split=" ")); v5_split # strsplit가 자동으로 리스트로 출력되기때문에 unlist해줘야 함


# 문제 6
# 다음 문자열을 s1 변수에 저장한 다음 요구 사항대로 처리한다.
# 한글만 삭제하여 r1 에 저장 한다.
# 특수문자들을 삭제하여 r2 에 저장 한다.
# 한글과 특수문자들을 삭제하여 r3 에 저장 한다.
# 100을 '백'으로 변환하여 r4에 저장 한다.

s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]", "", s1); r1
r2 <- gsub("[[:punct:]]", "", s1); r2
r3 <- gsub("[가-힣]", "", r2); r3
# r3 <- gsub("[가-힣]|[[:punct:]]", "", s1); s1 # |: or연산자 이용
r4 <- gsub("100", "백", s1); r4



# 문제 7
# hotel.txt를 읽고 제일 많이 나온 명사 10개를 명칭(wname)과 빈도수(wcount)로 구성되는 데이터프레임을 생성해서 hotel_top_word.csv 로 저장한다. (내림차순으로 구성)

hotel_top_word1 <- readLines("output/hotel.txt", encoding = "CP949") 
htw1 <- gsub("[[:punct:]]","", hotel_top_word1)
htw1 <- gsub("[A-Za-z]","",hotel_top_word1)
htw1 <- gsub("\\d+","",hotel_top_word1)
htw1 <- Filter(function(x) {nchar(x) >= 2}, htw1)

htw2 <- extractNoun(htw1)
htw3 <- table(unlist(htw2))
htw4 <- head(sort(htw3, decreasing = T), 10)

hotel_top_word <- as.data.frame(htw4)
names(hotel_top_word) <- c('wname', 'wcount')
View(hotel_top_word)

write.csv(hotel_top_word, "output/hotel_top_word.csv")





a <- readLines('output/hotel.txt')
getwd()
library(KoNLP)
a <- sapply(a, extractNoun, USE.NAMES = F)
a <- table(unlist(a))
a <- sort(a, decreasing = T)
df <- data.frame(a[1:10])
colnames(df) <- c("wname","wcount")
View(df)
