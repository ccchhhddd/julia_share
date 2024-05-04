import Dates
#周期类型period主要分为两类，即表达日期的DatePeriod和表达时间的TimePeriod。
#Dateperiod:year,month,week,day
#TimePeriod:hour,minute,second,millisecond,microsecond,nanosecond
#时间类型TimeType主要分为三类，即表达日期的Date、表达时间的Time和表达日期时间的DateTime

dump(Dates.DatePeriod)

dump(Dates.TimePeriod)

dump(Dates.UTInstant)


#DateTime类型本身并不处理时区问题。可选用Julia的TimeZones包来处理时区问题。