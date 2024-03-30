#7.7.1 外部构造方法
struct FooA
    a
    b::Float64
end
FooA(x::Float64)= FooA(x,x)
FooA(1.0)
methods(FooA)
FooA(m=1.0,n=2.0) = FooA(m,n)

#7.7.2 内部构造方法
struct OrderedPair
    x::Real
    y::Real
    OrderedPair(a)  = new(a,a)

end

struct OrderedPair
    x::Real
    y::Real
    OrderedPair(a,b) = new(b,a)
end
methods(OrderedPair)
struct OrderedPair
    x::Real
    y::Real
    OrderedPair(x::Real,y::Real) = x > y ? error("out of order") : new(x,y)
end


methods(OrderedPair)
OrderedPair(1,2)  #OrderedPair(1, 2)

OrderedPair(2+0im,1+0im)  #OrderedPair(1, 2)

#自定义的内部构造方法同样也会成为其他外部构造方法的基础。在Julia开发中，可以利用内部构造方法这种特性，对内部可用的构造方法进行裁剪，实现对实例创建过程的更加精细化控制。