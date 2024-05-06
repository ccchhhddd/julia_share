#在程序处理中往往需要定义各种类型以便进行不同层次的数据转换，而在此之前通常需要从流中加载数据到预先定义的结构中，转化完成后又通常需要输出到流中，即传输出去。这就涉及常用类型与字节流之间的变换。


#在模块Serialization中提供了一些函数用于将常用类型转换为字节流，以及将字节流转换为常用类型。
#serialize() 和 deserialize() 函数用于将常用类型转换为字节流，以及将字节流转换为常用类型。

s = "hello World"

sbuff = IOBuffer()

sbuff.data

using Serialization
#序列化
serialize(sbuff, s)
dump(sbuff)

sbuff.data
#反序列化
deserialize(sbuff) 