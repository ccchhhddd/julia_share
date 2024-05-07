#模块
# 模块是Julia特有的组织结构，不同的模块构成了相互隔离的变量工作区，所以创建一个模块同时会引入一个新的全局域（Global Scope）,成为一个独立的名字空间。此时在新的模块内，能够创建顶层级别的声明或定义，不必担心会与其他模块中的名字冲突。

#1.基本定义
# moudle 模块名
#     #模块内容
# end

#举例
module MyModule

using Libz
using BigLib: thing1, thing2

import Base.show
export MyType, foo #导出以供外部使用

struct MyType
    x
end

bar(x) = 2x

foo(a::MyType) = bar(a.x) +1

show(io::IO, a::MyType) = print(io, "MyType $(a.x)")

end


#还有一点需要说明，无论用哪种方式引入了其他模块的名字，该名字便出现在当前模块的名字空间内，所以不能再重复使用。
#在引入名字的过程中，有两类名字比较特别：
#一种是只有符号的名字，例如运算符+，不能使用Base.+的方式，而要采用Base.:+这种Symbol的方式表达；如果运算符不仅有一个字符，则需要使用圆括号进行限定，例如==需要使用Base.:(==)表达。
#另外一种是宏，名字中有@标识符，在引入时也需要带着标识符，例如import Mod.@mac


#2.标准模块
#Julia内置了三个标准模块：Core、Base和Main



#Core 模块包括了Julia语言内置的所有标识符、运算符、类型及其最基本的操作函数，是Julia的核心部分
#Base 模块是julia的标准库，因为大部分情况都被使用，所以新建的模块也会隐式地引入该模块。
#Main 模块仅是一个默认的最高层命名空间，内部除了自动引入Core和Base模块外，初识时没有其他定义或声明内容。

a =10;

b =x->x*2

varinfo()

# name                    size summary                            
# –––––––––––––––– ––––––––––– –––––––––––––––––––––––––––––––––––
# Base                         Module                             
# Core                         Module                             
# InteractiveUtils 535.976 KiB Module                             
# Main                         Module                             
# a                    8 bytes Int64                              
# ans                  0 bytes #3 (generic function with 1 method)
# b                    0 bytes #3 (generic function with 1 method)



#如果在定义模块的时候，不希望隐式地引入Base等，可以采用baremodule定义新的模块
baremodule Mod

end

varinfo(Mod)
# name    size summary
# –––– ––––––– –––––––
# Mod  0 bytes Module 

#3.模块路径

#一种是使用绝对路径，在引入时罗列出模块的整个嵌套路径，例如import Parent.Second.Utils
#另一种是使用相对路径，即在引入时省略前面的模块名，例如:
module Parent
    module Second
        module Utils
    end
    using. Utils
end
#其他声明
end
#. 代表当前路径，若要寻找上一级中寻找可以 using ..Parent 

#4.预编译
默认情况下，Julia会在模块被首次加载时进行自动的预编译，这相当在模块所处文件的顶部增加了一个特别的语句，即__precompile__()，这样可以提高模块的加载速度。
而生成的预编译版本模块会被存储于Base.LOAD_CACHE_PATH指定的目录下。
除此之外，也可以在REPL中手动调用precompile函数来进行预编译，例如Base.compilecache(modulename)

