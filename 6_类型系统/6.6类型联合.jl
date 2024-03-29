#Julia中提供了一种可以将多种类型进行“或组合”的方式，即类型联合（Type Unions）基本语法：
# Union{T1,T2,.....}

#例如声明一个内部类型元素为Int64与Float32的类型联合
IntOrFloat64 = Union{Int64,Float64}
Int64 <: IntOrFloat64 #true
Float64 <: IntOrFloat64 #true
