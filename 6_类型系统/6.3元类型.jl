#所谓“元类型”，是具体类型的一种，不但有明确的二进制内存结构，也是构成其他数据的基础。简单来说，元类型是概念单一、结构纯粹的基本类型，其数据在内存中是连续的位序列。
#所以在Julia中基于关键字primitive type声明一个元类型时，需要给出明确的位数
primitive type 类型名 位数 end
primitive type name <: supertype bits  end

#同抽象类型类似，在声明元类型时也可以同时给出其父类型
primitive type 类型名 <: 超类型名 位数 end
primitive type Float16 <: AbstractFloat 16 end

#在实践中查询某个类型的父类型可使用supertype()函数
supertype(Float16)
supertype(AbstractFloat)
supertype(Real)
supertype(Number)
#也可以使用subtypes()函数查询某个类型的所有子类型
subtypes(AbstractFloat)
subtypes(Real)
subtypes(Number)
