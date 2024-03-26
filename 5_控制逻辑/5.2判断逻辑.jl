#Julia中，关键字if、elseif、else和end组成了判断逻辑的主要结构
#条件表达式一定要是能够返回布尔型结果的逻辑运算
if 2>0
    println("2>0")

elseif 2<0  
    println("2<0")
else
    println("2=0")  
end

#在为if或者elseif提供条件表达式时，是不支持将1或0这种整型值直接作为true或false使用的
if 1
    println("1")
end

#三元运算符 a ? b : c  (注意？和：前后都需要有空格)
x=3
x>10 ? println("x>10") : println("x<=10")

#此外这种简单的逻辑判断还可以考虑使用内置的ifelse(）函数
ifelse(x>10,"x>10","x<=10")