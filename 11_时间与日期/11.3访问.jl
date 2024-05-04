#作为TimeType类型的对象，从Date类型、DateTime类型和Time类型对象中均可提取各周期的值
d=Date(2024,5,4)
year(d) #2024
month(d) #5
day(d) #4



#如果要获得Period类型的周期值对象，可使用相应函数的首字母大写版
d = Date(2024,5,4)
Year(d)
typeof(ans)
Month(d)
typeof(ans)
Week(d)
typeof(ans)
Day(d)
typeof(ans)

#为了使用方便，Julia还提供了一些函数，可以同时获得多个周期的组合值
yearmonth(d) #(2024,5)

monthday(d) #(5,4)

yearmonthday(d) #(2024,5,4)

dump(d)

#对于DateTime结构，同样可以方便地对其中的各周期进行访问

dt = DateTime(2024,5,4,9,5,5)

year(dt) #2024
month(dt) #5
day(dt) #4
hour(dt) #9
minute(dt) #5
second(dt) #5

