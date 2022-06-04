#boot
library(boot)
setwd("C:\\Users\\user\\Desktop\\2021-1\\데이터 마이닝 입문\\실습\\regression")
insurance=read.csv("insurance.csv",stringsAsFactors = TRUE) #디폴트가 false
summary(insurance)

stat_fun = function(x,idx){ median(x[idx])}

boot_obj = boot(insurance[,1], R = 1000, statistic = stat_fun)
boot_obj
#########################################
#중간값의 추정치는 39, 편향이 0.3265 
#0.77의 표준오차가 있음


subset
#class - knn

#cluster - 군집 시각화
setwd("C:\\Users\\user\\Desktop\\2021-1\\데이터 마이닝 입문\\실습\\clustering")
teens=read.csv("snsdata.csv",stringsAsFactors = TRUE)
data = teens[-2]
data$Female = ifelse(teens$gender=="F" & !is.na(teens$gender),1,0)
data$genderNA = ifelse(is.na(teens$gender),1,0)
aggregate(data$age~data$gradyear, FUN = function(x) mean(x))
ave_age = ave(data$age, data$gradyear, FUN = function(x) mean(x, na.rm=TRUE))
data$age = ifelse(is.na(data$age), ave_age, data$age)
data_z = as.data.frame(scale(data))
km = kmeans(data_z, 10)
data$cluster = km$cluster

library(cluster)
clusplot(data_z, clus = km$cluster)



#foreign - dta파일 불러오는
example = read.dta("ex.dta")
write.dta(example, "ex.dta")







#KernSmooth - 국소 선형회귀 - 비선형 모형화 기법
#근처에 있는 점 위치를 고려해 종속변수 좌표를 조정
setwd("C:\\Users\\user\\Desktop\\2021-1\\데이터 마이닝 입문\\실습\\regression")
insurance=read.csv("insurance.csv",stringsAsFactors = TRUE) #디폴트가 false
library(KernSmooth)
res = locpoly(insurance$age, insurance$charges, bandwidth = 0.3)
summary(res)





#lattice - 시각화, ggplot2도
library(lattice)
xyplot(charges~age, data = insurance)


library(ggplot2)
plot(charges~age, data = insurance)






#MASS - 선형 판별분석
#       다변량 분산분석 이후 판별함수 분석을 수행하면 
#       종속변수들이 그룹들을 어떻게 분리하는지 파악할 수 있음

library(MASS)
ocdDFA = lda(cluster~., data = data, na.action = na.omit)
ocdDFA
predict(ocdDFA) #판별 점수





library(Matrix)
A = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
A
B = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow = TRUE)
B

#분해
LUA = expand(Matrix :: lu(A))






#caret -  혼동행렬
library(rpart)
setwd("C:\\Users\\user\\Desktop\\2021-1\\데이터 마이닝 입문\\실습\\Decisition Tree")
credit=read.csv("credit.csv", stringsAsFactors = TRUE)
str(credit)
train = credit[1:700,]
test = credit[701:1000,]
rtree = rpart(default~., data = train)
pred = predict(rtree, test, type="class") 
pred
library(caret)
confusionMatrix(pred,test$default)


data.frame

lm


#mgcv - GAM 추정?
#GAM: linear 하지않은 복잡한 모델이 있으면 한 모델을 여러 구간으로 잘라서 각 구간의
#상관계수를 구해 볼 수 있는 방법
library(mgcv)
insurance
lr = gam(charges~age, data = insurance, family = poisson)
#포아송 분포, 이항분포면 family = binominal
summary(lr)





#nlme - glm 모델(로지스틱회귀)
model = glm(y~., data = data)




#survival - 생존분석?
survfit



