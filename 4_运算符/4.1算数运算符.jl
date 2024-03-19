a = Int64(50)
b = Int32(2)
c = Float32(2.5)
d = Float64(3.0)
x = 3+2im
y = 15//8
#对于基本的数值类型、包括各种整型、浮点型、有理数型、复数型等
#加法
a + b
#减法
a - b
#乘法
a * b
#除法
a / b
#求余
a % b
#求幂
a ^ b
#开方
sqrt(a)
√(a)
#取整
div(a, b)
#立方根
cbrt(a)



a-y #Int64 - Rational{Int64}
d+y #Float64 + Rational{Int64}
d-x #Float64 - Complex{Int64}
x+y #Complex{Int64} + Rational{Int64}


#一般而言,复数优于浮点型，浮点型优于有理数型，有理数型优于整型
a*b #Int64 * Int32
typeof(ans)
a*c #Int64 * Float32
typeof(ans)
a*y #Int64 * Rational{Int64}
typeof(ans)
a/x #Int64 / Complex{Int64}
typeof(ans)

#运算符是除法，会自动采用浮点类型
a/b #Int64 / Int32
typeof(ans)

#同时，在除法运算符中，斜杠的除号/与数学除号÷在对整数进行计算时，有着显著的差异
a/b #Int64 / Int32
typeof(ans)
a÷b #Int64 ÷ Int32
typeof(ans)

#在Julia语言中如果出现除数为零的情况，是可以正常顺利执行的
c/0
y/0
x/0
#但对于求余数的操作，除数是不允许为零的
a%0

#求余操作并不仅限于整型
c%b #Float32 % Int32
d%c #Float64 % Float32
y%d #Rational{Int64} % Float64
#但是，求余并不适用于复数

#在算数运算符中，还有一种幂运算，同样适用于多种数值类型
2^5
2.1^5
(2//3)^5
(2+3im)^5
#幂运算中还支持指数为小数或复数等其他类型
2^2.5
2^2.5im
(2//3)^1.5
(2+3im)^1.5
2.1^(2+3im)
(2+3im)^(2+3im)
#另外指数也可以是负数
2^-5
2.1^-5
(2//3)^-5
(2+3im)^-5