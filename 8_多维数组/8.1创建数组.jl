#Julia中，任何数组类型都是参数化抽象类型AbstractArray{T,N}的子类型。对于所有继承自AbstratArray的类型，都可以通过以下函数取得数组的属性信息。
eltype(A) #数组A中的元素类型
length(A) #数组A中的元素个数
ndims(A) #数组A的维数
size(A) #数组A中各维度的阶数，返回tuple结构
size(A,n) #数组A的第n维度的阶数 

#一维数组可使用Vector类型指代，即向量
Vector
#二维数组可使用Matrix类型指代，即矩阵
Matrix

A = Array{Int64}(undef,2,3)

#8.1.1串联方式
[1 2 3 4 5 6]
[1 2 'n' 4 5 6]
[1 2 3;4 5 6]
[1 2 3;4 5 6;7 8 9]
Int[1 2;3 4; 5 6;]

#如果元素中存在数组对象，Julia会自动将内部的数组展开
[1 2 [3 4] 5 6]
[1;2;[3;4]]

#事实上，通过罗列方式创建数组，等效于内部调用了vcat()函数、hcat()函数和hvcat()函数
vcat(1,2,3,4,5,6) #N阶列向量
hcat(1,2,3,4,5,6) #N阶行向量   
hvcat((2),1,2,3,4,5,6) #2阶矩阵，参数2指定列数

#8.1.2 辅助构造函数
#在创建数组时，可以通过辅助构造函数来指定数组的类型和维度
zeros(Int64,2,3)
ones(Int64,2,3)
trues(2,3)
falses(2,3)
rand(Int64,2,3)
randn(Float64,2,3)


#8.1.3 范围表达式
#可以通过range()函数创建Range对象
range(start;length,stop,step =1)
range(1;length = 4,stop = 10)
for i in 1:2:6
    println(i)
end

#如果Range对象中数据序列的所有元素具有独立的存取空间，可使用collect()函数将Range对象转换为数组
collect(1:2:6)
#有公差或无功差时创建的对象是有所区别的
dump(1:3)
dump(1:2:6)

#8.1.4 推导式
#推导式是Julia提供的另外一种较为常用的创建数组的方式
V=rand(4)
[0.25*V[i-1]+0.5*V[i]+0.25*V[i+1] for i in 2:length(V)-1]
[i*j for i in 1:3,j in 1:3]
[(i,j) for i=1:3 for j=1:i if i+j==4]

#在使用推导式的过程中，如果没有提供方括号，则会创建一个生成器对象。生成器不会预先分配内存并存储元素的值，而是可迭代的结构，只在需要的时候产生数值。
@time sum(1/n^2 for n in 1:1000)
@time sum(1/n^2 for n in 1:100000)
#可以发现内存大小没有明显的变化
