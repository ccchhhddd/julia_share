str = "Hello World"
#索引
str[2]

#下面我们来讨论一个索引过程中会出现的非连续性问题及其解决方法（UTF-8变字节问题）
s = "\u2200x\u2203 y" #"∀x∃ y"
s[1]
s[2] #报错
s[4] #'x'
#这是因为UTF-8是可变宽度的编码方式，并不是所有的字符串都采用同样的字节数

#为了应对上述的问题Julia提供了以下函数
nextind(str::AbstractString, i::Integer ,n::Integer=1) -> Int
i1 = nextind(s,0) 
i2 = nextind(s,i1) #以前一个有效索引为参数
i3 = nextind(s,i2)
i4 = nextind(s,i3)
i5 = nextind(s,i4)
i6 = nextind(s,i5) #未越界。继续取下一个有效索引
i6  > lastindex(s) #已经越界

#lastindex函数返回最后一个有效索引
lastindex(s) #最后一个有效索引
s[i1],s[i2],s[i3],s[i4],s[i5] #('∀', 'x', '∃', ' ', 'y')


s = "\u2200x\u2203 y" #"∀x∃ y"
#我们对上述的s 进行遍历
i=1
while true
    println("第 $i 个字符是",s[i])
    i = nextind(s,i)
    if i > lastindex(s)
        break
    end
end
#这里使用到的$标识符，用于表示紧随其后的是一个表达式或者变量名。
#这里补充一下，这里使用$的操作可以认为是一种变量替换。
#正常使用
println("I have $(99+1) in my pokect")
#当作正常的字符使用时，需要加上\进行转义
println("I have \$100 in my pokect")


#对于上述的遍历操作我们也可以使用eachindex()函数进行实现
for i in eachindex(s)
    println( "第 $i 个字符是" ,s[i])
end
#可见eachindex()函数能够正确地自动取每个字符的索引值

