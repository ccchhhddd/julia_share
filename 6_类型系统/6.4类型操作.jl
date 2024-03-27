#6.4.1  弱类型机制
#在Julia这种弱类型机制中，变量无须先声明即可随时使用，而且不强制进行类型的限定。
#对于变量，如果希望其与值的绑定关系稳定，可以在定义时使用关键字const在定义时将其标识为常量。
const mye = 2.21
const mypi = 3.22
typeof(mye)


#6.4.2  类型断言
#在Julia中，类型断言是指在变量赋值时，明确指定变量的类型。这种类型断言的目的是为了提高代码的可读性和可维护性。
#在开发过程中可通过操作符::对值的类型进行“断言”
1::Int64
1::Float64 #会报错
#在断言之前我们也可以通过isa()函数来判断某个值是否属于某个类型
#第一个参数是第二个参数的子类型，isa()函数返回true
isa(1,Int64)

#6.4.3  DataType
#在Julia中，DataType是一种特殊的类型，用于表示其他类型的类型。在Julia中，每个值都有一个对应的DataType，可以通过typeof()函数来获取。
#Datatype是Julia中包括元类型、抽象类型以及复合类型等所有类型的“类型”。


#6.4.4  类型别称
#在Julia中，类型本身也可以作为右操作数，赋值给某个变量
MyInt = Integer
MyInt(1)
MyInt(1.1) #会报错
UInt
#例如无论是怎样的系统，都希望UInt都是有效的类型，而且能自动适配系统的位数
if Int === Int64
    const UInt = UInt64
else
    const UInt = UInt32
end

#6.4.5 继承关系
#在实践中，我们可以使用<:作为操作符判断一个类型是否是另外一个的子类型
Int64 <: Integer
Int64 <: Real
Number <: Real
#Any的类型是DataType，而DataType因为也是一种类型，所以也是Any的子类型
DataType <: Any
#同时，类型与其自身是满足继承关系断言的，即与自身有父子关系
Int64 <: Int64

