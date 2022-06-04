#a) 데이터 벡터 x를 만드시오
x = c(2,3,5,6,7,10)

#b) 각 데이터의 제곱으로 구성된 벡터 x2를 만드시오
x2=x^2

x2
#c) 각 데이터의 제곱의 합을 구하시오
sum(x2)

#d) 각 데이터에서 2를 뺀 값을 구하시오
x-2

#e) 최대값과 최소값을 구하시오
min(x)

max(x)
#f) 5보다 큰 값들로만 구성된 데이터 벡터 x_up을 만드시오
x_up = ifelse(x>5, x, NA)
x_up
x_5=x_up[!is.na(x_up)]
x_5


#g) 벡터 x의 길이를 구하시오
length(x)
#h) x'x를 구하시오
t(x)*x
#i) xx'를 구하시오
x*t(x)
#j) 벡터 x와 x2를 열결합(column bind)하여 xc에 저장하시오
xb=cbind(x,x2)
xb
#k) 벡터 x와 x2를 행결합(row bind)하여 xr에 저장하시오
xr=rbind(x,x2)
xr

