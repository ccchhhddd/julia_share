#数据的流动是转化变换的基础，但硬件架构的不同部件设备在传输与处理速度方面存在着各种差异，使得它们之间需要必要的缓冲区或缓存，以协调各个处理节点间的步调不一致的问题

#Julia中的IOBuffer类型提供了完善的缓冲机制，并能够以多种方式在内存中创建缓存

b = IOBuffer(maxsize = 3) #创建一个最大支持3字节的缓存

b.data

write(b,"abcdef")

b.data

String(b.data) # abc

b.ptr #4

#Julia提供了take!()函数，能在提取缓存内容的同时，重置缓存到初始状态
take!(b)
b.ptr #1


s  = "hello";
buff = IOBuffer(s)
take!(buff)
dump(buff)

#我们发现String对象本身是不可变的，而基于其建立的缓存对象也是只读的。


