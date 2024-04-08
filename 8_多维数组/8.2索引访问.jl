#Julia数组中两个非常重要的特点
#1. Julia数组的第一个元素的索引值不是从0开始，而是从1开始
#2. Julia数组是列优先存储的，即列优先存储顺序

#1.笛卡尔索引
b=rand(2,3)
b[1,2] #第一行第二列的元素

#2.end操作
c =[1 0 2;3 0 5] 
c[1,end] #第一行最后一个元素

#3.赋值修改
c[1,2]=4
c

#4. CartesianIndex类型
#对于维度很高的数组，比如10维、20维度甚至更高维，要以数值罗列的方式给出索引的下标值，不方便。我们需要对索引进行更多灵活的操作，为此，Julia提供了CartesianIndex类型。
d =rand(3,4,1,2)
d[2,3,1,2]
i = CartesianIndex(2,3,1,2)
d[i]

#5.线性索引
A = reshape(1:12, 3, 4)
A[8] #第五个元素
lastindex(A) #最大线性索引值
lastindex(A,1) #行索引最大值（即有多少行）
lastindex(A,2) #列索引最大值（即有多少列）

#6.索引转换
# 新版Julia中不支持两种索引的混合使用
#但是通过LinearIndices()和CartesianIndices()两个函数对其进行转换
B = reshape(10:21, 3, 4)
bli = LinearIndices(B)
bli[2,3]
B[2,3] == B[8]
B[2,3] == B[bli[2,3]]
bci = CartesianIndices(B)
bci[8]
B[CartesianIndex(2, 3)] ==B[8] #true

#7.结构转换
#我们可以通过vec()函数或[:]表达式将多维数组转为线性结构（列向量）而且只是引用操作
p = [1 2 3;4 5 6]
q = vec(p)
q[3] =10
p
#同时，我们可以使用更为强大的reshape()函数,将输入数组的结构调整为需要的维度和阶数
m = reshape(p,3,2)
n = reshape(p,3,:)
