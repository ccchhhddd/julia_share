# Julia中的整型分为有符号及无符号两类，有符号整型的类型名为Int，无符号整型的类型名为UInt，两者的位数相同，分别有8、16、32、64、128五种位数。在Julia中，整型的位数是由系统决定的，可以使用typemin()和typemax()函数来查看整型的最小值和最大值。

typemin(Int64)
typemax(Int64)

typemin(UInt64)
typemax(UInt64)

# 使用bitstring()函数查看整数的二进制表示
bitstring(10)
bitstring(-10)
bitstring(10.0)
bitstring(0x10)

#0x表示十六进制数,0b表示二进制数,0o表示八进制数
0x10
0b10
0o10
# 使用parse()函数将字符串转换为整型
parse(Int,"123")
parse(UInt,"123")
parse(Int,"0x123")

#我们可以使用typeof()函数查看变量的类型
typeof(123) #整型
typeof(123.0) #浮点数
typeof(123//1) #有理数
typeof(123+1im) #复数
typeof(123.0+1.0im) #复数
typeof('a') #字符
typeof("abc") #字符串
typeof([1,2,3]) #数组
typeof((1,2,3)) #元组
typeof([1,2,3]=>[4,5,6]) #字典
typeof(1:10) #区间
typeof(1:2:10) #区间
typeof(1.0:2.0:10.0) #区间
typeof(0x14) #十六进制整型
typeof(0b1010) #二进制整型
typeof(0o12) #八进制整型

#将变量bign绑定到一个大整数
bign=3000000000000000000000
typeof(bign) #查看bign的类型,发现超出了Int64的范围，所以最终将类型放大到Int128

#类型强制限定
#我们可以使用类型强制限定来限定变量的类型，这样可以提高代码的可读性和可维护性。
#例如，我们可以使用::Int来限定变量的类型为整型，这样可以避免变量类型的不确定性。
x2 = Int32(123)
typeof(x2)

#符号转换
#我们可以使用unsigned()函数将有符号整型转换为无符号整型，也可以使用signed()函数将无符号整型转换为有符号整型。
x3 = UInt32(123)
typeof(x3)
x4 = signed(x3)
typeof(x4)
x5 = Int32(-123)
typeof(x5)
x6 = unsigned(x5)
typeof(x6)

