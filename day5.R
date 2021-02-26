test1 <- function() {
  print("test1호출")
}
test1()

r1 <- test1() # 마지막으로 출력된 print함수가 입력 됌(변수에 담아야) invisable 방식?
r1

test2 <- function() {
  print("test2호출")
  return()
}
test2() # print와 함께 null이 리턴

r2 <- test2() 
r2 # return 값


paste0(c("R"), 1:10) # 두 벡터가 가지고 있는 원소값들을 1:1 매칭
paste0(c("A", "B"), 1:10) #

makeVector <- function(type, ...) { # 가변형(맨 마지막에)과 일반 매개변수도 같이 쓸 수 있음
  return(switch(EXPR=type, paste0("A", c(...)),  
                paste0("B", c(...)), 
                paste0("C", c(...)), 
                paste0("D", c(...))))
}

makeVector(type=1,1,2,3,4,5)
makeVector(2,100,200,300) # 2=type
makeVector(3,10,20,30,40,50,60,70,80,90) # 3=type
makeVector(4,111,222,333,444,555) # 4=type

v <- c(10,11,20,22,30,33)
evenodd1 <- function(p) if(p %% 2 == 0) return("even") else return("odd")
sapply(v, evenodd1) # 벡터v가 가지고 있는 원소값들을 한번씩 전달하면서 함수 호출, 리턴값: 단순 객체
lapply(v, evenodd1) # 리턴값 무조건 list

evenodd2 <- function(p) {
  if(p %% 2 == 0) 
    r <- "even" 
  else 
    r <- "odd"
  return(r)
}
sapply(v, evenodd2)
lapply(v, evenodd2)

ls() # 나타나는 객체들은 전역적으로 만들어서 계속 쓸 수 있음

# R에도 전역 변수와 지역 변수가 있음

a<-3;b<-7;c<-11  # 전역변수
ft<-function(a){
  b<-a+10    # 지역변수
  c<<-a+10   # 전역변수에 대입(<<-)
  d<-a
  print(a);print(b);print(c);print(d)
  return()  # NULL
}
print(ft(100))
print(a);print(b);print(c);print(d) # 전역변수에 d가 없어 오류 발생

#return() 함수와 invisible() 함수 

ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10) # return값 출력x

ft.1(100)
ft.2(100)
ft.3(100) # return값이 없는 식처럼 값 출력 X

r1 <- ft.1(1000);r1
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3

# sleep() 함수

testSleep <- function(second) {
  for(data in LETTERS[1:5]) {
    cat(data)
    Sys.sleep(second) # 초시간 지정해서 그 시간만큼 지나고 출력
  }
}

testSleep(1)
testSleep(0)
testSleep(3)

#Sys.sleep(초시간) 함수
testSleep1 <- function(x) {
  for(data in 6:10) {       
    cat(data,"\n")
    if(x)
      Sys.sleep(1) # 전달된 값이 TRUE이면 1초씩, FALSE이면 Sys 수행X
  }
  return()
}
testSleep1(FALSE)
testSleep1(TRUE)


# 매개변수에 전달된 데이터의 타입 채크 # 다 if 문(else if 아님)
# 벡터만 가지고 싶다면 vector와 list 다 확인해야 함
testParamType <- function(x){ # 매개변수 하나 지정
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.
testParamType(100)
testParamType(LETTERS) # 내장 벡터
testParamType(data.frame()) # 모든 원소들이 벡터로 들어가있는 데이터셋?(리스트성격, 리스트에 포함)
testParamType(matrix()) # 매트릭스도 배열에 포함
testParamType(list()) # 리스트는 데이터 타입에 제한이 없기 때문
testParamType(array()) 
testParamType(mean)

#testParamType1 # if-else if문, result에 값을 대입해서 return
testParamType1 <- function(x){
  result <- NULL # 지역변수 지정 안하면 return 오류
  if(is.vector(x)  && !is.list(x)) result <-"벡터를 전달했군요!" # 비교대상이 하나라 && 가능, 여러개일 때는 반드시 & 하나!!
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!"
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.....

testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){})


