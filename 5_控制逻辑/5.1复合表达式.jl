#Julia中有两种方式构造复合表达式，一种使用begin与end这对关键字
z=begin 
    x=1
    y=2
    x+y
end

#另一种则使用分号将多个子表达式包括起来，以链式的方式构造
begin x=1;y=2;x+y end
