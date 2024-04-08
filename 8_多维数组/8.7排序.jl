#Julia中提供了三种常见算法，包括快速排序（QuickSort）、插入排序(InsrtionSort)以及归并排序(MergeSort)
sort([3,1,2])
sort([2,-3,-1],by=abs,rev=true,alg=MergeSort)

#对于复合类型，我们可以通过自定义的比较函数实现对sort方法的扩展。
mutable struct Person
    age::Int64
end
lessthan(a::Person,b::Person) =a.age <b.age
ps= [Person(21),Person(30),Person(91),Person(37)]
sort(ps,lt=lessthan)

#同时，我们在排序之前,我们可以通过函数判断一个数组向量是否已经有序
issorted([1,2,3]) #true
issorted([3,2,1]) #false
issorted([3,2,1],rev= true) #true
#是否按照Tuple的第一个元素排序
issorted([(1,"b"),(2,"a")],by = x->x[1])
