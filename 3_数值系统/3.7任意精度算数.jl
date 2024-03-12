#我们会发现遇到“超大”的数值时，都会面临越界溢出的问题
x = typemax(Int64)
x+1

#为了应对这个情况，实现任意精度的计算，Julia语言封装了GUN的多精度计算库GMP，和多精度浮点计算库，提供了BigInt和BigFloat两种类型。
#当使用BigInt类型时，处理上例中的变量x的情况，不再会出现溢出的问题
BigInt(x)+1
y = parse(BigInt,"1234567890123456789012345678901234567890")
typeof(y)
BigFloat(2.0^66)
#可采用big()函数将普通数值转换为BigFloat类型
z = big(typemax(Int64))
z+1

#采用BigFloat后，在epsilon值方面也有着很好的提升
eps(Float64)
eps(BigFloat)

#另外,在代码中以字面值的方式输入非常大的数值时，可以使用Julia特有的下划线分割方式，便于视觉上的划分
x = 123_456_789
y = 100_000_000
