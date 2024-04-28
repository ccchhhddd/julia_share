#在Julia中正则表达为Regex类型

a = r"^\s*(?:#|$)"
#下面我们来说一说正则表达式的基本操作——————匹配和提取

#匹配
#所谓匹配，指在某个字符串中查看是否存在一个或多个子串，能够符合正则表达式对象所定义的字符构成模式（Pattern）
#在Julia中，我们可以使用occursin()函数来进行匹配操作



"""
这个正则表达式的含义是匹配以零个或多个空白字符开头，然后紧跟着一个井号（#）或行尾的位置。在正则表达式中：

- `^` 表示匹配字符串的开头。
- `\s*` 表示匹配零个或多个空白字符。
- `(?: ... )` 是非捕获型分组，表示其中的内容作为一个整体进行匹配，但不捕获匹配结果。
- `#` 匹配井号字符。
- `|` 表示或的关系。
- `$` 表示匹配字符串的结尾。

所以这个正则表达式可以用来匹配空白行或者以井号开头的行。
"""
a = r"^\s*(?:#|$)"

occursin(r::Regex, s::AbstractString) -> Bool
occursin(a,"#") #true
occursin(a," ") #true
occursin(a," #") #true

#提取
#提取是将满足正则模式的多个子串内容从原字符串中单独拿出来，并能够给出每个子串的位置
#在Julia中，我们可以使用match()、eachmatch()函数来进行提取操作

money = "I have so much money. The cash is 2300 totally."
rgx = r"cash is (\d+) totally";

result = match(rgx,money)
result.match # "cash is 2300 totally"
result.offset # 27
result.captures # "2300"

#再看一个要求多分组的例子
m= match(r"(a|b)(c)?(d)","hi, acd,ok")
m.match # "acd"
m.offset # 4


