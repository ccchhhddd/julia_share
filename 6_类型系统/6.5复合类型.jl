#复合类型是Julia中可具有成员字段的复合结构，为开发者提供了自定义类型的机制，是Julia面向对象编程的基础。
#复合类型的声明使用关键字struct
# [mutable] struct  类型名
#     成员字段1::类型1
#     成员字段2::类型2
#     #其他成员字段
# end
#mutable是可选的标识符，不用时意味着该struct一旦实例化，成员取值将不能再进行变更；使用时则说明该struct可变，即成员取值可以进行变更。

mutable struct fooB
    x::Int
    y::Int
end
#成员也可以是复合类型
struct fooA
    z::fooB
end
mutable struct food
    q::fooA
end

#对于声明过的类型，我们可以通过内置的dump()函数查看其内部结构
dump(fooA)
#我们也可以通过一个专门函数fieldnames()来查看一个类型的所有字段
fieldnames(fooA)
fieldnames(fooB)

#6.5.2 默认构造函数
#在声明复合类型后，对其实例化的最简单做法是采用如下的形式：
类型名(成员值1,成员值2,......)
fooB(1,2)

#6.5.3 成员访问及不可变性
a =fooB(1,2)
a.x
#struct的结构标识符mutable控制着本层的不可变性，不会涉及内层或外层，即不可变性不会在上下层之间传播

#6.4.5单例复合类型
#没有任何成员字段的不可变复合类型会成为单例，即以其为基础创建的任意对象实际都是一样的
struct No1
end
struct No2
end
No1() === No1() #true
No1() === No2() #false

#值得注意的是被mutable关键字修饰的空字段的可变复合类型是不会成为单例类型的
mutable struct Yes1
end
mutable struct Yes2
end
Yes1() === Yes1() #false
Yes1() == Yes1() #false