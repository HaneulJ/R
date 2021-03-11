library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 문제1
# product_click.log 파일을 읽어와서 제품당 클릭 갯수에 대한 데이터를 가지고 다음 조건으로 그래프를 그린다.  
# 세로 바 그래프를 칼라는 terrain.colors 칼라로 설정한다. 
# 그래프 메인 제목 : "세로바 그래프 실습"
# clicklog1.png 에 저장한다.
dev.copy(png, 'output/clicklog1.png')

(click <- read.table("data/product_click.log"));
head(click)
pc <- click[,2]; 
pc1 <- table(pc)

barplot(pc1, main = "세로바 그래프 실습 ", col.main="red", col = terrain.colors(10),
     xlab='상품 ID', ylab='클릭 수', ylim=c(0,100), family="maple")

dev.off()

# 문제2
# product_click.log 파일을 읽어와서 다음과 같이 상품이 클릭된 시간 정보를 가지고 파이그래프를 그리며 칼라는 자율이다. 
# 그래프 메인 제목 : "파이그래프 실습"
# 그래프는 clicklog2.png 에 저장한다.

dev.copy(png, 'output/clicklog2.png')

pc2 <- click$V1
pc_hour <- substr(pc2, 9, 10)
pc3 <- table(pc_hour)
length(pc3)


names(pc3)

piename <- paste(as.integer(names(pc3)), "~",as.integer(names(pc3)) +1, sep='')
names(pc3) <- piename
pie(pc3, main="파이그래프 실습", col=rainbow(17), family="maple", 
    col.main="blue")


dev.off()

# 문제3
# 수업시간에 다뤘던 성적데이터를 가지고 다음과 같은 그래프를 R로 구현해 본다. 
# 제시된 대로 칼라를 지정하며 그래프는 clicklog3.png 에 저장한다.
# 문자열로 바꿔서 시간에 해당되는 애들만 뽑아내기
# posix~
dev.copy(png, 'output/clicklog3.png')

(성적 <- read.table("data/성적.txt", header=TRUE))
성적 <- 성적[,3:5]
boxplot(성적, col=c("red",'green',"blue"),  ylim=c(0,10), family="maple")
title(main="과목별 성적 분포", col.main="orange", font.main=4, family="maple")

dev.off()




# 문제4
# 수업시간에 다뤘던 성적데이터를 가지고 다음과 같은 그래프를 R로 구현해 본다. 
# 칼라는 원하는대로 지정하며 그래프는 clicklog4.png 에 저장한다.
dev.copy(png, 'output/clicklog4.png')
barplot(t(성적), main="학생별 점수", family="dog", col.main='hotpink', ylim=c(0,25), col=c("orange","skyblue","pink"),
        names=c('길동','둘리','또치','도우너','희동','듀크','턱시','토토로','올라프','우디'),
        legend.text=T)

dev.off()