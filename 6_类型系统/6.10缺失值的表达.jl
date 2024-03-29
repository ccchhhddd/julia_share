#6.10.1 missing
#在数理统计、数据挖掘、机器学习等需要大规模数据的应用场景中，经常会出现缺失值（理论上应该存在，但观测数据没有实际的值）Julia提供了专门的Missing类型用于表达这种数据，而missing是该类型仅有的单例对象。类似于R语言中的NA值，或SQL中的NULL值。

missing
missing == missing #missing
missing === missing #true
missing < missing #missing
isequal(missing,missing) #true

#在Julia的数值系统中，missing值被处理为比任意类型的数值都大
isless(1,missing) #true
isless(missing,Inf) #false
isless(missing,missing) #false

#缺失性的传递
false |missing #missing
true | missing #true
false & missing #false
true & missing #missing


#6.10.2 nothing
#在Julia中有一个Nothing类型，用于表示什么都没有，即不需要在内存中表达的一类事物。而常量noting是该类型的唯一实例。
nothing

#6.10.3 可有可无的表达 Union{T,Nothing}
#something()函数，返回参数表中第一个不是nothing的值
something(nothing,1)
something(1,2)
something(nothing,missing)
something(nothing,nothing) #报错


#除此之外Nullables.jl包还提供了一种更加灵活的处理缺失值的方法，即使用Nullable{T}类型。这种类型的对象可以是T类型的值，也可以是nothing值。这种类型的对象可以通过isnull()函数判断是否为nothing值，通过get()函数获取其值。
using Nullables
Nullable{Int64}()
struct MyType 
x
y
end
Nullable{MyType}()
a = MyType(1,12)
isnull(a) #false
b= Nullable(1)
get(b)
c=Nullable()
isnull(c)
get(c,5) #5 为空取5
get(b,3) #1 不为空取实际值，忽略默认值

# 参数化类型Nullable虽然可在数据处理层面提供一种安全机制，但不能表达语法意义上的无效情况。