using Sockets,Serialization
# server = listen(2000)

sockc = listen(2000)


# #获取某个域名的IP地址
# getaddrinfo("www.baidu.com")

# connect("www.baidu.com", 80)

# #当某个客户端connect()成功后，服务端便可以通过accept()函数接受该次连接
# socks =accept(server)

# write(sockc,"client's message\n")



#一个比较全面的简单服务端代码
begin
    server = listen(2000)
    while true
        socks = accept(server)
        println("new connection")
        while isopen(socks)
            data = deserialize(socks)
            println("Read: ",data)
            serialize(socks, data)
        end
    end
end




