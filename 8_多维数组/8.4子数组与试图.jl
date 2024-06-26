a =reshape(collect(1:12),3,4)
a[2:3,3:4]
#在索引结构中对子部分进行重排
a[2,[2 3;4 1]]
#逻辑索引
a[[true,false,true],2]
a[a.>8]


#局部视图
b = view(a,2:3,3:4)
b[1,1] = 100
b
a
#另外与view()函数类似的还有@view宏
c = @view a[2:3,3:4]

#性能对比
A=rand(10000,10000)
@time A[1000:5000,1000:5000]
@time view(A,1000:5000,1000:5000)
#明显可以得到的结果是，视图方式有着极为明显的优势

#在实践中，如果有必要可以使用parent()函数来获取视图对象的源数组
p = parent(c)
p === a #true