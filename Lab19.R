# picher_stats_2017.csv 파일을 읽고 원하는 선수에 대한 다음과 같이 삼진, 볼넷, 홈런 성적에 대한 레이더차트를 그려 본다.
# (다른 성적을 추가해도 됨, 칼라는 임의로)
library(dplyr)
library(fmsb)

ps <- read.csv('data/picher_stats_2017.csv', encoding = "UTF-8")
str(ps)
head(ps)
dim(ps)

ps1 <- data.frame(ps$삼진.9, ps$볼넷.9, ps$홈런.9)
colnames(ps1) <- c('삼진','볼넷','홈런')
ps2 <- ps1[3,]

ps3 <- rbind(rep(10,1.5), rep(0,1.5), ps2)

radarchart(ps3,                           # 데이터프레임
           pcol='red',                   # 다각형 선의 색 
           pfcol=rgb(0.2,0.5,0.5,0.5),   # 다각형 내부 색
           plwd=3,                       # 다각형 선의 두께
           cglcol='grey',                # 거미줄의 색
           cglty=1,                      # 거미줄의 타입
           cglwd=0.8,                    # 거미줄의 두께
           axistype=1,                   # 축의 레이블 타입
           seg=4,                        # 축의 눈금 분할                         
           axislabcol='grey',            # 축의 레이블 색
           title = "양현종 선수의 성적"
)

dev.copy(png, "output/Lab19.png")
dev.off()