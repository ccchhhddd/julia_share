#匿名函数不需要函数名，只需要提供参数需求及实现体即可
function (参数表)
    #实现体
end

(参数表) -> 复合表达式
(x,y,z) -> x+y+z
x -> x^2
() -> println("Hello,World!")


function g(f,x,y,z)
    f(x,y,z)
end
g((x,y,z) -> x+y+z,1,2,3) #6
#Julia提供了do代码块的语法，能够在调用时以独立的结构实现匿名函数，基本表述方式
调用函数名(实参表) do 匿名函数参变量表
    #实现体
end
g(2,3,4) do x,y,z
    x+y+z
end