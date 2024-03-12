#涉及密集浮点运算的代码往往都是性能问题的焦点。浮点运算始终是需要开发者密切关注的内容。
#基本定义
#浮点数类型的定义是Float16, Float32, Float64。其中Float16是16位浮点数，Float32是32位浮点数，Float64是64位浮点数。
#如果要在Julia中以字面值输入浮点数，可以有多种形式，例如：
1.0
1.
.5
-1.23
1e10
2.5e-4

#默认情况下，浮点数类型是Float64。若要使用其他浮点类型，则需要显示地指明
typeof(1.0)
typeof(1f0)
typeof(1.0f0)
Float32(1.0)

#零的表达
#浮点数在计算机中的表示是有限的，所以浮点数的零是有精度的。在Julia中，浮点数的零有两种表示形式，分别是+0.0和-0.0。
bitstring(0.0)
bitstring(-0.0)
0.0 == -0.0 #返回布尔值true值，表示两者的值相同
#虽然都是零，但在二进制中最高位对应的符号位却是不同的。
#为了避免上述这种差异，Julia提供了专门的函数用于生成某类型的零值
zero(Float64)
zero(Float32)
zero(Float16)
#而且zero()函数除了按照指定类型生成相应的零值外，也可将某具体数值作为参数以生成相应类型的零值。
zero(1.0)
zero(1)
zero(1f0)
zero(1.0f0)
#显然，统一通过函数生成浮点零值，就不会出现上述内存表达差异的问题。
zero(-0.0)
bitstring(ans)
zero(0.0)
bitstring(ans)
#当然，zero()函数也可以用于生成其他数值类型。
zero(Bool)
zero(UInt32)
zero(1)
zero(true)

#推广，除了零之外，数值1也是特别常用的值。Julia也提供了one()函数用于生成某类型的1值。
one(Float64)
one(Float32)
one(Int64)
one(Bool)

#epsilon
#计算机相邻两个浮点型值之间存在着“缝隙”，为了能够评估这种误差，相邻浮点值间的这种缝隙的宽度称为epsilon值
#Julia中可以通过eps()获得某个浮点值附近的epsilon值
eps(10000.0)
eps(1.0)
eps(0.0)
eps(-1.0)
eps(-10000.0)
#在计算机能够表达的浮点数集合中，越靠近零点，数值的分布越稠密
#同时，也可以用来取某个浮点类型的epsilon值
eps(Float64)
eps(Float32)
eps(Float16)
eps()#默认是Float64类型1.0的epsilon值
#内置的nextfloat()和prevfloat()函数可以用来获得某个浮点数的下一个和上一个浮点数
nextfloat(1.0)
prevfloat(1.0)
x=1.25
x1 = nextfloat(x)
bitstring(x)
bitstring(x1)
#我们可以发现，x的前后继在二进制的表达上只差了一个进位制
x+eps(x) == nextfloat(x)
x-eps(x) == prevfloat(x)

#无穷值
#在浮点数中，无穷值是存在的。在Julia中，可以通过Inf和-Inf来表示正无穷和负无穷。
Inf 
-Inf
typemin(Float64)
typemax(Float64)
#有了对无穷值的支持，我们就可以在浮点运算中正常地使用除零操作了
1/0
1.0/0
-1/0
#如果想判断某个变量或值是否是无穷值，可以使用isinf()函数或isfinite()函数
isinf(1.0/0)
isfinite(1.0/0)

#非数值
#在浮点数中，还有一种特殊的值，称为非数值。在Julia中，可以通过NaN来表示非数值。
NaN
#非数值的特点是，它与任何数值进行比较的结果都是false
NaN == NaN
NaN === NaN
#如果想判断某个变量或值是否是非数值，可以使用isnan()函数
isnan(NaN)
isnan(0.0/0)
isnan(Inf)
#三种浮点类型(Float16, Float32, Float64)对应的”非数值“分别是NaN16, NaN32, NaN64

#内置常量
using Base.MathConstants
π #圆周率
e #自然对数的底

#补：Unicode字符输入
#\+tab键，可以输入Unicode字符
golden == φ #黄金比例
φ #\varphi+tab
ϕ #\phi+tab
γ #\gamma+tab
Δ #\Delta+tab
Ω #\Omega+tab
∞ #\infty+tab
√ #\sqrt+tab
∛ #\cbrt+tab
∑ #\sum+tab
∫ #\int+tab
∂ #\partial+tab
∇ #\nabla+tab
× #\times+tab
÷ #\div+tab
≠ #\ne+tab
≈ #\approx+tab
≤ #\le+tab
≥ #\ge+tab
⊂ #\subset+tab
⊆ #\subseteq+tab
⊃ #\supset+tab
⊇ #\supseteq+tab
⊄ #\nsubseteq+tab
⊅ #\nsupseteq+tab
⊈ #\nsubseteq+tab
⊉ #\nsupseteq+tab
#......

#无理数Irrational
typeof(π)
