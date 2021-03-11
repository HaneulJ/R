# 다음 문제를 dplyr 패키지의 %>% 기호를 사용해서 해결하시오.
library(dplyr)
library(ggplot2)

# 문제1
# ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다.
# mpg의 구조를 확인한다.
mpg %>% str

# mpg 의 행의 개수와 열의 개수를 출력한다.
dim(mpg)

mpg %>% nrow()
mpg %>% ncol()

# mpg의 데이터를 앞에서 10개 출력한다.
mpg %>% head(.,10)

# mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>% tail(10)

# mpg의 데이터를 GUI 환경으로 출력한다.
mpg %>% View()

# mpg를 열 단위로 요약한다.
mpg %>% summary()

# mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% count(manufacturer)

# mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% count(manufacturer, model)



# 문제2 
# 복사본 데이터를 이용해서 cty는 city로,hwy는 highway로 변수명을 수정하세요
mpg2 <- mpg %>% rename(city = cty, highway = hwy)

# 데이터 일부를 출력해서 변수명이 바뀌었는지확인해보세요
mpg2 %>% head()



# 문제3

# ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
str(midwest)
midwest %>% as.data.frame() %>% str()

# poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
midwest <- midwest %>% rename(total = poptotal, asian = popasian)

# total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요.
midwest$Apercent <- (midwest$asian/midwest$total)*100

midwest %>% mutate(Apercent = asian/total*100)

# 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
avg <- mean(midwest$Apercent)
midwest$avg <- ifelse(midwest$Apercent > avg, "large", "small")

midwest %>% mutate(avg = ifelse(Apercent> mean(Apercent), "large", "small"))



# 문제4
# 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다.
# displ(배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요.
mpg %>% 
  filter(displ <= 4) %>%  
  select(hwy) %>%  
  summarise(mean_4hwy= mean(hwy))

mpg %>% 
  filter(displ >= 5) %>%  
  select(hwy) %>%  
  summarise(mean_5hwy= mean(hwy))

# 자동차 제조회사에 따라 도시연비가 다른지 알아보려고 합니다.
# audi와 toyota 중 어느 manufacturer의 cty가 평균적으로 더 높은지 알아봇요
mpg %>% 
  filter(manufacturer == 'audi'|manufacturer == 'toyota') %>%  
  group_by(manufacturer) %>%  
  summarise(mean_Acty= mean(cty))


# chevrolet, ford, honda 자동차의 고속도로 연비 평균을 알아보려고 합니다.
# 이 회사들의 자동차를 추출한 뒤 hwy의 전페 평균을 구해보세요.

mpg %>% 
  filter(manufacturer == "chevrolet" | manufacturer == "ford"| manufacturer == "honda") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_C=mean(hwy))


# 문제5
# mpg데이터에서 class, cty변수를 추출해 새로운 데이터를 만드세요.
# 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg_cc <- mpg %>% select(class, cty)
head(mpg_cc)


# 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다.
# 앞에서 추출한 데이터를 이용해서 class가 suv인 자동차와 compact인 자동차 중 어떤 자동차의 cty가 더 높은지 알아보세요.
mpg_cc %>% 
  filter(class=="suv" | class=="compact") %>% 
  group_by(class) %>% 
  summarise(max_mpgcc=max(cty)) %>% 
  arrange(desc(max_mpgcc))



# 문제6
# audi에서 생산한 자동차 중에 어떤 자동차 모델의 hwy가 높은지 알아보려고 합니다.
# audi에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력하세요.
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)
