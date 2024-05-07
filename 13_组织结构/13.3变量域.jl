#  在变量域方面，Julia采用的是语法域规则，是一种与Bash的动态域不同的静态域。
#作用域、可见域

#Julia中的域大致分为两类——全局域和局部域，而后者又可分为可嵌套及不可嵌套两种

# 全局域：module,baremodule,REPL(Main模块)
# 局部域(可嵌套) for,while,推导式，try-catch-finally,let,函数
# 局部域（不可嵌套）struct,macro


#我们发现begin-end和if-end两个结构并为出现，因为它们不会引入新的域
begin 
    a=1
end

a #1

#还有一个local关键字，可以限定某个变量只能在当前域可见，不会受到外部名称的干扰
local z=0;
for i =1:2
    println(z)
end #ERROR UndefVarError: `z` not defined


#julia中的let关键字是一种特殊的代码块，能够接受以逗号分割的赋值语句或变量名作为参数，并将其中涉及的变量重新分配，同时转为局部变量。
Fs=Vector{Any}(undef,2);i=1;
while i <= 2
    let i = i
        Fs[i] =()->i
    end
    global i += 1
end

Fs[1]() #1
Fs[2]() #2

#但是如果不使用let关键字
while i<=2
    Fs[i] =()->i
    global i += 1
end

Fs[1]() #3
Fs[2]() #3

i+=2
Fs[1]() #5
Fs[2]() #5

#由此可以得出结论，在定义函数Fs[i]=()->i时，i变量名被绑定到了函数的定义中，而不会记录i的值的变化，即不会受到while内部表达式i+=1的影响。


#我们在此基础上进行类推
function f()
    i =0
    for i =1:3
    end
    return i
end;
f() #0

#所以从本质上来说，可以认为，循环体或推导式内部的循环语句是被let结构包围的，在变量域方面与let有着相同的特性。

#如果需要在循环中使用外部变量，并希望能够对其进行修改，则可显式地使用outer关键字对其进行标识。
function p()
    i =0
    for outer i =1:3
    end
    return i
end;
p() #3

