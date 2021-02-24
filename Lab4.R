# 문제1
L1 <- list(name="scott",sal=3000)

# 3000을 추출하여 2를 곱한 후에 result1 변수에 저장한다.
result1 <- L1$sal *2


# 문제2
L2 <- list("scott",c(100,200,300))


# 문제3
# 다음 리스트에서 A를 "Alpha"로 대체한다.
# list(c(3,5,7), c('A', 'B', 'C'))
L3 <- list(c(3,5,7), c('A', 'B', 'C'))
L3[[2]][[1]] <- "Alpha"


# 문제4
# 첫 번째 원소(alpha)의 각 값에 10을 더하여 출력
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha +10


# 문제5
# 첫 번째 원소는 data1이라는 이름으로 알파벳대문자로 구성되는 벡터
# 두 번째 원소는 data2이라는 이름으로 emp 라는 데이터프레임에서 3개행으로 구성된 데이터프레임
# 세 번째 원소는 data3이라는 이름으로 문제4에서 만든 L4 라는 리스트
L5 <-list(data1=LETTERS, data2=emp[1:3,], data3=L4) 

L5$data1[1]
L5$data2$ename
L5$data3$gamma


# 문제6
# math, writing, reading의 중간고사 및 기말고사 점수이다. (L6)
# 전체 평균을 계산하여 출력한다.
L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(unlist(L6))


# 문제7
# grade 라는 변수에 1부터 6사이의 백터에서 하나의 숫자를 추출하여 저장한다. 
# grade 의 값이 1 또는 2 또는 3이면 다음 결과를 출력한다. "x 학년은 저학년입니다."
# grade 의 값이 4 또는 5 또는 6이면 다음 결과를 출력한다. "x 학년은 고학년입니다."

grade <- sample(1:6,1)
if (grade >= 4){
  cat(grade,"학년은 고학년입니다","\n")
}else {
  cat(grade,"학년은 저학년 입니다.","\n")
}


grade <- sample(1:6,1)
grade <- paste(grade,"학년",sep="") 
result <- switch(EXPR=grade, 
                 "1학년"=,"2학년"=,"3학년"="저학년",
                 "고학년")
cat(grade,"은 ",result,"입니다\n",sep="")



# 문제8
# choice 라는 변수에 1부터 5사이의 백터에서 하나의 숫자를 추출하여 저장한다. 
choice <- sample(1:5,1)

# 추출된 값이 1이면 300 과 50 의 덧셈 연산을 처리한다.
# 추출된 값이 2이면 300 과 50 의 뺄셈 연산을 처리한다.
# 추출된 값이 3이면 300 과 50 의 곱셈 연산을 처리한다.
# 추출된 값이 4이면 300 과 50 의 나눗셈 연산을 처리한다.
# 추출된 값이 5이면 300 과 50 의 나머지 연산을 처리한다.
# 출력 형식(단, 출력문장은 한 번만 구현한다.) 결과값 : XX
if (choice==1){
  cat("결과값:",300+50)
}else if (choice==2){
  cat("결과값:",300-50)
}else if (choice==3){
  cat("결과값:",300*50)
}else if (choice==4){
  cat("결과값:",300/50)
}else{
  cat("결과값:",300%%50)
}



# 문제9
# count 라는 변수에 3부터 10사이의 난수를 추출하여 저장한다. 
count <- sample(3:10, 1)

# 1부터 3사이의 난수를 추출한다.(deco)
deco <- sample(1:3, 1)

# deco가 1이면 "*"을  count 값만큼 출력한다.
# deco가  2이면 "$"을  count 값만큼 출력한다.
# deco가  3이면 "#"을  count 값만큼 출력한다.
if (deco==1){
  for(i in 1:count){
    cat("*")}
}else if (deco==2) {
  for(i in 1:count){
    cat("$")}
}else{
  for(i in 1:count){
    cat("#")}
}



# 문제10
# score 라는 변수에 0~100 사이의 난수를 저장한다.
score <- sample(0:100,1)

# score 의 값이 90~100 이면 level 변수에 “A 등급”을 저장한다.
# score 의 값이 80~89 이면 level 변수에 “B 등급”을 저장한다.
# score 의 값이 70~79 이면 level 변수에 “C 등급”을 저장한다.
# score 의 값이 60~69 이면 level 변수에 “D 등급”을 저장한다.
# score 의 값이 59 이하면 level 변수에 “F 등급”을 저장한다.
# 결과를 다음 형식으로 출력한다. “xx 점은 x 등급입니다.”
score <- paste(score,"점",sep="") 
level <- switch(EXPR=score, 
                 "90점"=,"91점"=,"93점"=,"94점"=,"95점"=,"96점"=,"97점"=,"98점"=,"99점"=, "100점"="A등급",
                "80점"=,"81점"=,"83점"=,"84점"=,"85점"=,"86점"=,"87점"=,"88점"=,"89점"="B등급",
                "70점"=,"71점"=,"73점"=,"74점"=,"75점"=,"76점"=,"77점"=,"78점"=,"79점"="C등급",
                "60점"=,"61점"=,"63점"=,"64점"=,"65점"=,"66점"=,"67점"=,"68점"=,"69점"="D등급",
                 "F등급")
cat(score,"은 ",level,"입니다\n",sep="")




# 문제11
# 다음과 같이 영문자 대문자와 소문자로 구성되는 원소들을 갖는 벡터 alpha 를 생성하여 벡터의 내용을 화면에 출력한다.“Aa” “Bb” ……………………… “Zz”
Alpha <- LETTERS
alpha <- letters

paste(Alpha,alpha,sep="")