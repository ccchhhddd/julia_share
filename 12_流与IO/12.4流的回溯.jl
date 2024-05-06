#Julia中提供了丰富的以游标为基础的操作。
"""
eof() 测试IO流是否结束，判断文件是否到达尾部
seekstart() 直接跳到起始位置
seekend() 跳到流的结束位置
seek() 直接跳到某个位置
skip() 忽律头部若干位置直接移动到某处
position() 返回当前游标位置
mark() 标记当前游标位置
reset() 重置游标位置
ismarked() 判断是否有标记
unmark() 取消标记
"""


buff = IOBuffer("hello")

read(buff,3)

position(buff) #3

eof(buff) #false

buff.ptr #4

ismarked(buff)

mark(buff) #3

ismarked(buff) #true

read(buff,5)

position(buff) #5

reset(buff) #3

position(buff) #3

