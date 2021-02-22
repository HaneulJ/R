# 문제1
# 1부터 10사이의 벡터를 만들어서 v1 이라는 변수에 저장
v1 <- 1:10

# 각 원소 값들에 2를 곱
v2 <- v1 *2

# v2 에서 최대값 추출
max_v <- max(v2)

# v2 에서 최소값 추출
min_v <- min(v2)

# v2 에서 평균값 추출
avg_v <- mean(v2)

# v2 에서 을 추출
sum_v <- sum(v2)

# v2 에서 5번째 원소를 제외하고 v3 라는 변수에 저장한다.
v3 <- v2[-5]

v1; v2; v3; max_v; min_v; avg_v; sum_v




# 문제2
# seq() 또는 rep() 함수를 이용하여 다음과 같이 구성되는 벡터를 생성하여 각각 v4, v5, v6, v7 에 저장한 후에 출력한다.
v4 <- seq(1, 10, by=2)
v5 <- rep(1,5)
v6 <- rep(1:3, 3)
v7 <- rep(1:4, each=2)
v4; v5; v6; v7


# 문제3
# 1부터 100으로 구성되는 10개의 중복되지 않는 데이터를 추출하여 nums 라는 백터를 만든다. 
nums <- sample(1:100, 10)

# 오름차순 정렬
sort(nums)

# 내림차순 정렬
sort(nums, decreasing=TRUE)

# 50보다 큰 원소 값들만 출력
nums[nums > 50] 

# 50보다 작거나 같은 원소들의 인덱스 출력
which(nums <= 50)

# 최대값 원소의 인덱스 출력
which.max(nums)

# 최소값 원소의 인덱스 출력
which.min(nums)



#문제4
# 1부터 10 까지 출력하는데 3씩 증가 되는 형태로(1 4 7 10)저장되는 벡터를 정의하여 v8 변수에 저장한 다음 R 의 내장 백터를 활용하여 v8의 각 원소에 "A", "B", "C", D" 라는 이름을 부여한다.
v8 <- seq( from=1, to=10, by=3 )
names(v8) <- LETTERS[1:4]



# 문제5
# 1부터 20으로 구성되는 5개의 중복되지 않는 데이터를 추출하여 score 라는 백터를 만든다. 
score <- sample(1:20, 5)
myFriend <- c('둘리', '또치','도우너', '희동', '듀크')

paste(score, myFriend, sep = "-")

# 점수가 가장 높은 친구의 이름 출력
myFriend[which.max(score)]

# 점수가 가장 낮은 친구의 이름 출력
myFriend[which.min(score)]

# 점수가 10점보다 높은 친구의 이름들 출력
myFriende[which(score>10)]


# 문제6
# 1부터 100으로 구성되는 7개의 중복되지 않는 데이터를 추출하여 count 라는 백터를 만든다. 
count <- sample(1:100, 7)
week.korname <- c("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일")

paste(count, week.korname, sep=":")

# 값이 가장 큰 요일의 명칭을 출력한다.
week.korname[which.max(count)]

# 값이 가장 작은 요일의 명칭을 출력한다.
week.korname[which.min(count)]

# 50보다 큰 값에 해당하는 요일의 명칭을 출력한다.
week.korname[which(count>50)]