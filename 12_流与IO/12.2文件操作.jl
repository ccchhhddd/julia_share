#与标准流不同的是，文件流并不是常开的状态，能在需要的时候进行关闭和打开
#1.打开操作
# 方法原型
# open(filename::AbstractString[,[read::Bool][write::Bool][create::Bool][truncate::Bool],[append::Bool]]) #返回一个IO对象
# open(filename::AbstractString[,mode::AbstractString]) #返回一个IO对象


f = open("hello.txt") #以默认参数打开一个名为test.txt的文本文件
isopen(f) #true
isreadable(f) #true
isreadonly(f) #true
iswritable(f) #false

# 2.读取操作
readlines(f)
#该函数会将读取的内容按行放入String类型的数组中，空行会对应空字符串。

while !eof(f)
    println(readline(f))
end


#readbytes!()函数在将内容读入时，多出预先分配空间的数据不会被舍弃；如果指定读入及可读入的字节数大于给定数组的大小，该函数会自动放大数组，以容纳足够的内容

data = zeros(UInt8,2)

readbytes!(f,data,3)

data

# 3.写入操作
close(f)

f = open("hello.txt","w+")

write(f,"Hello,World!")

readlines(f)

println(readline(f))

#4.do操作
# open(f::Function, filename[,mode])

open("hello.txt") do f
    while !eof(f)
        println(readline(f))
    end
endq


