#Julia位运算符示例
#1.与或非运算
m =Int8(50)
bitstring(m)
#取反
n = ~m
bitstring(n)

a = Int8(10)
b = Int8(-7)
bitstring(a)
bitstring(b)

p = a & b
bitstring(p)
#或
q = a | b
bitstring(q)
#异或
r = a ⊻ b
bitstring(r)

#2.位移运算
m =Int8(50)
bitstring(m)
#左移1位
bitstring(m << 1)
#左移2位
bitstring(m << 2)
#左移3位后取值
m << 3

#变量为负数时，不断右移的结果是-1，这是因为右移的过程中，最高位不断补1
n =Int8(-7)
bitstring(n)
#右移1位
bitstring(n >> 1)
#右移2位
bitstring(n >> 2)
#右移3位
bitstring(n >> 3)
n >> 3

#对于正数来说，不断右移的结果是0,这是因为右移的过程中，最高位不断补0
m =Int8(7)
bitstring(m)
#右移1位
bitstring(m >> 1)
#右移2位
bitstring(m >> 2)
#右移3位
bitstring(m >> 3)
#右移4位
bitstring(m >> 6)   

#值得注意的是，在负数的逻辑右移运算中，最高位不断补0 ; 而负数算术右移运算中，最高位不断补1
t =Int8(-7)
bitstring(t)
#逻辑右移1位
bitstring(t >>> 1)
t >>> 1