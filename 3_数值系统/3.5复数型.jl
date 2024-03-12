#复数“实部+虚部im”
1+2im
a=1
b=2
a+b*im
#这种乘号表示的复数不推荐，因为很容易与常规的乘法冲突，建议使用complex()函数   
c=3
d=4
complex(c,d)
ComplexF64(1.0,2.0)
f=ComplexF64(1.0,2.0)
#复数的操作
real(f) #实部
imag(f) #虚部
reim(f) #实部和虚部
conj(f) #共轭
abs(f) #模
abs2(f) #模的平方
angle(f) #幅角
