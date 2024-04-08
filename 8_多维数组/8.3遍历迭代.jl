a = reshape(collect(1:12), 3, 4)
#索引循环
for i= 1:3,j=1:4
    println(a[i,j])
end
#索引序列
r = CartesianIndices((1:3,1:4))
for i in r
    println(a[i])
end
#线性遍历
for i in 1:lastindex(a)
    println(a[i])
end

for i =1:length(a)
    println(a[i])
end

#元素迭代
for x in a
    println(x)
end
for x =a
    println(x)
end
