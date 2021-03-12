# 문제1
# mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 한다.
# x축은 cty, y축은 hwy로 된 산점도
ggplot(mpg,aes(cty, hwy)) + geom_point(col="blue") 

dev.copy(png, "output/result1.png")
dev.off()



# 문제2
# 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 한다. 
# 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 본다.
ggplot(data = mpg, aes(x = class)) + geom_bar(aes(fill=factor(drv)))

dev.copy(png, "output/result2.png")
dev.off()


# 문제3
# product_click.log 파일에서 클릭된 상품의 수를 적용한 바 그래프를 출력한다.
click <- read.table("data/product_click.log", encoding="UTF-8")
ggplot(data=click, aes(x = V2)) + geom_bar(aes(fill=V2))

dev.copy(png, "output/result3.png")
dev.off()


# 문제4
# product_click.log 파일을 가지고 요일별 상품 클릭 횟수에 따른 바 그래프로 출력한다.(x축은 요일명)
click <- read.table("data/product_click.log", encoding="UTF-8")
date <- as.Date(as.character(click[,1]), format = "%Y%m%d")
weekdays(date)
click$V1 <- weekdays(date) 

ggplot(data= click , aes(x= V1)) +geom_bar(aes(fill=V1)) + labs(fill="day",x="요일", y="클릭수")


dev.copy(png, "output/result4.png")
dev.off()



# 문제5
# treepmap을 그려본다. 데이터는 GNI2014 데이터셋을 사용한다. 
# data(GNI2014) 명령을 실행시켜서 GNI2014 데이터셋을 로드한다.
# 영역을 나누는 우선 순위 : 대륙, 나라코드
# 영역의 크기를 결정하는 값 : 인구수 
# treemap() 함수의 도큐먼트를 읽어보고 제목폰트의 사이즈를 20으로 하고 보더의 칼라를 green 으로 한다.
# 그려진 그래프는 result5.png 로 저장한다.(기본 그래프의 저장 방법을 사용해야 한다.)
head(GNI2014)
treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title="전세계 인구정보", fontfamily.title="maple",fontsize.title
=20, border.col="green")

dev.copy(png, "output/result5.png")
dev.off()