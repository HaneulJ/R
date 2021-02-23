# matrix 실습
x1 <-matrix(1:8, nrow = 2) # ncol 매개변수 생략: 데이터 개수에 맞게 자동으로 형성 
x1  # 열단위로 먼저 채워지는게 디폴트
x1<-x1*3 # 모든 원소마다 *3
x1

sum(x1); min(x1);max(x1);mean(x1) # 매트릭스의 모든 값

x2 <-matrix(1:8, nrow =3) # 데이터가 행열개수에 비해 모자라서 다시 반복
x2

chars <- letters[1:10] # 데이터셋을 객체로 취급, chars에 저장만
(chars <- letters[1:10]) # 변수에 담아서 chars 출력까지 가능

mat1 <-matrix(chars) # chars라는 벡터를 줌(행열 개수X)
mat1; # 첫번째 열에 다 넣어짐(기본값)
dim(mat1) # 10행 1열
matrix(chars, nrow=1) # 변수에 담아서 저장, 출력 가능
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T) # 행우선으로 채우고 싶어! byrow=T
matrix(chars, ncol=5) 
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)

m <- matrix(chars, nrow=3)
m[1,1]
m[3,4]
m[3,4] <- "w" # 해당 인덱스에 값 입력/변경 가능
colnames(m)
rownames(m)


vec1 <- c(1,2,3) # 
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 # vec별로 행에 저장, 자동으로 행 이름 지정
mat2 <- cbind(vec1,vec2,vec3); mat2 # vec별로 열에 저장, 자동으로 열 이름 지정
mat1[1,1]
mat1[2,]; # 열 지정x, 두번째 행이 모두 출력
mat1[,3] # 기본: 1차원으로 정리해서 줌
mat1[1,1,drop=F] # drop=F : 매트릭스 구조를 유지한 채 출력
mat1[2,,drop=F];mat1[,3,drop=F]

rownames(mat1) <- NULL
colnames(mat2) <- NULL
mat1;mat2
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2) # 열 단위로 summary(기본값)

mean(x2[2,]) # 2행의 평균
sum(x2[2,])
rowSums(x2); # 행단위 합
colSums(x2) # 열단위 합

# apply(X, 1 or 2, 함수)
apply(x2, 1, sum); # 1: 행단위로 합계를 구하라 =rowSums
apply(x2, 2, sum) # 2: 열단위로 합계를 구하라 =colSums
?apply
apply(x2, 1, max) # 행 단위로 최대값 (rowMax 없음!!)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

#Array 실습
a1 <- array(1:30, dim=c(2,3,5)) # array 만들 때 dim 필수!!!, dim(행, 열, 층) 3차원
a1 # 열 우선 

a1[1,3,4]
a1[,,3] # 3층의 모든 행열
a1[,2,] # 2열의 모든 데이터를 2행 5열로 출력
a1[1,,] # 1행의 모든 데이터를 3행 5열로 출력
a1[,2,]
a1 * 100 # 각 원소에 연산(broadcasting)

# factor 실습

score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
class(score)
summary(score) 

f_score <- factor(score) # 양적 데이터를 질적 데이터로 변환
class(f_score) # 데이터타입: 팩터
f_score # 레벨정보 같이 출력
summary(f_score) # 레벨 별로 몇 개인지 
levels(f_score)

plot(score)
plot(f_score)


data1 <- c("월","수","토","월","수","화","수","수",
           "목","화")
data1
class(data1)
summary(data1)

day1 <- factor(data1)
day1
class(day1)
summary(day1)
levels(day1)

week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
day2 <- factor(data1, 
               levels=week.korabbname)
day2
summary(day2)
levels(day2)



btype <- factor(
  c("A", "O", "AB", "B", "O", "A"),  
  levels=c("A", "B", "O"))  # 레벨 직접 지정, AB는 정해진 레벨x 
btype # AB는 na로 간주
summary(btype)
levels(btype)

gender <- factor(c(1,2,1,1,1,2,1,2), 
                 levels=c(1,2), 
                 labels=c("남성", "여성")) #레벨의 이름=라벨, 순서대로 매핑
gender
summary(gender)
levels(gender)


# 내장 데이터셋
data()
iris; head(iris);tail(iris) 
View(iris) #데이터 셋의 내용을 테이블 구조로 보여줌, col=변수(각 관측치가 가지고 있는 특성값=variables)
str(iris) # 데이터 셋의 구조를 볼 수 있음

library()

#Dataframe 실습
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
str(fruit)
View(fruit)

# 인덱싱 방법
fruit[1,]
fruit[-1,] # 1행만 빼고 출력
fruit[,2]
fruit[,3] # fruit[,3, drop=F] #데이터 구조 유지
fruit[, c(3,4)] # 원하는 열의 
fruit[3,2]
fruit[3,1]

fruit[,3]
fruit$qty # 주로 쓰는 방법임
fruit[[3]]
fruit[3]  # 기본: 데이터프레임 형식 유지

