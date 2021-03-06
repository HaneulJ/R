
library(dplyr)
library(ggplot2)
# data/emp.csv 의 내용을 읽어서 emp 변수를 생성한다.
emp <- read.csv("data/emp.csv")

# 문제1
# 업무가 MANAGER 인 직원들의 정보를 출력한다.
emp %>% filter(job == 'MANAGER')


# 문제2
# emp 에서 사번, 이름, 월급을 출력한다.
emp %>% select(empno, ename, sal)


# 문제3
# emp 에서 사번만 빼고 출력한다.
emp %>% select(-empno)


# 문제4
# emp 에서 ename 과 sal컬럼만 출력한다.
emp %>%  select(ename, sal)

# 문제5
# 업무별 직원수를 출력한다.
emp %>% count(job)

# 문제6
# 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename, sal, deptno)

# 문제7
# emp 에서 업무 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
emp %>% filter(job !='ANALYST') %>% select(ename, job, sal)


# 문제8
#emp 에서 업무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
emp %>% filter(job == 'SALESMAN' | job == "ANALYST") %>% select(ename, job)

emp %>% filter(job %in% c('SALESMAN',"ANALYST")) %>% select(ename, job)


# 문제9
# 부서별 직원들 월급의 합을 출력한다.
emp %>% count(deptno) 
deptsal1 <- emp %>% filter(deptno == 10) %>% select(sal) 
deptsal2 <- emp %>% filter(deptno == 20) %>% select(sal)
deptsal3 <- emp %>% filter(deptno == 30) %>% select(sal)
sum(deptsal1)
sum(deptsal2)
sum(deptsal3)


emp %>% group_by(deptno) %>% summarise(sum(sal))


# 문제10
# 월급이 적은 순으로 모든 직원 정보를 출력한다.
emp %>% arrange(sal)

# 문제11
# 월급이 제일 많은 직원의 정보를 출력한다.
emp %>% arrange(desc(sal)) %>% head(1)


# 문제12
# 직원들의 월급을 보관하고 있는 컬럼의 컬럼명을 sal에서 salary 로 변경하고 커미션 정보 저장한 컬럼의 컬럼명를 comm 에서 commrate 로 변경한 후 empnew 라는 새로운 데이터셋을 생성한다.
empnew <- emp %>% rename(salary=sal, commrate=comm)


# 문제13
# 가장 많은 인원이 일하고 있는 부서 번호를 출력한다.
emp %>% 
  count(deptno) %>% 
  max


# 문제14
# 각 직원들 이름의 문자 길이를 저장하는 enamelength 라는 컬럼을 추가한 다음에이름 길이가 짧은 순으로 직원의 이름을 출력한다.
emp %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength)


# 문제15
# 커미션이 정해진 직원들의 명수를 출력한다.
emp %>%
  filter(!is.na(comm)) %>% 
  count