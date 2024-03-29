#1.最底层类型
#如果Union内部无类型元素，即参数为空，Union{}便成了Julia中的另外一种特殊用法，用于表示类型系统中“最底层”的类型，即Union{}是所有类型的子类型。
Union{} <: Int #true
Union{} <: Float64 #true
Union{} <: String #true
typeof(Union{}) #Core.TypeofBottom

#2.类型范围
#TypeVar有三个字段，其中name是·TypeVar的名字，lb是TypeVar的下界，ub是TypeVar的上界。
TypeVar <:Any
   name::Symbol
    lb::Type
    ub::Type

T = TypeVar(:T,Int,Float64)