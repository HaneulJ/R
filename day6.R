# 날짜와 시간 관련 기능을 지원하는 함수들

(today <- Sys.Date()) # 대입 & 화면 출력
str(today)
class(today)
format(today, "%Y년 %m월 %d일%")
format(today, "%d일 %B %Y년")
format(today, "%y")
format(today, "%Y")
format(today, "%B");format(today, "%b") # B: 3월, b: 3
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date()
Sys.time(); str(Sys.time())
Sys.timezone()

as.Date('15/1/2018') # 에러 발생
as.Date('2018/1/15') # 년, 월, 일 로 작성되어야 인식
as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('4월 26, 2018',format='%B %d, %Y') # format정보 지정
as.Date('110228',format='%d%b%y') # NA 
as.Date('110228',format='%y%m%d') # m: 무조건 두자리 숫자
as.Date('11228',format='%d%b%y') 

x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S") # 시분초를 줬음에도 Date형식이라 안나옴
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S")
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S") # format 정보 줘야함!

x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")
str(datetime)

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00") # 날짜 기준이라 시간 차 x
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")

t<-Sys.time() # POSIXct객체
str(t)
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct)   # 객체상태 해제
unclass(lt)   # list 형태 , wday: 일 기준 몇일째, 
lt$mon+1 # +1 를 해줘야 1월부터~
lt$hour
lt$year+1900
as.POSIXct(1449894438,origin="1970-01-01") # origin을 기준으로 ~만큼 흘러간 초시간은 언제?  
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2021/03/02")$wday
as.POSIXlt("2021/03/04")$wday
as.POSIXlt("2021/03/05")$wday
as.POSIXlt("2021/03/06")$wday
as.POSIXlt("2021/03/07")$wday

#내가 태어난 요일 출력하기
myday<-as.POSIXlt("1997-05-10")
weekdays(myday) # 요일 구하기

#내가 태어난지 며칠
as.POSIXlt(Sys.Date()) - myday

#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2021-12-25")
weekdays(christmas2) 
christmas2$wday # 요일을 숫자형식으로

#2021년 1월 1일 어떤 요일
tmp<-as.POSIXct("2021-01-01")
weekdays(tmp)

#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m') # m: 두자리 숫자
day<-format(tmp,'%d') # d: 두자리 숫자
weekday<-format(tmp,'%A') # A: 축약되지 않은 요일
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다') # B:월을 풀네임, A: 요일을 풀네임으로

# 정규표현식

word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) # A 삭제
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) # ^가-힣: not~, 가-힣 만 남기기
gsub("[&^%*]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[[:punct:]]", "", word) # POSIX 방식의 빌트인  정규표현식: punct 특수문자 제거
gsub("[[:alnum:]]", "", word) # alnum: 알파벳, 숫자, 한글 제거
gsub("[[:digit:]]", "", word)  # digit: 숫자만 제거
gsub("[^[:alnum:]]", "", word) # ^alnum: 알파벳, 숫자, 한글 빼고 제거
gsub("[[:space:]]", "", word) 
gsub("[[:space:][:punct:]]", "", word)


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word); sub(" ", "@", word) # 공백을 @로 바꾸기
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) # Aa만 없애기
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word) # Aa를 {}로 묶어서 횟수 지정 
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("[Aa]", "", word) # [Aa]: or로 A나 a를 다 삭제
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word); # 숫자만 없애라
gsub("\\D", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) # 공백도 해당
gsub("[[:space:]]", "", word) 
gsub("[[:punct:][:digit:]]", "", word) # 특수문자 or 숫자 제거
gsub("[[:punct:][:digit:][:space:]]", "", word) 

#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x) # 각 문자열의 길이
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y)
nchar(y) # 각 문자열의 길이, 영문이나 한글이나 한글자당 1로 계산

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says) # 모두 소문자로
toupper(fox.says) # 모두 대문자로

# 부분 문자열 추출
substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14) # start, stop 생략가능
substring("Data Analytics", 6) # 6부터 끝까지~

classname <- c("Data Analytics", "Data Mining", 
               "Data Visualization")
substr(classname, 1, 4) # classname이 가지고 있는 모든 데이터에서 1~4 추출

countries <- c("Korea, KR", "United States, US", 
               "China, CN")
substr(countries, nchar(countries)-1, nchar(countries)) # 끝에서 두개 추출

