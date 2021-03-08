# 문제 2 
# 제시된 memo.txt 파일을 행 단위로 읽어서 벡터를 리턴한다.
# 벡터를 구성하고 있는 각 원소들의 내용을 확인한 후에 아래에 제시된 결과로 변경되도록 문자 또는 문자열 변경을 시도한다. (gsub() 사용)
# 원소마다 변경해야 하는 룰이 다르므로 원소마다 처리한다.
# 처리된 결과를 memo_new.txt 파일에 저장한다. (write() 함수 사용)

memo <- readLines("data/memo.txt", encoding = "UTF-8") 
memo_new <- gsub("[^가-힣]", "", memo)
write(memo_new, file="data/memo_new.txt",append=TRUE)