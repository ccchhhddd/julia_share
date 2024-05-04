# TimeType =====> 字符串

#将TimeType类型转为字符串，可使用Dates.format()函数实现

Dates.format(now(), "yyyy-mm-dd HH:MM:SS")



#字符串 =====> TimeType（字符串中提取时间/日期，并创建TimeType对象）
#需要了解的是，在julia中并没有提供字符串解析为Time对象的功能，但可以通过DateTime类型进行中转，即先将字符串解析为DateTime对象，再转为Time对象。

dt1 = Date("2015-01-01","y-m-d") # 2015-01-01
typeof(dt1)

dt2 = DateTime("2015-01-01T09:05:05","y-m-dTH:M:S") # 2015-01-01T09:05:05

dt3 = Date("2015年3月13日","y年m月d日") # 2015-03-13

#需要注意的是，将字符串转为指定日期/时间格式并生成对象时，会有一些性能损耗。为此，最好能预先利用DateFormat结构对描述格式化方法的字符串内容进行封装，Julia会在此基础上提供优化能力。

# DateFormat对象的创建有两种方式
# 1.将格式字符串作为参数调用其构造方法
# 2.直接在某字符串前以dateformat为前缀标识

DateFormat("y-m-d")
dateformat"y-m-d HH:MM:SS"

df = DateFormat("y-m-d")
dt = Date("2015-01-01",df) # 2015-01-01

df = dateformat"y-m-d HH:MM:SS"
dt = DateTime("2015-01-01 9:05:05",df) # 2015-01-01T09:05:05


#至于为何选择DateFormat方式而不是字符串方式提供解析格式的描述信息，可以通过大规模循环的例子对比两种方式的差异

@time for i = 1:10^5
            Date("2015-01-01",dateformat"y-m-d")
end #  0.003969 seconds


@time for i = 1:10^5
    Date("2015-01-01","y-m-d")
end #   0.366930 seconds 