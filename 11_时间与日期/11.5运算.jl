import Dates
#11.5.1早晚比较

d1 = Date(2024,5,4)
d2 = Date(2024,5,5)

d1 <d2 #true

dump( d1)
dump( d2)
d1.instant.periods.value # 737850

#Time类型之间是可以比较的
t1 = Time(14,28,37,12,800,970)
t2 = Time(14,28,37,12,800,910)

t1 < t2 #false
dump(t1)

#Time对象不能与Date或DateTime对象进行比较   
t1 < d1 #报错 

#11.5.2时长计算

d1 -d2  # -1 day
typeof(ans) #Dates.Day

DateTime(2024,5,4,9,5,5,253) - DateTime(2024,5,4,9,5,4,253) # 1 second 

typeof(ans) #Millisecond

Dates.Time(9,5,5) - Dates.Time(9,5,4) # 1000000000 nanoseconds

typeof(ans) #Nanosecond

#计算时长的运算不像上述的大小比较运算（可以跨Date与DateTime类型），只能在同一类型的对象之间进行
#但可以与Period类型的对象进行运算
Date(2024,5,4) -Day(2)+Month(3) - Year(1) # 2023-08-02
#period类型本身的意义便表达了某周期精度下的时间跨度，本质上是一种数值，不像TimeType三个类型那样表达的是具体的时间点，有着严格的物理意义。

Year(2024) - Year(2023) # 1 year

typeof(ans) #Year

Day(10)/Day(3)

#11.5.3 时间序列

dr1 = Date(2024,2,26):Day(1):Date(2024,5,4)

for d in dr1
    println(d)
end

#中间的时间步长参数是必需的，同时，在步长的设置中，可以选用Period中的任意一个子类型对象作为参数
dr2 = Date(2024,2,26):Month(1):Date(2024,5,4)
collect(dr2)



#11.5.4属性
d = Date(2024,5,4)
monthname(d) #May
dayname(d) #Saturday
dayofweek(d) #6
dayofyear(d) #125

istuesday = x ->dayofweek(x) ==Tuesday
tonext(istuesday,d) #寻找这个日期后的第一个星期二
toprev(istuesday,d) #寻找这个日期前的第一个星期二