#testParamType2
testParamType2 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x) && is.numeric(x)) {
    result <- sum(x)
  } else {
    stop("숫자 백터만을 원하오!!") # stop 함수수행 중단 & 에러메세지
  }
  return(result)
}

testParamType2(1:3)
testParamType2(list(1,2,3))
testParamType2(LETTERS)

is.


#stop() 함수도 알고 가자
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 혀!! 더 이상 수행 안할거임") # 에러 메세지, 함수 수행 중단
  return(rep("테스트",x)) # x번만큼 "테스트" 출력, rep은 개행X
}

testError1(5)
testError1(0)



#warning() 함수
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 해!! 더 이상 수행 안할거임") # 함수 수행 중단
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리!!") # 함수 수행 중단X
  }
  return(rep("테스트",x))
}

testWarn(3)
testWarn(10)

test1 <-function(p){
  cat("난 수행함\n")
  testError1(-1) # testError1에서 오류가 발생하여 
  cat("나 수행할 까요? \n") # 호출한 함수(test1)도 수행이 중단됌
}
test1() # 함수 안에서 p변수를 사용하지 않았기 때문에 아규먼트 없이 함수 수행 가능

#try() 함수를 알아야 데이터 수집을 편하게 할 수 있다.
test2 <- function(p){
  cat("난 수행함\n")
  try(testError1(-1)) #testError1에서 오류가 나더래도 test2는 중단하지 않을 것!(오류 무시해~)
  cat("나 수행할까요? \n")
}
test2()

testAll <-function(p){
  tryCatch({  # try 블럭을 수행하다가 오류가 나도 무시하고 다음으로 넘어가,(tryCatch ~ finally)
    if(p=="오류테스트"){
      testError1(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError1(2))
      print(testWarn(3))
    }
  },warning = function(w){ # ,warning 함수 대입(선택적으로 지정)
    print(w)
    cat("-.-;;\n")
  },error = function(e){ # ,error 함수 대입(선택적으로 지정)
    print(e)
    cat("^^ \n")
  },finally ={ # finally 블럭 부여(선택적으로 지정)
    cat("오류, 경고 발생 여부에 관계없이 반드시 수행되는 부분입니다.\n")
  })
}

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")


f.case1 <- function(x) {
  if(is.na(x)) 
    return("NA가 있음")
  else
    return("NA가 없음")
}
f.case1(100)
f.case1(NA)
# is.na: 첫번째 원소만으로 판별(여러 개 X) 
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA, 20))
f.case1(c(10, NA, 20))

f.case2 <- function(x) {
  if(any(is.na(x))) # any: is.na의 결과가 하나라도 참이면~
    return("NA가 있음")
  else
    return("NA가 없음")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA, 20))
f.case2(c(10, NA, 20))

f.case3 <- function(x) {
  if(all(is.na(x))) # all: is.na의 결과가 모두 다 참이면~
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}
f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))


# 가변형 인자 테스트
funcArgs1 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  for(opt in p) { # 다중 if문 대신 switch
    switch(EXPR=opt, # opt: function호출할 때 아규먼트가 R 함수의 option에 있는~
           SUM=, Sum=, sum= print(sum(data)),
           MEAN=, Mean=, mean= print(mean(data)),
           DIFF=, Diff=, diff= print(max(data) - min(data)),
           MAX=, Max=, max= print(max(data)),
           MIN=, Min=, min= print(min(data)),
           SORT=, Sort=, sort= print(sort(data))
    )
  }
}

funcArgs1() # invisable 효과
funcArgs1("SUM", "mean", "Min")
funcArgs1("SORT", "Sort", "sort")





# 가변형 인자 테스트
funcArgs2 <- function(...) {
  p <- c(...)
  data <- c(10,15,3,5,17,25)
  if(is.null(p)) # 전달된 값이 하나도 없을 때(null, na는 등가로 체크X, is.na나 is.null)
    print(data)
  else 
    for(opt in p) {
      switch(EXPR=opt,
             SUM=, Sum=, sum= print(sum(data)),
             MEAN=, Mean=, mean= print(mean(data)),
             DIFF=, Diff=, diff= print(max(data) - min(data)),
             MAX=, Max=, max= print(max(data)),
             MIN=, Min=, min= print(min(data)),
             SORT=, Sort=, sort= print(sort(data))
      )
    }
}

