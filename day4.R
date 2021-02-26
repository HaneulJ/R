l <- list(1,2,3)
v <- c(1,2,3)

sum(v) # 벡터에는 가능
sum(l) # 리스트는 X


#read file data
nums <- scan("data/sample_num.txt") # 파일의 데이터(특히 수치)를 공백으로 구분해서 벡터로 읽어옴
nums <- scan("data/sample_utf8.txt") # 오류
# encoding=코드셋명 이 없으면 os(운영체제)의 고유 코드셋 정보를 반영해서 읽음
word_ansi <- scan("data/sample_ansi.txt",what="") #what 매개변수: 문자형으로 전환
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")
lines_ansi <- readLines("data/sample_ansi.txt")
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

df2 <- read.table("data/product_click.log", stringsAsFactors = T) #read.csv()와 거의 동일, 공백이나 _로 구분되어 있으면 테이블로 호출 
str(df2) #자동으로 V1, V2로 행의 이름 부여
head(df2)
summary(df2$V2) # 첫 번째  행부터 데이터로 인식, head=TRUE를 하면 컬럼명 인식




# 함수 정의와 활용

func1 <- function() { # 함수 헤더
  xx <- 10   # 지역변수
  yy <- 20
  return(xx*yy)
}
func1()
#yy
result <- func1()
result
xx  # 오류발생
func1(10) # 매개변수가 지정되어 있지 않은 함수라 오류 발생


func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2() # 매개변수가 있기 때문에 아규먼트 없이 호출하면 오류 발생
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴 

func3 <- function(x,y) {
  #x3 <- x+1 변수에 담아서 호출해도 되고,
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식 ,, 식에 담아서 호출해도 가능
  return(x4)
}

func3 <- function(x,y) {
  x3 <- x+1 
  y3 <- y+1
  x4 <- func2(x3, y3)  
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) { # z에 값 전달 필수, x랑 y는 선택(기본값 있음)
  return(x+y+z)
}
func4() # z값이 누락되서 오류 
func4(10,20,30)
func4(10,20) # positional arguments라 z에 값이 없음
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33) # 매개변수 순서 다르게 해도 됌(keyword arguments형식)
func4(z=1000)  

# 쉬트에 있는 함수 코드
f1 <- function() print("TEST")
f1()
r <- f1()
r
f2 <- function(num) {print("TEST"); print(num) }
f2(100)
f2()
f3<- function (p="R") print(p)
f3()
f3(p="PYTHON")
f3("java")
f4<- function (p1="hello",p2) for(i in 1:p2) print(p1)
f4(p1="abc", p2=3)
f4("abc", 3) 
f4(5) 
f4(p2=5) 
f5<- function(...) { print("TEST"); data <- c(...); print(length(data))}
f5(10, 20, 30)
f5("abc", T, 10, 20)
f6<- function(...) {
  print("수행시작")
  data <- c(...)
  for(item in data) {
    print(item)
  }
  return(length(data))
}
f6()
f6(10)
f6(10,20)
f6(10,20,30)
f6(10,'abc', T, F)

f7<- function(...) { #가변인자:(...)
  data <- c(...) # 벡터 데이터들의 타입은 동일해야 함
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}
f7(10,20,30)
f7(10,20,'test', 30,40) # 타입이 달라 오류

f8<- function(...) {
  data <- list(...) # 리스트는 타입이 달라도 가능
  sum <- 0;
  for(item in data) {
    if(is.numeric(item))
      sum <- sum + item
    else
      print(item)
  }
  return(sum)
}

f8(10,20,30)
f8(10,20,"test", 30,40)
