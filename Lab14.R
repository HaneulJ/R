# 설문을 통해서 학생들에게 제일 좋아하는 과일을 3개씩 선택하도록 했다.


# 학생들에게 제시된 선택 보기 : 사과 포도 망고 자몽 귤 오렌지 바나나 복숭아 자두

# 듀크 : 사과 포도 망고
# 둘리 : 포도 자몽 자두
# 또치 : 복숭아 사과 포도
# 도우너 : 오렌지 바나나 복숭아
# 길동 : 포도 바나나 망고
# 희동 : 포도 귤 오렌지 

# tm 패키지에서 제공되는 DocumentTermMatrix() 와 proxy 패키지를 dist() 등을 이용하여 다음에 제시된 결과를 R 코드로 해결해 본다.

duke <- c("사과 포도 망고")
dl <- c("포도 자몽 자두")
ddc <- c("복숭아 사과 포도")
don <- c("오렌지 바나나 복숭아")
gd <- c("포도 바나나 망고")
hd <- c("포도 귤 오렌지")

fruit <- c(duke, dl, ddc, don, gd, hd )

cps <- VCorpus(VectorSource(fruit)) # VCorpus로 해야 한글이 안깨짐
dtm <- DocumentTermMatrix(cps,control=list(wordLengths = c(1, Inf)))
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m) 
com


# 좋아하는 과일이 가장 유사한 친구들을 찾아본다.
dist(com, method = "cosine") 

# 학생들에게 가장 많이 선택된 과일을 찾아본다.
colSums(m)
which.max(colSums(m))

# 학생들에게 가장 적게 선택된 과일을 찾아본다.
sort(colSums(m))