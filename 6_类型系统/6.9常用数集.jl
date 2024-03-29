#6.9.1 元组
#元组（Tuple）是由多个元素构成的组合结构，且元素的类型及个数都不受限制
(1,2,3)
(1,'2',3.0)
#对于单元素的元素，为避免歧义，一般需要其尾部附加一个逗号
(1,)
typeof(ans)

#元组是协变的，所以如下特性会在多态分发中发挥作用
Tuple{Int32,Int32} <: Tuple{Int32,Real}

#展开
(1,2,(10.5,"abc")...,3)
a= (10.5,"abc")
(1,2,a...,3)
(a...,)
(a...) #,不能少，否则会报错

#元组访问
a[1]
x,y = a
x #10.5
y #"abc"

#命名元组（每个元素能够附加一个名字）
nt1  =(a=1,b=2,c=3.8,d=8//9)
typeof(nt1) #NamedTuple{(:a, :b, :c, :d),Tuple{Int64,Int64,Float64,Rational{Int64}}}
nt1.a #1
nt1.b #2
#在构造命名元组时，自然也可以通过其构造方法创建对象
nt2 = NamedTuple{(:a,:b),Tuple{Int32,Int32}}((1,2))


#6.9.2 键值对
#键值对Pair类型用于建立两个对象的映射/关联性关系，是一种参数化的不可变复合类型，一旦构造不可更新修改。

dump(Pair{1,2})
#Pair{1, 2} <: Any
# first::Union{}
# second::Union{}
#该类型有两个成员，分别是first与second，分别表示键与值
Pair(1,3.2)
a =1=>3.2
typeof(a) #Pair{Int64,Float64}
a.first #1
a.second #3.2
#Pair对象可以转换到元组类型
Tuple(a) #(1, 3.2)


#6.9.3 字典
#字典（Dict）是一种标准的关联型数集，分为键集合与值集合两部分。字典中的元素是无序的，表达的是键集到值集的映射关系（与Pair类同）
Dict{K,V} <: AbstractDict{K,V} #K为键的类型；V为值的类型
Dict(1 =>1.1, 2=>2.2)
function f(x)
    return x^2
end
Dict(i=>f(i) for i in 1:5)

#元组结构转为字典对象
a=(1=>1.1, 2=>2.2)
Dict(a) #Dict{Int64,Float64} with 2 entries:
#数组结构转为字典对象
b=[1=>1.1, 2=>2.2]
Dict(b) #Dict{Int64,Float64} with 2 entries:

#字典的访问
z=Dict(i=>f(i) for i in 1:8)
z[1] #1
z[2] #4
p=Dict("A"=>1, "B"=>2)
p["A"] #1
p["B"] #2

#提取字典中元素直接赋值，键不存在不会报错，而是直接将赋值中的对应关系更新到Dict对象中
p["C"] =3 
#若对应关系已存在，则会改变原有的键值对应关系
p["C"] =5

get(p,"A",1)
#若希望键不存在时将默认值存入Dict中，则可使用get!()函数
get!(p,"D",4)
#如果发现某个键多余，可使用delete!()函数将其删除
delete!(p,"D")
#希望在删除某映射时同时取出，使用pop!()函数
pop!(p,"C")

#可通过length()函数或其成员字段获知Dict中元素的个数
length(p) #2
p.count #2 

#若想要遍历所有的元素，一个直接的方法是通过keys()函数取得其键集合
keys(p) 
for k in keys(p)
    println(k,"'s value is ",p[k])
end
#同时，也可以使用values()函数取得其值集合
values(p)
#如果希望该函数获得的迭代器转为数组使用，对其调用collect()函数即可
collect(values(p))


#6.9.4 集合
#集合（Set）是一种无序的、不重复的元素集合，是一种参数化的不可变复合类型，一旦构造不可更新修改。
a = Set([1,2,3,4,5,6,7,8,9,10])
#通过元组和数组构造，重复元素被忽略
b = Set([1,2,3,4,1,2,3])
c= Set((1,2,2,1))
#无法通过索引的方式对Set进行元素访问，只能以迭代遍历的方式进行访问
for i in b
    println(i)
end
#用in运算符判断元素是否在集合中
1 in b #true

#集合的运算
a = Set([1,2,3,4,5,6,7,8,9,10])
b = Set([1,2,3,4,1,2,3])
#并集
c = a ∪ b
c = union(a,b)
#交集
d = a ∩ b
d = intersect(a,b)
#补集
e = setdiff(a,b)
#集合的包含关系判断
issubset(a,b) #false
issubset(b,a) #true #a包含b
#同时也支持Unicode字符
⊇ #\supseteq+tab
⊆ #\subseteq+tab
⊈ #\nsubseteq+tab
⊉ #\nsupset+tab
b ⊆ a #true

#如果要判断一个集合是否是空集，可以使用isempty()函数
isempty(a) #false
#如果要清除集合中的所有元素，直接使用empty!()函数即可
empty!(a)