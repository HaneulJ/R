# (네이버 호텔 페이지에서 신라스테이 역삼에 대한 페이지)의 모든 댓글들을 추출하는 기능을 동적 크롤링으로 구현해 본다.
# 댓글을 모아서 저장하는 텍스트 파일명 : naverhotel.txt



remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)

Sys.sleep(3)
reple <- NULL
curr_PageOldNum <- 0
repeat{
  # 댓글 읽기(한 페이지에 있는)
  doms <- remDr$findElements(using = "css selector", "div.review_desc > p")
  Sys.sleep(1)
  sapply(doms, function (x) {x$getElementText()})

  reple <- append(reple, unlist(sapply(doms, function (x) {x$getElementText()})))
  cat(length(reple), "\n")
  # 다음버튼 찾아서 클릭이벤트 발생
  btn <- remDr$findElement(using='css selector'," div.review_ta.ng-scope > div.paginate > a.direction.next")
  btn$clickElement()
  
  Sys.sleep(2)
  # 마지막 페이지에서 종료 
  if(btn$getElementAttribute("class")=='direction next disabled'){
    cat("종료\n") 
    break; 
  }
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"output/naverhotel.txt")

