# 상관분석

library(MASS)
str(cats)
?cats
head(cats)

# y축 왼쪽 ~ x축 오른쪽
plot(cats$Hwt ~ cats$Bwt,
     col="forestgreen", pch=19,
     xlab="Body Weight (kg)", ylab="Heart Weight (g)",
     main="Body Weight and Heart Weight of Cats")

# 상관계수 cor
cor(cats$Bwt, cats$Hwt)

# with(cats로 적용한다~, )
with(cats, cor(Bwt, Hwt))

cor.test(cats$Bwt, cats$Hwt)
with(cats, cor.test(Bwt, Hwt))
with(cats, cor.test(~ Bwt + Hwt))
cor.test(~ Bwt + Hwt, data=cats)
cor.test(~ Bwt + Hwt, data=cats, subset=(Sex=="F")) # subset(조건)
with(cats, cor.test(~ Bwt + Hwt, subset=(Sex=="M")))



str(iris)
cor(iris[-5]) # 연속형이 아닌 5번째 열 제외하기

iris.cor <- cor(iris[, 1:4])
class(iris.cor)
str(iris.cor)
iris.cor
iris.cor["Petal.Width", "Petal.Length"]
pairs(iris[, 1:4]) # 산점도 행렬
# 각각의 변수마다 통계적으로 유의한지 확인
cor.test(iris$Petal.Length, iris$Petal.Width)
cor.test(iris$Sepal.Length, iris$Sepal.Width)
cor.test(iris$Petal.Length, iris$Sepal.Width)
cor.test(iris$Sepal.Length, iris$Petal.Width)

iris.na.test <- iris[, 1:4]
iris.na.test[1,1] <- NA
iris.na.test[3,2] <- NA
iris.na.test[4,3] <- NA
head(iris.na.test)
cor(iris.na.test)

cor(iris.na.test, use="complete.obs") 
# na를 가지고 있는 행을 제외하고 상관관계 출력, 행 자체를 삭제하는 것은 아님 
cor(iris.na.test, use="pairwise.complete.obs")

install.packages("psych")
library(psych)
corr.test(iris[-5]) # 여러 변수들 한번에 지정하여 검수 가능
print(corr.test(iris[-5]), short=FALSE)

?state.x77
str(state.x77)
head(state.x77)
old.op <- options(digits=2) #소숫점 자리 설정
cor(state.x77)
options(old.op)



str(mtcars)
head(mtcars)
car_cor <- cor(mtcars)
round(car_cor,2) # 모든 변수들에 대한 상관계수를 반올림해서 둘째짜리까지 출력
install.packages("corrplot")
library(corrplot)
corrplot(car_cor)  # 상관행렬 그래프 시각화
# order = hclust: 
corrplot(car_cor, type="lower", order="hclust", tl.srt=45) #tl.srt 대각선 기준 한쪽만 나타내기, 글씨 45도
corrplot(car_cor, method="ellipse", type="lower", order="hclust", tl.srt=45, diag=F) # diag=F: 자기자신과의 계수(대각선 1) 생략
corrplot(car_cor, method="number", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="shade", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="pie", type="lower", order="hclust", tl.srt=45, diag=F)
corrplot(car_cor, method="color", type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="color", addCoef.col="black", type="lower", order="hclust", tl.srt=45)
corrplot(car_cor, method="color", addCoef.col="black", type="lower", diag=F, tl.srt=45)



