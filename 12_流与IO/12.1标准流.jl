#标准输入流 标准输出流（程序输出信息、系统错误信息）

#Julia定义了三个标准流对象，即stdin、stdout和stderr，分别对应标准输入、标准输出和标准错误。

#1.输入流
write(stdout,"Hello,World!\n")

write(stderr,"Error:Hello,World!\n"); #使用分号屏蔽了返回值

write(stdout,0x61); #a

#2.输出流
read(stdin,Char) #等待输入 

a = readline(stdin) #等待输入 

for line in eachline(stdin)
    println(line)
end

b= read(stdin,4 ) #读取4个字符

#也可以在采用该读取方式将接收到的内容填充到已有的数据区内
x = zeros(UInt8,4)

read!(stdin,x)
abcd
x 
# 4-element Vector{UInt8}:
#  0x61
#  0x62
#  0x63
#  0x64

#如果是不限定数量地持续逐字节地读取，则可采用如下方式:
while !eof(stdin)
    println(read(stdin,Char))
end
#eof()函数用于判断流内是否仍有内容可读