e =:(a+1)
a='A'
eval(e)

a=3
eval(e)

#Julia中的宏(Marco)有着类似于函数的代码结构，可接受参数传入，不过返回的却是Expr对象。换句话说，宏建立了参数组合到某个Expr对象的映射。也正因为其有着传参的结构，所以能够更为准确地对参数进行控制。

#定义
macro 宏名称(参数表)
    #具体实现
end

macro sayhello()
    return :(println("Hello,world!"))
end

macro sayhello(name)
    :(println("Hello,",$name,"!"))
end

#调用
@sayhello("成浩东")

#预定义宏
#1.@show
x=(1,2,3)
@show x
y=[1 2 3]
@show y

#2.@printf和@sprintf
using Printf 
@printf("Hello,%s!\n","world")
@printf "%x %5f money %G"10 3.2 9.76e6

#3.@assert
#断言，如果表达式为false，则抛出异常
@assert 1==1


#4.@time
@time sum(rand(1000000))
@time 1+2
@timev 1+2
@timed 1+2


