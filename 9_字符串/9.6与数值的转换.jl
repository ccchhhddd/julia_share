
#数值====>字符串
string(10) # "10"
string(0b100101) # "37"

#当输入数值是整型时，还可以通过base参数说明数值的数制
string(0x2f, base=16) # "2f"
string(0x2f, base=10) # "47"

#在需要时，通过设定pad参数对输出的字符串进行对齐
string(328,base=8,pad=6) # "000510"


#字符串====>数值
#通过parse(type,str;base=10)函数，可以将字符串转换为数值
"""
type用于指定结果的数据类型
str是待解析的字符串
base用于说明数制(默认为十进制)
"""

parse(Int,"10") # 10
parse(Float64,"3.14") # 3.14
parse(Int,"2f",base=16) # 47