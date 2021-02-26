# 문제1
# 함수 countEvenOdd() 을 생성한다.
# 매개변수 : 1 개, 리턴값 : 리스트
# 기능 : 숫자벡터를 아규먼트로 받아 짝수의 갯수와 홀수의 갯수를 카운팅하여 
# 리스트(각 변수명 : even, odd)로 리턴한다.
# 전달된 데이터가 숫자 백터가 아니면 NULL 을 리턴한다.

countEvenOdd <- function(n){
  evencount <- 0
  oddcount <- 0
  if(is.numeric(n)){
    if(n %% 2 ==0){
      evencount <- +1
    }else  oddcount <- +1
   return(list(even=evencount, odd=oddcount))
  }else return()
}

countEvenOdd(1)
countEvenOdd(6)
countEvenOdd("ㅎ")


# 문제2
# vmSum() 을 생성한다.
# 매개변수 : 1 개, 리턴 값 : 숫자벡터	
# 기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.
# 벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 리턴한다.
# 벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 메시지를 출력하고 0 을 리턴한다.
# 전달된 숫자 벡터의 모든 값을 더하여 리턴한다.
vmSum <- function(v){
  sum <- 0
  if (is.vector(v) & !is.list(v)){
    if(is.numeric(v)){
      return(sum(1:v))
    }else{
      print("숫자 벡터를 전달해!")
      return(0)
      }
  }else return("벡터만 전달해!")
}

vmSum(5)
vmSum(5,8)
vmSum("^^")



# 문제3
# vmSum2() 을 생성한다.
# 매개변수 : 1 개, 리턴 값 : 숫자벡터
# 기능 : 전달받은 아규먼트가 벡터인 경우에만 기능을 수행한다.
# 벡터가 아니면 “벡터만 전달하숑!”라는 메시지를 가지고 error 를 발생시킨다.
# 벡터라 하더라도 숫자 벡터가 아니면 “숫자 벡터를 전달하숑!” 라는 메시지를 가지고 warning 을 발생시키고 0 을 리턴한다.
# 전달된 숫자 벡터의 모든 값을 더하여 리턴한다.

vmSum2 <- function(p){
  sum <- 0
  if (is.vector(p) & !is.list(p)){
    if(is.numeric(p)){
      return(sum(1:p))
    }else{
      warning("숫자 벡터를 전달해!")
      return(0)
    }
  }else stop("벡터만 전달해!")
}

vmSum2(6)
vmSum2("%")


# 문제4
# 함수 mySum()을 생성한다.
# 아규먼트 : 벡터 한 개, 리턴값 : 리스트 한 개 또는 NULL
# 전달된 벡터에서 짝수번째 데이터들의 합과 홀수 번째 데이터들의 합을 구하여 list 객체로 리턴하는데 각각 oddSum과 evenSum 이라고 변수명을 설정한다.
# 벡터가 온 경우에만 기능을 수행하며 벡터가 오지 않은 경우에는 "벡터만 처리 가능!!"이라는 메시지로 에러를 발생시킨다.
# 전달된 벡터에 NA 값이 하나라도 존재하는 경우에는 "NA를 최저값으로 변경하여 처리함!!" 이라는 메시지를 경고를 발생시킨다. 
# 그리고 NA 는 최저값으로 설정하여 기능을 수행한 후에 결과를 리턴한다.
# NULL이 온 경우에는 NULL을 리턴한다.

mySum <- function(...){
  x <- c(...)
  if(any(is.null(x))) stop("NULL")
  else if (is.vector(x) & !is.list(x)){
    if(any(is.na(x))){
      warning("NA를 최저값으로 변경하여 처리함!")
      x[is.na(x)] <- x[min(x)]
      return(list(oddSum = sum(x[seq(1,length(x),2)]), evenSum = sum(x[seq(0,length(x),2)])))
      } else if(all(is.numeric(x)))
    return(list(oddSum = sum(x[seq(1,length(x),2)]), evenSum = sum(x[seq(0,length(x),2)])))
  }else stop("벡터만 처리 가능!")
}

mySum(4,7,6,9,10)
mySum(7)
mySum(NA,5,6)
mySum()





# 문제5
# 함수 myExpr()을 생성한다.
# 아규먼트 : 함수 한 개, 리턴값 : 한 개의 숫자값
# 아규먼트로 함수를 전달받는다. 
# 아규먼트가 함수가 아니면 "수행 안할꺼임!!" 이라는 메시지로 에러를 발생시킨다.
# 1부터 45 사이의 난수 6개를 추출하여 아규먼트로 전달된 함수를 호출하고 그 결과를 리턴한다.

myExpr <- function(q){
  if(is.function(q)){
    q <- sample(1:45,6)
    return(q)
  }else stop("수행 안해")
}

myExpr(45)
myExpr(b())


# 문제6
# createVector1() 을 생성한다.
# 아규먼트 : 가변(숫자, 문자열, 논리형(데이터 타입의 제한이 없다.)), 리턴 값 : 벡터
# 전달된 아규먼트가 없으면 NULL을 리턴한다.
# 전달된 아규먼트에 하나라도 NA 가 있으면 NA를 리턴한다.
# 전달된 데이터들을 가지고 벡터를 생성하여 리턴한다.

createVector1 <- function(...){
  d <- list(...)
  if(is.null(d)) return()
  else if(any(is.na(d))) return(NA)
  else{return(c(d))}
}

createVector1(15,3,6,6)
createVector1(15,3,6,NA)
createVector1()


# 문제7
# 함수 createVector2() 을 생성한다.
# 매개변수 : 가변(숫자, 문자열, 논리형(데이터 타입의 제한이 없다.)), 리턴 값 : 리스트객체
# 기능 : 전달된 아규먼트가 없으면 NULL을 리턴한다.
# 전달된 데이터들을 각 타입에 알맞게 각각의 벡터들을 만들고 리스트에 담아서 리턴한다.


createVector2 <- function(...){
  f <- list(...)
  result <- NULL
  if(is.null(f)) return()
  else if(is.vector(x)  & !is.list(x)) result[1]
  else if(is.data.frame(x)) result[2]
  else if(is.matrix(x)) result[3]
  else if(is.array(x)) result[4]
  else if(is.function(x)) result[5]
  return(result)
}