library(psych)
pairs.panels(state.x77, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")


install.packages("corrgram")
library(corrgram)
corrgram(state.x77, order=TRUE, lower.panel=panel.shade, 
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Corrgram of US States Data")


cols <- colorRampPalette(c("darkgoldenrod4", "burlywood1", 
                           "darkkhaki", "darkgreen"))
corrgram(state.x77, order=FALSE, col.regions=cols,
         lower.panel=panel.pie, upper.panel=panel.conf, 
         text.panel=panel.txt, main="Corrgram of US States Data")


str(Orange)
head(Orange)

cor(Orange$circumference, Orange$age)
plot(Orange$circumference, Orange$age, col = "red", pch = 19 )
cor.test(Orange$circumference, Orange$age)


######################
## 단순선형회귀분석 ##
######################

# R에 내장된 women 데이터셋으로 키에 따른 몸무게 예측 분석

str(women)
head(women)
?women

# 선형관계 확인
plot(women, xlab="키(in)", ylab="몸무게(lbs)")

plot(women$height, women$weight, xlim=c(0, 
      max(women$height)), ylim=c(0, max(women$weight)),
     xlab="키(in)", ylab="몸무게(lbs)")

# 회귀선 그리기
plot(women$height, women$weight, xlab="키(in)", ylab="몸무게(lbs)")
abline(lm(weight~height, data=women), col="red", lty=2) # lm에 의해 만들어진 함수의 리턴값으로

cor(women$height, women$weight)
cor(women$weight, women$heigh)

# 회귀분석
women.lm <- lm(weight~height, data=women)
women.lm
str(women.lm)
class(women.lm)
summary(women.lm)

# 회귀식(모델)
# wight = -87.51667 + 3.45000*height
# 키값에 따른 몸무게 예측
h = c(100, 120, 140)
-87.51667 + 3.45000*h

predict(women.lm, data.frame(height=h))




# R에 내장된 cars 데이터셋으로 자동차 속도에 따른 정지 거리 예측

str(cars)
head(cars)

x <- cars$speed
y <- cars$dist

# 선형관계 확인
plot(x, y, xlab="속도", ylab="정지 거리")


# 수리적 모형으로 해 구하기
cars.lm <- lm(y~x)
cars.lm
summary(cars.lm) # Multiple R-squared: 설명력?
str(cars.lm)
names(cars.lm)
# cars.lm$coefficients만 했을 때 첫 원소 y절편, x는 기울기
(intercept <- cars.lm$coefficients[1]) # y절편
(slope <- cars.lm$coefficients[2]) # 기울기

# 회귀선 그리기
plot(x, y, xlab="속도", ylab="정지 거리")
abline(a=intercept, b=slope, col="red", lty=2)


# 예측
x <- 35
y.hat <- slope*x + intercept
y.hat 


predict(cars.lm, newdata=data.frame(x=35))
predict.lm(cars.lm, newdata=data.frame(x=35))


(cars.lm2 <- lm(dist ~ speed, data=cars))
predict(cars.lm2, newdata=data.frame(speed=35))
predict.lm(cars.lm2, newdata=data.frame(speed=35))


# factory.csv 파일을 읽어서 회귀분석
fdata <- read.csv("data/factory.csv")
str(fdata)
fdata # attach(fdata)를 하면 $ 필요없이 전역적으로 호출가능, detach(fdata)하기 전까지
# 데이터의 산점도
plot(fdata$age, fdata$cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("사용연도와 정비비용", cex.main=2, col.main="red") 

# 최소제곱법에 의한 회귀직선을 적합
factory.lm <- lm(cost ~ age, data=fdata) # age: 독립, cost: 종속
abline(factory.lm, col="red")

# 추정치의 표준오차(Residual standard error), 결정계수(설명력):Multiple R-squared, 상관계수: 루트 결정계수
summary(factory.lm)

# 회귀 방정식으로 예측
29.107 + 13.637 * 4 
predict(factory.lm, newdata=data.frame(age=4) ) #사용연도가 4년인 기계의 평균정비비용 추정

names(factory.lm)
sum(factory.lm$residuals) # 잔차들의 합

cbind(fdata, factory.lm$residuals, factory.lm$fitted.values)

fdata[,2] == round(factory.lm$residuals + factory.lm$fitted.values)


# 단일선형에서는 굳이 표준화 안해도 됌
# 데이터들을 표준화 시켜서 회귀분석
attach(fdata)
st_fdata <- cbind(fdata, st_age=(age-mean(age))/sd(age), st_cost=(cost-mean(cost))/sd(cost))
attach(st_fdata)
st_factory.lm <- lm(st_cost ~ st_age, data=st_fdata)  
plot(st_age, st_cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("변수 표준화 후의 사용연도와 정비비용", cex.main=2, col.main="red") 
abline(st_factory.lm, col="red")
summary(st_factory.lm)
detach(st_fdata)
predict(st_factory.lm, newdata=data.frame(st_age=4) )



attach(fdata)
st_fdata <- cbind(fdata, st_age=scale(age), st_cost=scalecost)
attach(st_fdata)
st_factory.lm <- lm(st_cost ~ st_age, data=st_fdata)  
plot(st_age, st_cost, xlab="사용연도", ylab="정비비용", pch=19, col="blue", cex.lab=1.5)
title("변수 표준화 후의 사용연도와 정비비용", cex.main=2, col.main="red") 
abline(st_factory.lm, col="red")
summary(st_factory.lm)
detach(st_fdata)
predict(st_factory.lm, newdata=data.frame(st_age=4) )



# Orange 데이터셋 : 각 나무의 종류, 나무의 나이, 나무 둘레 길이에 대한 35개의 관측값으로 구성 
head(Orange)
data(Orange)
head(Orange)
model <- lm(circumference ~ age, Orange) # 독립: age, 종속: 둘레
model
# 회귀 계수만 출력
coef(model)
# 잔차 추출
r <- residuals(model)
r[1:4] 

# 모델을 적용하여 예측값 구하기
f <- fitted(model) # predict()
r <- residuals(model)

# 예측 데이터값 + 잔차
f[1:4] + r[1:4] 
# 실제 데이터값
Orange[1:4,'circumference'] 



# 생성된 모델로 지정된 독립변수 값에 대한 종속변수 값 예측하기
predict.lm(model, newdata = data.frame(age = 100))


# 결정계수는 상관계수의 제곱
summary(model) 
cor(Orange$circumference, Orange$age)       # 상관계수
cor(Orange$circumference, Orange$age) ^ 2   # 결정계수


# 단순회귀 모델의 시각화
plot(Orange$age, Orange$circumference)
abline(coef(model))



####################
## 다중 회귀 분석 ##
####################


fdata2 <- read.csv("data/factory2.csv")
fdata2.lm <- lm(robber~temp+pressure, data=fdata2)
summary(fdata2.lm)
-554.5267-0.1743 * 200 + 11.8449 * 59
predict(fdata2.lm, newdata=data.frame(temp=200, pressure=59) )


fdata3 <- read.csv("data/factory3.csv")
fdata3.lm <- lm(Y~X1+X2+X3, data=fdata3)
summary(fdata3.lm)


2.409213+0.069788*20-0.024767*27+0.005864*60

predict(fdata3.lm, newdata=data.frame(X1=20, X2=27, X3=60))



# 엄마와 아빠 키로 아들의 키를 예측하는 다중선형회귀모델 생성 
height_father <- c(180, 172, 150, 180, 177, 160, 170, 165, 179, 159) # 아버지 키 
height_mohter <- c(160, 164, 166, 188, 160, 160, 171, 158, 169, 159) # 어머니 키
height_son <- c(180, 173, 163, 184, 165, 165, 175, 168, 179, 160) # 아들 키 
height <- data.frame(height_father, height_mohter, height_son)
head(height) 

model <-lm (height_son ~ height_father + height_mohter, data = height)
model # father의 영향이 더 크다

(coef_r <- coef(model))
coef_r[1]
coef_r[2]
coef_r[3]

# 잔차 
r <- residuals(model)
r[1:4]




# 예측 
predict.lm(model, newdata = data.frame(height_father = 170, height_mohter = 160))
predict.lm(model, newdata = data.frame(height_father = 170, height_mohter = 160), interval = "confidence")

# 결정계수와 수정된 결정계수
summary(model)





install.packages("car")
library(car)


data(mtcars)
str(mtcars)
mtcars <- mtcars[c("mpg", "hp", "wt", "disp", "drat")]
summary(mtcars)
cor(mtcars)




# 종속변수에 대한 독립변수(설명변수)들 각각의 예측력을 점검하려면 변수값들을 표준화를 해야 한다.
library(car)
scatterplotMatrix(mtcars, pch=19, col="royalblue", cex=1.2,
                  regLine=list(method=lm, lty=1, lwd=3, col="salmon"),
                  smooth=list(smoother=loessLine, spread=FALSE, 
                              lty.smooth=1, lwd.smooth=3, col.smooth="forestgreen"),
                  main="Car Performance")

mtcars.lm <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
summary(mtcars.lm)

install.packages("stargazer")
library(stargazer)
stargazer(mtcars.lm, type="text", no.space=TRUE)

mtcars.lm <- lm(scale(mpg) ~ scale(hp) + scale(wt) + scale(disp) + scale(drat), 
                data=mtcars)
summary(mtcars.lm)


mtcars.lm1 <- lm(mpg ~ hp + wt, data=mtcars)
mtcars.lm2 <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
AIC(mtcars.lm1, mtcars.lm2)


# 다중 회귀분석에 사용할 변수 선택하기 
mtcars.lm <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
step(mtcars.lm, direction="backward")

data(mtcars)
mtcars.lm <- lm(mpg ~ ., data=mtcars)
step(mtcars.lm, direction="both")


tadata <- read.csv("data/TAccident.csv")
View(tadata)
start.lm <- lm(Y~1, data=tadata)
full.lm <- lm(Y~., data=tadata)
step(start.lm, scope=list(lower=start.lm, upper=full.lm), direction="forward")
step(full.lm, data=tadata, direction="backward")
step(start.lm, scope=list(upper=full.lm), data=tadata, direction="both")




# 가중 회귀분석의 조정된 결정계수가 향상되는 변수들을 알려준다.
install.packages("leaps")
library(leaps)
mtcars.regsubsets <- regsubsets(x=mpg ~ hp + wt + disp + drat, data=mtcars, nbest=4)

library(RColorBrewer)
plot(mtcars.regsubsets, scale="adjr2", col=brewer.pal(9, "Pastel1"),
     main="All Subsets Regression")

summary(mtcars.regsubsets)

names(summary(mtcars.regsubsets))

summary(mtcars.regsubsets)$adjr2

which.max(summary(mtcars.regsubsets)$adjr2)
coef(mtcars.regsubsets, 9)



df = read.csv('data/crab.csv')
head(df)
model = lm(y ~ sat + weight + width, df)
summary(model)

library(car)
vif(model)

summary(lm(y ~ sat + weight, df))





# 다중 회귀분석 모델 진단
mtcars.lm <- lm(mpg ~ hp + wt + disp + drat, data=mtcars)
old.par <- par(mfrow=c(2, 2))
plot(mtcars.lm)
old.par

library(car)
vif(mtcars.lm)
vif(mtcars.lm) > 4
vif(mtcars.lm) > 10




# 변동계수 채크

v1 <- c( 3,5,6,8,9,11,15)
v2 <- v1*10

sd(v1)
sd(v2)

(v1.cv = sd(v1) / mean(v1))
(v2.cv = sd(v2) / mean(v2))