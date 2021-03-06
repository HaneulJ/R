# 문제1
# 데이터셋이 몇 개의 관측치를 가지고 있으며 어떠한 변수들을 가지고 있는지 체크
str(iris)


# 문제2
df1 <- data.frame(x=c(1:5),y=seq(2,10,2)) # 행 넘버는 자동으로 부여


# 문제3
df2 <- data.frame(col1=c(1:5),col2=letters[1:5], col3=c(6:10)) # 파라미터 지정할 때는 = 만 사용!


# 문제4
제품명 <- c("사과", "딸기", "수박")
가격 <- c(1800, 1500, 3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명, 가격, 판매량)
class(df3)


# 문제5
# 과일 가격 평균, 판매량 평균을 구하여 출력
mean(df3$가격)
mean(df3$판매량)


# 문제6
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math)
str(df4)

# stat 변수 추가
df4$stat <- c(76, 73, 95, 82, 35)

# score 변수를 추가하는데 score 변수의 값은 math 변수와 stat 변수의 합을 구하여 저장
df4$score <- df4$math+df4$stat

# 논리 연산 인덱싱을 이용하여 score가 150 이상이면 A, 100 이상 150 미만이면 B, 70 이상 100 미만이면 C, 70 미만이면 D 등급을 부여하고 grade 변수에 저장하시오.
df4$grade <- ifelse(df4$score >= 150,"A",
                    ifelse(df4$score < 150 & df4$score >= 100 ,"B", 
                           ifelse(df4$score < 100 & df4$score >=70 ,"C","D")))

# 문제7
# myemp변수에 할당된 데이터프레임 객체의 구조를 점검
myemp <- read.csv("data/emp.csv")
str(myemp)


# 문제8
# myemp 에서 3행, 4행 , 5행만 출력
myemp[3:5,]


# 문제9
# myemp 에서 사번열을 제외하고 출력한다.
myemp[,-4]


# 문제10
# myemp 에서 ename컬럼만 출력
myemp$ename

# 문제11
# myemp 에서 ename 과 sal컬럼만 출력한다.
myemp[,c("ename","sal")]


# 문제12
# myemp 에서 직무가 SALESMAN 인 사원의 이름, 월급, 직업을 출력한다.
myemp[myemp$job == "SALESMAN",c("ename","sal", "job")]


# 문제13
# myemp 에서 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.
myemp[myemp$sal>=1000 & myemp$sal<=3000,c("ename","sal", "deptno")]
      
      
      
# 문제14
# myemp 에서 직무가 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
subset(myemp,!is.na(emp$job=="ANALYST"),c("ename","job", "sal")) 


# 문제15
# myemp 에서 직무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
myemp[myemp$job=="SALESMAN" | myemp$job=="ANALYST",c("ename","job")]


# 문제16
# myemp 에서 커미션이 정해지지 않은 직원의 이름과 월급 정보를 출력한다.
myemp[is.na(myemp$comm), c("ename","sal")]


# 문제17
# myemp 에서 월급이 적은 순으로 모든 직원 정보를 출력한다.
myemp[order(myemp$sal),] # sort를 쓸 경우 월급 금액만 출력

# 문제18
# myemp의 행과 열의 갯수를 점검한다.
dim(myemp) # 변수 타입이나 구조: str()


# 문제19
# myemp 에서 부서별 직원이 몇 명인지 출력한다.
myemp$deptno <- factor(myemp$deptno)
summary(myemp$deptno)


# 문제20
# myemp 에서 직무별 직원이 몇 명인지 출력한다.
f_job <- factor(myemp$job)
summary(f_job)





