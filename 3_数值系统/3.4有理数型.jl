# 有理数Rational
# 分子//分母 Rational限定了分子、分母必须是整型的一种
2//3
typeof(ans)
Int64(2)//Int32(3)
typeof(ans)
5//25
5//0
#Rational类型和浮点数类型之间可以相互转换
Float64(2//3)
Rational(1.5)
#如果要获得Rational对象的分子、分母可以通过numerator()函数和denominator()函数实现
numerator(2//3)
denominator(2//3)

