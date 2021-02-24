# 다양한 연산자 사용 가능
num <- 1:10
num
num = 10:1
num
100:200 -> num # R의 추가 api를 사용할 때 
num


num1 <- 11 # c(11)
num2 <- 3  # c(3)
num1 / num2    # 나눗셈
num1 %% num2   # 나머지
num1 %/% num2  # 몫 만


#LIST
v<-c(1,2,3)
l<-list(1,2,3) #1,2,3을 각각의 벡터로 만듬
v *10
l *10 # 리스트는 벡터연산 불가
v
l     #리스트 데이터 값=특정 타입의 데이터 셋
v[1]  # 원소값만 추출
l[1]  # 리스트 상태 유지해서 추출
l[[1]] # 특정 위치 데이터만 추출

lds <- list(1,2,3) 
lds
lds+100
unlist(lds) # 리스트 해제하고 벡터로 리턴
unlist(lds)+100
lds[1]
lds[1]+10
lds[[1]]+10 # 리스트 값을 벡터 연산할 때 [[]]로 추출해서~

names(lds) <- LETTERS[1:3] # 각 원소마다 인덱스를 names으로 부여
lds
lds[[2]] # 두 번째 원소
lds[["B"]]
lds$B


a <- list( # named list 표현
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5) # list 중첩
)

a[1] # 연산X
a[[1]] # a[["a"]] 벡터 상태로 꺼내기
a$a
a[[1]][1] # 1행의 1열 데이터만 꺼내기
a$a[1] # a라는 리스트에 첫번째 벡터 꺼내기
a[1]+1 # 리스트 구조 유지, 연산X
a[[1]]+1 
a[[1]][2] <- 100 # a의 1행 2열의 데이터를 100으로 변환
new_a <- unlist(a[1]) # 리스트 상태 해제, 벡터로 변환
a[1]; new_a 
names(a) <- NULL
names(new_a) <- NULL


# 콘솔 화면에 데이터를 출력하는 함수: print() 데이터 셋/데이터, cat() 메세지
print(100)
print(pi)
data <- "가나다"
print(data)
print(data, quote=FALSE) # quote=FALSE: 인용부호 생략하고 출력
v1 <- c("사과", "바나나", "포도")
print(v1)
print(v1, print.gap=10) # print.gap=10: 데이터 값 사이 띄어쓰기 지정(10개의 문자만큼)
cat(100) #자동 개행처리 X
cat(100,200) # 데이터 사이에 자동 blank
cat(100,200,"\n") # 행바꿈을 원하면 "\n"
cat("aaa", "bbb", "ccc", "ddd", "\n") #cat은 자동으로 인용부호 생략하고 출력
cat(v1, "\n")
cat(v1, sep="-", "\n")

print(paste("R", "은 통계분석", "전용 언어입니다."))
cat("R", "은 통계분석", "전용 언어입니다.", "\n") # 하나의 문자열로(간단한 메세지로 전달) 쓸 때 cat이 더나음

ls()
length(ls())
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam
rm(list=ls())
ls()
load("all.rda")
ls()

#read file data
nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt",what="")
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("data/product_click.log", stringsAsFactors = T)
str(df2)
head(df2)
summary(df2$V2)



# 제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2 == 1){
  cat(randomNum,";홀수\n") #개행문자를 다른 아규먼트로/ 같이 아규먼트로 줄 때 같은 결과
}else{
  cat(randomNum,";짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수","\n")
  cat("종료")
}else{
  cat(randomNum,";짝수","\n")
  cat("종료")
  
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수")
  cat("종료")
}else{
  cat(randomNum,";짝수")
  cat("종료")
}


score <- sample(0:100, 1)  # 0~100 숫자 한 개를 무작위로 뽑아서
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name) # month.name의 원소값 12개 만큼 반복
  print(data) # 행단위로 12번 출력
for(data in month.name)print(data);print("hello") # hello는 for문 다음에 한번만 수행 
for(data in month.name){print(data);print("hello")} # {}블럭으로 구성했기 때문에 hello까지 for문에 포함

for(n in 1:5)
  cat("hello?","\n") # cat함수에 n 함수를 사용하지 않아도 n번만큼 반복처리

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n") # 25번 수행
  }
}
# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t") # \n : 개행문자, \t : 탭문자
  }
  cat("\n")
}


bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break # 가장 가까운 반복문 하나만 break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) # bb가 TRUE이면 (한번에 여러개 break 하고싶으면 변수를 만들어서)
    break  # 밖의 반복문도 break
}


for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      break 
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
}



#while문
i<-1
while(i <= 10){ # 10까지 반복
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")


i<-1
while (i<=10) { # 무한루프(i값을 변화시켜주는 식이 없기 때문)
  cat(i,"\n")
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1 # i값을 얼마만큼 변화시키느냐에 다라 반복 횟수 다름 
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
month <- paste(month,"월",sep="") # "3월"  "3 월" # char형으로 바뀜
result <- switch(EXPR=month, #char형이라 등가비교~
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7월"=,"8월"="여름",
                 "가을")
cat(month,"은 ",result,"입니다\n",sep="")

num <- sample(1:10,1)
num 
switch(EXPR = num,"A","B","C","D") # 1:A 2:B 3:C 4:D일 때만 결과출력, 5~10:x

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}

for(num in 1:10){
  num <- as.character(num) 
  cat(num,":",switch(EXPR = num, #비교값을 바꾸고 싶을 때는 char으로 변환 
                     "7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n")
}

for(data in month.name) # 개행
  print(data)

for(data in month.name) 
  cat(data)

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  print(paste(i,":",sum)) #인덱스와 같이 출력(기본)
}

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  cat(i,":",sum,"\n") # 내용만 출력(메세지 형식)
}

sum <-0
for(i in 5:15){
  if(i%%10==0){
    next;  # continue
  }        # 10만 빼고 처리
  sum <- sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0  # ~까지 반복해야할 때는 
while(sumNumber <= 20) {
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")


repeat {
  cat("ㅋㅋㅋ\n")
}

sumNumber <- 0
repeat { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break;
}