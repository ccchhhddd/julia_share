#如果在双引号或三引号表示的字面值之前加上字符b作为前缀标识符，之后的字符串内容便会被julia解析为字节数组
b"bytes"

s = "bytes"
Array{UInt8,1}(s)