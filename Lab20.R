# R이 내장하고 있는 airquality 데이터셋에 대한 정보이다. 
# Ozone, Solar.R, Wind,Temp 변수들에 대하여 상관 분석을 실시한다. 

# 결측치가 있다면 결측치 행을 제거한 다음에 처리한다.
# Ozone, Solar,R, Wind,Temp 변수들의 상관계수를 구하여 상관행렬을 출력한다.
# 구해진 상관계수가 모두 통계적 유의성을 만족하는가? 
# 만일 통계적 유의성을 만족하지 않는변수의 관계가 있다면 어떤 변수들인가?
# 다음과 같이 시각화하여 변수들의 상관관계를 표현하고 각각을 이미지로 저장한다
library(psych)
library(corrplot)
library(MASS)
library(corrgram)

str(airquality)
head(airquality)
air.na.test <- airquality[, 1:4]

cor(air.na.test, use="complete.obs")


# 결측치 제거 
air_na_test <- cor(air.na.test, use="complete.obs") 

# 상관계수: p-value
corr.test(air.na.test)

# p-value 0.05이상
cor.test(air.na.test$Solar.R, air.na.test$Wind)

#1
plot(airquality[,1:4])
pairs(air.na.test)

dev.copy(png, "output/Lab20_1.png")
dev.off()

# 2

pairs.panels(air.na.test, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")

dev.copy(png, "output/Lab20_2.png")
dev.off()


# 3
corrplot(air_na_test, method="pie",addCoef.col="black", type="lower", order="hclust", tl.srt=45, diag=F)

dev.copy(png, "output/Lab20_3.png")
dev.off()