#Expr类型是能够对构造对象进行求值操作的

#构造
b = :(1+2)
typeof(b)
# 查看内部结构
dump(b) 
#调用函数进行计算
eval(b) #3

y1=Expr(:call, :+, 1, 2)
eval(y1) #3

#Expr类型可视为一种特别的字符结构，有点类似字符串，但不是字符串。
#Expr =====> 字符串
string(:(a = (1+2)*3))
typeof(ans)

#字符串 =====> Expr
Meta.parse("a = (1+2)*3")
typeof(ans)

#复合语句转为Expr类型,可以使用quote与end关键字
y2 = quote
    a = 1
    b = 2
    a + b
end
typeof(y2) #Expr
dump(y2)


#衍生
#Expr对象除了能够单独运行，还可以作为函数的参数，甚至是返回值
function derive(op,op1,op2)
    expr = Expr(:call,op,op1,op2)
end

ex1 = derive(:+,:(1),Expr(:call,:*,2,3))
eval(ex1) #7

#以Expr类型将反复使用的代码片段或者需要灵活组装的执行过程进行封装，能够让程序具备神奇的代码衍生能力，可以对一些计算过程复制转移、赋值比较或递归生成，实现各种巧妙的元程序设计。
