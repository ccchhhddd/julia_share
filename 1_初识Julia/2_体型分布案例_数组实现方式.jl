#数组实现方式

#使用均匀分布随机数生成1000个身高样本，取值范围为[0,1)
heights = rand(Float64,1000)

#使用均匀分布随机数生成1000个体重样本，取值范围为[0,1)
weights = rand(Float64,1000)

#将身高数据映射到[1.5,1.8)区间
heights = 1.5 .+  heights.*(1.8-1.5)
#将体重数据映射到[30,100)区间
weights = 30 .+ weights.*(100-30)

#计算BMI指数的函数
# bmi(height,weight) = weight/(height^2)

# indexes =broadcast(bmi,heights,weights)

# indexes = Array{Float64,1}(1000)
# for i in 1:1000
#     indexes[i] = bmi(heights[i],weights[i])
# end
#或利用矢量化运算
indexes = weights ./(heights.^2)

#对BMI指数进行分组
function bmi_category(index::Float64)
    class=0
    if index < 18.5
    class=1
    elseif index < 24
    class=2
    elseif index < 28
    class=3
    elseif index < 30
    class=4
    elseif index < 40
    class=5
    else
    class=6
    end
    return class
end

classes=bmi_category.(indexes)

#统计每个类别的数量
for c in [1 2 3 4 5 6]
    println("类别$c: ",sum(classes.==c))
end