str(islands)
head(islands) # 6개 까지만 추출
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses) # New가 있는 데이터는 다 추출

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt) # 첫번째 Data만 바뀜
gsub(pattern="Data", replacement="Business", x=txt) # 모든 Data가 Business로 바뀜

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x) # .csv 삭제, 파일 이름만 남음


gsub("[ABC]", "@", "123AunicoBC98ABC")  # [ABC]: 모든 문자들 or로, 각각의 문자마다 다 변경
gsub("ABC", "@", "123AunicoBC98ABC")    # ABC만 변경  
gsub("(AB)|C", "@", "123AunicoBC98ABC") # |: or    AB or C
gsub("A|(BC)", "@", "123AunicoBC98ABC") # A or BC
gsub("A|B|C", "@", "123AunicoBC98ABC")  # [ABC]와 동일

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T) # c 또는 h
grep("[at]", words, value=T) # a 또는 t
grep("ch|at", words, value=T) # ch 또는 at
grep("ch(e|i)ck", words, value=T) # check 또는 chick
grep("chase", words, value=T)
grep("chas?e", words, value=T) # s?: s가 없거나 한번 있거나
grep("chas*e", words, value=T) # s*: s가 0개 이상
grep("chas+e", words, value=T) # s+: s가 1개 이상 (chae는 x)
grep("ch(a*|e*)se", words, value=T) # ch_se에서 a가 0개 이상 or e가 0개 이상
grep("^c", words, value=T) # [^...]: not   # ^c...:c로 시작하는~ 
grep("t$", words, value=T) # t$: t로 끝나는~
grep("^c.*t$", words, value=T) #^c.*t$: c로 시작하고 t로 끝나고 # .*: 0개 이상 들어있는

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ") # " "을 기준으로 문자열 분리, list로 리턴
strsplit(x= fox.said, split="")   # "" 기준, 문자 하나하나 다~

fox.said.words <- unlist(strsplit(fox.said, " ")) 
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3) # 벡터들로 또 벡터 만들기
strsplit(littleprince, " ") 
strsplit(littleprince, " ")[[3]] # p3 벡터 출력
strsplit(littleprince, " ")[[3]][5] # p3의 5번째 출력( 리스트 안에 벡터)라 [[]]아님


# 데이터 전처리(1) - apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply
?lapply
apply(df, 1, sum, na.rm=TRUE) # 1: 행단위
apply(df, 2, sum, na.rm=TRUE) # 2: 열단위
lapply(df, sum, na.rm=TRUE) # df: 기본 열단위(margin정보 x), list로 리턴
sapply(df, sum, na.rm=TRUE) # 벡터로 리턴
tapply(1:6, gender, sum) # rm(sum) or base::sum # 1:6까지의 벡터로 gender를 적용해 sum을 하라
tapply(df$w, gender, mean, na.rm=TRUE) # na값은 삭제하고, gender에 대해서 w의 평균을 구하라
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5]) # 각 원소끼리 paste 해라, 갯수가 맞지 않으면 값은 반복하지만 경고 뜸!



v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep="")) # 직접 함수를 만들어서 사용, named벡터로 리턴

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep="")) # 최대한 심플하게 리턴: 일반 벡터로
lapply(l, function(d) paste("-",d,"-", sep="")) # 무조건 리스트로 리턴

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d)) # 하나의 데이터 셋(리스트)로 리턴
sapply(flower, function(d) if(nchar(d) > 5) d) # 리턴함수가 없어도 마지막에 출력한 내용 나타냄
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA)) # 벡터 안에는 na만 가능(null: 데이터 셋이 없음)
sapply(flower, function(d) paste("-",d,"-", sep="")) # named 벡터 리턴

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d)) # 매개변수 2개 이상 가능, 벡터 안에 null 불가
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3) # 모두 3이상이라 named리스트로 출력(원소값 리턴 가능해서)
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4) # n변수값보다 큰 d만 리턴

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) # TRUE이면
    r <- paste("*", x, "*")
  else   # False 이면
    r <- paste("#", x, "#")
  count <<- count + 1; # 전역변수의 값 증가
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F) # 벡터 전달
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F) # 벡터로 받아서 변수에 저장
str(rr1)

count <- 1
sapply(df, myf)   # 데이터 프레임 전달, 함수 열단위로 호출
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
