#先定义一个复合结构类型
mutable struct  Person
    height
    weight
    bmi
    class
end
#再定义一个集合类型
person =Set{Person}()

#使用均匀分布随机数生成1000个体型数据，并放入集合people中
for i in 1:1000
    h = 1.5 + rand()*0.3
    w = 30 + rand()*70
    p =Person(h,w,0,0)
    push!(person,p)
end

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

#然后定义bmi()函数
function bmi(p::Person)
    p.bmi = p.weight/(p.height^2)
    p.class = bmi_category(p.bmi)
end

#对1000个样本进行BMI指数计算,并统计分布情况
categories =Dict()
for p in person
    bmi(p)
    categories[p.class] = get(categories,p.class,0) + 1
end

categories