str(fruit$qty) # 타입, 데이터 값, 인덱싱 개수 알려줌
str(fruit[3]) # 데이터프레임 형식

# dataframe exam1
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum)
df_midterm
str(df_midterm)
colnames(df_midterm) # 열 이름 추출
rownames(df_midterm) # 행 이름 추출(자동으로 1~ 숫자값으로 행번호 부여)
names(df_midterm) # names는 자동으로 열 이름 추출(데이터프레임은 열 단위!!)
mean(df_midterm$english)
mean(df_midterm$math)

df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))
colnames(df_midterm2)
rownames(df_midterm2)
names(df_midterm2)
df_midterm2
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
df_midterm2
df_midterm2$영어

df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6)) # 오류
df <- data.frame(var1=c(4,3,8), 
                 var2=c(2,6,1))
str(df)
df$var_sum <- df$var1 + df$var2
df$var_mean <- df$var_sum/2
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다") # if else(조건, 조건이 참일 때 명령문1, 조건이 거짓일 때 명령문2)

getwd() # get working directory 현재 작업하고 있는 디렉토리 수행
# setwd('xxx')  새로운 working directory 지정

#csv파일열기
score <- read.csv("data/score.csv") # csv파일 읽기(현재 워킹 디렉토리 기준) 상대 path
score <- read.csv("c:/JHN/Rexam/data/score.csv") # 절대 path
score
str(score)
score$sum <- 
  score$math+score$english+score$science
score$result <- ifelse(score$sum >= 200, 
                       "pass", "fail")
score

summary(score$result) # 아규먼트에 주어진 데이터의 타입에 따라 결과가 달라짐
table(score$result) # 무조건 개수 세서 출력
summary(factor(score$result))
score$result = factor(score$result) # 팩터 형식으로 변환하여 출력
str(score)
summary(score) 
score$id = as.character(score$id)
score$class = factor(score$class)

score$grade<-ifelse(score$sum >= 230,"A",
                    ifelse(score$sum >= 215,"B", 
                           ifelse(score$sum >=200,"C","D")))
# ifelse 중첩(1이면 a, 아니면 b , 그것도 아니면 c, d)
score

# order() 와 sort()
v <- c(10,3,7,4,8)
sort(v) # 크기 순대로 재배열
order(v) # 데이터 크기순대로 인덱스를 출력

emp <- read.csv(file.choose()) # file.choose():유저가 파일 다이얼 로그에서 선택할 수 있게 창 열기 
emp
str(emp)

summary(emp)

emp$job <- as.factor(emp$job)
emp$deptno <- as.factor(emp$deptno)
emp$mgr <- as.factor(emp$mgr)

summary(emp)

# emp에서 직원 이름 출력 방법
emp$ename
emp[,2]
emp[,"ename"] 
emp[,2, drop=FALSE] 
emp[,"ename",drop=F] 
emp[2]
emp["ename"] 

# emp에서 직원이름, 직무, 급여
emp[,c(2,3,6)]
emp[,c("ename","job","sal")]
subset(emp,select = c(ename, job, sal))
?subset

# emp에서 1,2,3 행 들만
emp[1:3,]
emp[c(1,2,3),]
?head
head(emp) # 기본(n=6) 6행 추출
head(emp, n=1)

# ename이 "KING"인 직원의 모든 정보
emp[9,] # 몇 번째 행에 있는지 알 때
emp$ename=="KING"
emp[c(F,F,F,F,F,F,F,F,T,F,F,F,
      F,F,F,F,F,F,F,F),]
emp[emp$ename=="KING",] # 조건에 맞는 열을 꺼낼 때
subset(emp,subset=emp$ename=="KING")
subset(emp,emp$ename=="KING") 

is.na(emp$ename) # na(결측치, 비어있음)이면 True
is.na(emp$comm)


emp[is.na(emp$comm),] # is.na(emp$comm)가 참(커미션이 정해지지 x, na, 결측치)인 정보만 꺼내줘

emp[!is.na(emp$comm),]# 커미션을 받는 직원들의 모든 정보 출력(논리 부정 연산)
subset(emp,!is.na(emp$comm)) 
View(emp)

# select ename,sal from emp where sal>=2000
subset(emp, emp$sal>= 2000, 
       c("ename","sal"))
subset(emp, select=c("ename","sal"), 
       subset= emp$sal>= 2000)
emp[emp$sal>=2000,c("ename","sal")]

# select ename,sal from emp where sal between 2000 and 3000
subset(emp, sal>=2000 & sal<=3000, c("ename","sal")) # subset일 경우에는 $ 생략 가능
emp[emp$sal>=2000 & emp$sal <=3000, c("ename","sal")] # 대괄호식 일 경우 $ 필수, 각 행마다 비교하려면 & 하나만!

# 등가(비교)연산은 T/F로 
y <- c(0,25,50,75,100)
z <- c(50, 50, 50, 50,50)
y == z
y != z
y > z
y < z
y >= z
y <= z
y == 50 # c(50, 50, 50, 50, 50)
y > 50