funcArgs2()
funcArgs2("SUM", "mean", "Min")
funcArgs2("SORT", "Sort", "sort")


# 사분위수란 측정한 양적 데이터 값을 4등분 했을 때 각 등위에 해당하는 것을 말하며 
# 1/4분위수(25% quantile), 2/4분위수(50% quantile), 
# 3/4분위수(75% quantile), 4/4분위수(100% quantile) 4가지로 나뉜다.
# R에서는 quantile() 함수를 사용한다. 
# 홀수 갯수의 숫자들에 대한 사분위수 계산은 간단하다.
# 전체에서 중간값 : 2/4 분위수
# 2/4 분위수를 기준(포함)으로 양쪽에서 중간값을 구하면 1/4, 3/4 분위수 값이 된다.
o1 <- c(1,2,3,4,5) # 1 2 3 4 5
quantile(o1)

o2 <- c(1,2,3,4,5,6,7) # 1.0 2.5 4.0 5.5 7.0 자동으로 실수형으로 변경
quantile(o2)

o3 <- c(1,2,3,4,5,6,7,8,9) # 1 3 5 7 9
quantile(o3)

o4 <- c(1,2,3,4,5,6,7,8,9,10,11) # 1.0 3.5 6.0 8.5 11.0
quantile(o4)

o5 <- c(2,4,6,8,10) # 2 4 6 8 10
quantile(o5)

o6 <- c(2,10,16,28,30) # 2 10 16 28 30
quantile(o6)

o7 <- c(2,10,15,28,30,40,45) # 2.0 12.5 28.0 35.0 45.0 
quantile(o7)

o8 <- c(10,12,18,20,25,26,30,32,33,40,50) # 10.0 19.0 26.0 32.5 50.0 
quantile(o8)
summary(o8)

# 짝수 갯수의 숫자들에 대한 사분위수 계산은 다음과 같다.
# 2/4 분위수(중간값) : 중앙의 2개 값의 평균
# 1/4 분위수 : 중간값의 왼쪽 데이터들
#              홀수 갯수 : 중간값 + (중간값의 다음값 - 중간값) * 0.25 
#              짝수 갯수 : 중간값 + (큰값 - 작은값) * 0.25
# 3/4 분위수 : 중간값의 왼쪽 데이터들
#              홀수 갯수 : 중간값 - (중간값 - 중간값 이전값) * 0.25  
#              짝수 갯수 : 중간값 - (큰값 - 작은값) * 0.25


e1 <- c(1,2,3,4) # 1.0 1.75 2.5 3.25 4.0
quantile(e1)

e2 <- c(1,2,3,4,5,6) # 1.0 2.25  3.5 4.75 6.0
quantile(e2)

e3 <- c(1,2,3,4,5,6,7,8) # 1.0 2.25 4.5 6.25 8.0
quantile(e3)

e4 <- c(1,2,3,4,5,6,7,8,9,10) # 1.0 3.25 5.5 7.75 10.0
quantile(e4)

e5 <- c(2,4,6,8,10,12) # 2 4.5 7 9.5 12
quantile(e5)

e6 <- c(2,5,10,15,18,20) # 2.00 6.25 12.50 17.25 20.00
quantile(e6)

e7 <- c(2,3,10,15,50,100) # 2.00 4.75 12.50 41.25 100.00
quantile(e7)

e8 <- c(1,2,10,14,15,16,27,38)  # 1.00 8.00 14.50 18.75 38.00
quantile(e8)


ls()
length(ls())
# 지금까지 만든 모든 객체들 저장:ls()
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam, rda: 압축파일 느낌
rm(list=ls())
ls()
load("all.rda") # 읽어오기
ls()


str(emp)
str(df2)
save(list=c('emp','df2'), file="two.rda") # 확장자 .rda  / .RData 권유, 특정 객체만 저장
rem(emp,df2)
load("two.rda")