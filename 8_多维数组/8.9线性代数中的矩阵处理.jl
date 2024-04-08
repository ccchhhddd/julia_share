#Julia在内置的LinearAlgebra模块中，针对矩阵提供了常见的线性代数运算
A=rand(3,3)
#求迹
tr(A)
#行列式值
det(A)
#求逆
inv(A)
#转置
A'
#特征值
eigvals(A)
#特征向量
eigvecs(A)

A=[1 2 3;4 5 6;7 8 9]
#一些特殊矩阵
using LinearAlgebra
#以上三角部分构造对称矩阵，:U表示上三角方式
al = Symmetric(A,:U)
#单对角及下次角构造双对角矩阵 ，:L表示获得下三角方式
a2 = Bidiagonal(A,:L)

#矩阵分解
A=[1.0 2.0;2.0 50.0]
C= cholesky(A)
C.L* C.U  ==A #true
