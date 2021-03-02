# 문제 8
# iotest1.txt 파일에 저장된 데이터들을 읽고 다음과 같은 형식으로 결과를 출력하는 R 코드를 구현하고 test1.R 로 저장하여 제출한다.

# 오름차순 : …., 내림차순 : …., 합 : ...

iotest1 <- scan("data/iotest1.txt", what=integer(0)) # 리턴값: 숫자 벡터
cat("오름차순:", sort(iotest1))
cat("내림차순:", sort(iotest1, decreasing = TRUE))
cat("합:", sum(iotest1))
cat("평균:", mean(iotest1))