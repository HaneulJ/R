v1 <- 1:10
v2 <- 10:1
print(v1)
v2

v1 <- c(4, 1, 8, 6, 10) # c()함수: 아규먼트를 원하는 만큼 전달 가능
v2 <- c(100, 200, TRUE, FALSE); print(v2)
v3 <- c('100', 200, T, F); print(v3)
v1[5];v1[3];v1[1];v1[0]
length(v3)


rep(1, 100) # 1이 100개인 벡터
rep(1:3, 5) # 1,2,3 이 5개!! times가 기본
rep(1:3, times=5) # 키워드 파라미터, times=횟수
rep(1:3, each=5) # each: 각각 5번
?rep  #help()

LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
LETTERS[3:5]; LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)] # 음의 값 인덱스: 제외!!

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x) # 벡터 값의 타입
rev(x)  # 벡터 값을 역순으로 추출
range(x) # 제일 작은 값 & 제일 큰 값 추출 
sort(x)
sort(x, decreasing = TRUE) # decreasing: 기본값이 false라 TRUE시 내림차순
sort(x, decreasing = T)
#x <- sort(x)
order(x) # 데이터 값 오름차순, 그 값에 해당하는 인덱스 추출



x[3] <- 20
x
x + 1 # 각각의 원소값에 1를 더한다
x <- x + 1 # 
max(x);min(x);mean(x);sum(x)
summary(x)

x[c(2,4)] # x[2], x[4] 인덱스에 해당되는 값을 추출
x[c(F,T,F,T,F)] # 논리형 인덱스도 가능, T만 추출 
# x[c(T,F)]: x[c(T, F, T, F, T)] 원소 개수만큼 반복(확장)
x > 5 # 비교해서 논리형으로 추출
x[x > 5] # 인덱스에 비교식을 넣으면 해당하는 값이 추출
x[x > 5 & x < 15] # 논리 &연산자
# x[x > 5 && x < 15] 하나의 원소로만 연산 가능
# x[x > 5 | x < 15] 합집합~

names(x) # 인덱스 대신 names 부여, 텍스트마이닝 할 때 많이 이용
names(x) <- LETTERS[1:5]
names(x) <- NULL # names 지우기
x[2];x["B"]; #x[B()]


# &, &&
c(T, T, F, F) & c(T, F, T, F) # 둘다 참
c(T, T, F, F) | c(T, F, T, F) # 둘 중 하나만 참이어도 가능
c(T, T, F, F) && c(T, F, T, F) # 첫 번째 데이터로만 비교(벡터연산X)
c(T, T, F, F) || c(T, F, T, F) # 


ls() # 어떤 함수 있는지 나열
rm(x) # 함수 삭제
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100 #100보다 크면 true
rainfall[rainfall > 100] #비교식을 인덱스로 하여 해당하는 데이터만 출력, 몇 월 데이터인지 모름
which(rainfall > 100) #which 함수에 아규먼트로, 해당 데이터의 인덱스값만 꺼내고 싶을때 사용
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)] #축약된 형태의 월 이름으로 추출
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)]
which.max(rainfall) # 아규먼트로 주어진 벡터에서 최대값의 인덱스 추출
which.min(rainfall) # 최소값의 인덱스 추출
month.korname[which.max(rainfall)] 
month.korname[which.min(rainfall)]


sample(1:20, 3) # sample(추출할 벡터, 추출할 개수), 중복X(replace=F)
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T) # replace=T 중복 허용

paste("I'm","Duli","!!") # 여러 문자열을 하나의 문자열로 결합 (blank 기본)
paste("I'm","Duli","!!", sep="") 
paste0("I'm","Duli","!!") # 중간 blank 제외하고 싶을 때

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-") # collapse: 결합된 문자열들을 또 하나의 문자열로 결합
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")