# 다음에 제시된 URL 문자열로 요청되는 페이지의 내용에서 요구되는 태그의 내용과 속성을 출력해 본다. 
# http://unico2013.dothome.co.kr/crawling/exercise_bs.html

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url) 
text


# <h1> 태그의 컨텐츠
h1 <- html_text(html_node(text, "h1")) ;h1

# <a> 태그의 href 속성값  
a <- html_attr(html_nodes(text, "a"), "href");a

# <img> 태그의 src 속성값
img <- html_attr(html_node(text,"img"),"src"); img

# 첫 번째 <h2> 태그의 컨텐츠
h21 <- html_text(html_nodes(text, "h2:nth-of-type(1)")); h21

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
ul <- html_text(html_nodes(text,"ul>li[style$=green]")); ul # $: ~으로 끝나는

  
# 두 번째 <h2> 태그의 컨텐츠
h22 <- html_text(html_nodes(text, "h2:nth-of-type(2)")) ;h22

# <ol> 태그의 모든 자식 태그들의 컨텐츠 
ol <- html_text(html_nodes(text, "ol>*")) ; ol

# <table> 태그의 모든 자손 태그들의 컨텐츠 
tb <- html_text(html_nodes(text, "table *")); tb # 자손들 컨텐트로 묶어서 출력


# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
name <- html_text(html_nodes(text, ".name"),"tr"); name


# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
target <- html_text(html_nodes(text, "#target"),"td"); target
