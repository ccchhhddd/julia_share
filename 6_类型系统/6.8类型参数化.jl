#6.8.1 参数化复合类型
mutable struct Point1D{T}
    x::T
end

Point1D{Int32}
Point1D{Float64}
#声明的参数化类型其实相当于一个名称相同的类型族
Point1D{Int32} <: Point1D
Point1D{Float64} <: Point1D
#不过“族”中的各具象化类型之间并不存在父子关系，即使它们的类参之间存在父子关系
Point1D{Int32} <: Point1D{Real} #false
Point1D{Float64} <: Point1D{Real} #false
#参数化类型的具象化类型之间也不满足“相等”或“相同”的判断
Point1D{Int32} === Point1D{Int32} #false


#可见在对参数化类型实例化时，可不必先对其具象化，直接提供成员值便可创建出具体的对象，而类参的实际具象类型会自动推断出来
p1 = Point1D{Int32}(1)
p1.x
typeof(p1.x)
p2 = Point1D{Float64}(1.0)
p2.x
typeof(p2.x)


mutable struct Point3D{T1,T2}
    x::T1
    y::T1
    z::T2
end
q1 = Point3D{Int32,Float64}(1,2,3.0)

#我们总结参数化复合类型的特点如下：
#1.复合类型的类参数量不限，视需要而定；
#2.内部成员可沿袭其类参作为限定类型；
#3.通过类参的组合，在成员可取任意类型的情况下，能够限定某些成员必须类型一致。


#6.8.2 参数化抽象类型
#在Julia中，若要定义一个参数化的抽象类型，基本语法：
abstract type 类型名{T1,T2,...} end

mutable struct Point2D{T}
    x::T
    y::T
end
#对其定义求向量模的计算
mymodule(p::Point2D) = sqrt(p.x^2 + p.y^2)
p1 = Point2D(1,2)
mymodule(p1)

#我们需要一种抽象的坐标类型，能够承载任意维度坐标共有的计算操作
#为此定义一个名为Pointy的抽象类型，并进行参数化
abstract type Pointy{T} end

Pointy{Int32} <: Pointy #true
Pointy{1} <: Pointy #true

#对于之前声明过的Point1D、Point2D、Point3D类型，完全可以在声明时作为抽象坐标类型Pointy的子类型
#这里是重新声明
mutable struct Point1D{T} <: Pointy{T}
    x::T
end


mutable struct Point2D{T} <: Pointy{T}
    x::T
    y::T
end

mutable struct Point3D{T} <: Pointy{T}
    x::T
    y::T
    z::T
end
#具象类型是参数化类型的子类型，所以子参数化类型的具象类型均是父参数化类型的子类型
Point1D{Int64}  <: Pointy
#但是父子参数化类型的具象化类型之间仍不存在父子关系
Point1D{Int64} <: Pointy{Real} #false

#如此一来，我们便可以在Pointy上定义一个统一的操作函数，便能适用于三个不同维度的坐标点类型，而不需要更多针对性的重复性函数。
function module_t(p::Pointy)
    m=0
    for field in fieldnames(p)
        m += getfield(p,field)^2
    end
    sqrt(m)
end

module_t(Point1D{Int64}(1))
module_t(Point2D{Int64}(1,2))

#Type{T}
#Type{T}是一个特殊的抽象类型，也是单例类型的一种，可以认为是类型的生成器。从定义层面讲，每个具象的T都是Type{T}的一个实例。
isa(Float64,Type{Float64}) #true
isa(Point2D,Type{Point2D}) #true
#对于不一致的T这种判断不会成立
isa(Float64,Type{Int64}) #false

#如果结构中没有参数T，Type便是一个简单的参数抽象类型；此时，所有的类型都将是它的实例对象
isa(Float64,Type) #true
isa(Point2D,Type) #true


#6.8.3 参数化元类型
#元类型同样可以进行参数化，声明的基本语法为：
primitive type 类型名{T} bits end
primitive type ptr{T} 32 end
primitive type ptr1{T} 64 end
#当T不同时，便是不同的Ptr类型。在实际使用中，我们可以把Ptr{T}看作是一个指向T类型的指针类型。


#6.8.4 参数化基本原理
typeof(Pointy)
dump(Pointy)
#Type{T}的四个主要子类型：DataType、UnionAll、Union、Core.TypeofBottom类型

#我们在声明Pointy2时可直接将这种上下界限定关系明确地表达出来
abstract type Pointy2{Integer <: T <: Real} end
#此时去查看Pointy2的内部结构会发现，这样与直接粗暴地修改其内部结构得到的结果是相同的
dump(Pointy2)
#所以，对于类参范围的限定最好不要通过粗暴修改上下界的方式，而是通过直接声明的方式进行，会好很多。
mutable struct Point3{T1 <: Integer, T2 <: Real}
    x::T1
    y::T2
end

#6.8.5 参数化继承关系
abstract type PointWith{T1 <:Integer, T2 <: AbstractFloat} end
mutable struct PlanePointA{T,V} <: PointWith{T,V}
    x::T
    y::T
    z::V
end
PlanePointA(1,2,1.0)

#T在复合类型中“变小了”，V在复合类型中“变大了”
mutable struct PlanePointC{T <: Signed , V <: Real} <: PointWith{T,V}
    x::T
    y::T
    z::V
end
#虽然成员V的类型被放大了，但父类型的约束仍在起作用
PlanePointC(1,2,1.0) #PlanePointC{Int64, Float64}(1, 2, 1.0)
PlanePointC(1,2,1) #报错

#6.8.6 协变与逆变
#基本用法
类型名{ <: 类参值} #协变
类型名{ >: 类参值} #逆变

abstract type Pointy{T} end
Pointy{<:Integer} #协变
dump(Pointy)

Pointy{T} where {T<:Integer} #协变
dump(Pointy)
#协变时，只有S<:T满足下式中的继承断言才会成立：
参数类型名{S} <: 参数类型名{<:T}
Pointy{Int32} <: Pointy{<:Integer} #true
Pointy{Signed} <: Pointy{<:Integer} #true
Pointy{Real} <: Pointy{<:Integer} #false

#逆变时，只有S>:T满足下式中的继承断言才会成立：
参数类型名{S} <: 参数类型名{>:T}
Pointy{Integer} <: Pointy{>:Int32} #true
Pointy{Integer} <: Pointy{>:Signed} #true

dump(Pointy{Integer}) #Pointy{Integer} <: Any
#可见其已经在类型具象化的过程中“蜕变”成了普通的类型；这也是具象类型间无直接继承关系而成为独立类型的根源。