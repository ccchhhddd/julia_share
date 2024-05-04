#如果要创建一个DateTime对象，则可通过如下构造方法来实现
# DataType(year,[month,day,hour,minute,second,millisecond,microsecond]) -> DateTime

using Dates
DateTime(2024,5,4,9,5,5)

now() #获取当前时间
typeof(now()) #DateTime


DateTime(Hour(9),Minute(5),Second(5)) #通过周期类型构造DateTime对象

#Datetime 与Date对象可以进行相互转换
dt = now()
typeof(dt) #DateTime

d = Date(dt) # 2024-05-04
dt2 = DateTime(d) # 2024-05-04T00:00:00

#在DateTime转为Date类型时，时间部分（小时、分钟、秒）会被丢弃；而在Date转为DateTime类型时，时间部分会被默认为0。

#另外DateTime对象还可以转为Time类型
dt = now()
t = Time(dt) # 09:05:05


#但是julia不支持Time向DateTime的转换
DateTime(t) #报错