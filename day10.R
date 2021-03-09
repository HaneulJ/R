ㅊ# 한국어 형태소 분석 패키지 설치
# Rtools 설치
# https://cran.r-project.org/bin/windows/Rtools/index.html
install.packages("Sejong")
install.packages("hash")
install.packages("tau")
install.packages("devtools")

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

library(KoNLP)
useSejongDic()
R.version

word_data <- readLines("data/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F) # 벡터가 가지고 있는 각각의 문장단위로 extracNoun 수행해서 명사만 받아오는 중
# USE.NAMES=F: 이름 붙이지않고 네임즈 벡터 출력
# "철갑을": 세종 딕셔너리에는 '철갑' 명사 등록X  > '철갑을'까지 인식 
word_data2
word_data3 <- extractNoun(word_data) # sapply 생략하고 추출해보기
word_data3

# 세종딕셔너리에 단어 추가(rebuild)
add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)
# buildDictionary: 로컬환경에서만 적용가능
# (등록하고자 하는 단어, rep('품사 적용', ~개 만큼), replace_usr_dic=T: load되어있는 dic에만 추가)

word_data3 <- extractNoun(word_data)
word_data3


undata <- unlist(word_data3)
undata

# 각각의 단어 개수 세기
word_table <- table(undata)
word_table


undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")
