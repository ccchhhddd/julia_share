#7.3.1 Function类型
function addtwo(a,b)
    a+b
end
isa(addtwo,Function) #true

#7.3.2 函数作为参数
function g(f::Function,a,b)
    f(a,b)
end
g(addtwo,2,3) #5
g(-,3,2)


#7.3.3 函数作为返回值
function f()
    addtwo
end
f()(1,2) #调用addtwo函数

#实际上函数在定义时便会生成函数对象，可见，函数内部是可以再次定义一个函数的
function getfunc()
    function addthree(a,b,c)
        a+b+c        
    end
end
add3 = getfunc()
add3(1,2,3) #6