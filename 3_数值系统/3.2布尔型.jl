#布尔型是专门用于描述真假这两种逻辑情况的特殊类型。在Julia中，布尔型有两个值，分别是true和false。
bitstring(true)
bitstring(false)

#原理上我们可以将true转为整型1，false转为整型0
Int(true)
Int(false)
#反之，我们也可以将整型1转为布尔型true，整型0转为布尔型false
Bool(1)
Bool(0)
#在Julia中，布尔型是整型的子类型，所以我们可以将布尔型当作整型来使用。
#例如，我们可以对布尔型进行加法、减法、乘法、除法等运算。
true + false
true - false
true * false
true / false
#但不能将整型当布尔型使用，因为它们在设计上机制和使用约束上有着许多差异。

