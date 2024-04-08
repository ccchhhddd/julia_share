#元素大多为零，甚至为零的元素数量远远大于非零元素数量时，这种数组称为稀疏数组
#针对向量和矩阵，在Julia的SparseArrays模块中以压缩稀疏列的方式提供了稀疏结构的支持，并定义了专门的类型

#我们可以直接使用spzeros()函数或sparse()函数创建稀疏数组
using SparseArrays
spzeros(3)
spzeros(Float64,2,3)

using LinearAlgebra
sparse(I,3,3)
SparseMatrixCSC(I,3,4)

#结构转换
#转为稀疏版
B= [1.0,0.0,1.0]
b =sparse(B)
#反之也可以通过函数collect()将稀疏数组转回常规的稠密结构
C = collect(b)

#判断一个数组是否是稀疏的，可用issparse()函数
issparse(b)

