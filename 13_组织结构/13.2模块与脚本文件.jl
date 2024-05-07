#文件执行
include("xxxxx.jl")

#一个模块中include多个文件
module Foo
include("xxxxx.jl")
include("xxxxx1.jl")
end