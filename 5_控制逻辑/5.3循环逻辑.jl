#Julia提供了wwhile和for循环两种循环结构的同时，还提供了break和continue两种控制循环的关键字,以便对循环进行控制。

#while循环  
i=1
while true
    println(i,"")
    if i>5
        break
    end
    global i+=1   
end

#关键字break能够强制循环退出，但在多层嵌套的循环中只会影响其所处的那一层
for i=1:3
    for j=1:3
        println(i," ",j)
        if j==3
            break
        end
    end
end

#continue关键字用于跳过当前循环的剩余部分，直接进入下一次循环。类似于break，continue也只会影响所处的那一层循环。
for i=1:3
    for j=1:3
        if j==2
            continue
        end
        println(i," ",j)
    end
end

# for
#Julia中提供了三种基本的遍历表达式方式(这三种表达方式是等价的)
#所谓可迭代数据集，主要是指数组、元组、集合、字典、字符串等数据结构
for 循环变量 = 可迭代数据集
    更多语句
end
for 循环变量 in 可迭代数据集
    更多语句
end
for 循环变量 ∈ 可迭代数据集
    更多语句
end

#在for循环中，还支持同时对多个数据集进行遍历
for (i,j) in [(1,2),(3,4),(5,6)]
    println(i," ",j)
end
#在for循环中，我们同样可以使用break和continue关键字来控制循环的执行
for i=1:3
    for j=1:3
        if j==2
            continue
        end
        println(i," ",j)
    end
end
