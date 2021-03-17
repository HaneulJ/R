# Purifier.csv 파일을 가지고다중 회귀분석을 사용해서 
# 정수기 대수를 기준으로 추후에 소요될 AS 시간을 예측하고 AS 기사를 몇 명 고용할지 산출해 본다. 
# 기사 한 명이 한달간 처리하는 AS 시간은  8시간 * 20일 이다.
# 총 대여수는 300,000대이고 이 중 10년 이상 노후된 정수기는 70,000대로 가정한다.

library(dplyr)

pdata <- read.csv("data/purifier.csv")
summary(pdata)
head(pdata)




# 새로운 변수 추가(new_purifier 10년 미만 정수기 대여 수)
pdata <- pdata %>% mutate(new_purifier = purifier - old_purifier)
pmodel <- lm(as_time ~ new_purifier + old_purifier, data=pdata)

summary(pmodel)


# 함수로 계산
time_predict <- predict.lm(pmodel, newdata= data.frame(old_purifier=70000, new_purifier=230000))


man.mouth <- 8*20
time_predict / man.mouth


# 결론:
# 총 대여수가 300,000대, 10년 이상 노후 정수기 대여수가 70,000대인 경우 약 37403시간의 AS시간이 예상되며 약 234명의 기사를 고용해야 한다.




r <- residuals(pmodel)
coef(pmodel)

step(pmodel, direction="backward")
step(pmodel, direction="forward")
plot(pmodel)
