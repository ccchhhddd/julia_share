#异常触发
#Julia中内置定义了很多错误类型，均继承自抽象类型Exception。对于预定义的错误类型，可以通过throw()函数显示地抛出，以上报该处代码发生的问题。
f(x) = x>0 ? x : throw(DomainError("x必须大于0"))
f(1)
f(-1)

#若无须对错误的类型进行后续处理，而仅需对错误进行提示，则可直接通过@error宏上报
fussy_sqrt(x) =x >=0 ? sqrt(x) : @error "x不能为负数"
fussy_sqrt(2)
fussy_sqrt(-2)

# 与@error类似的还有@info,@warn,@debug等宏，分别用于输出信息、警告、调试信息
@info "这是一条信息"
@warn "这是一条警告"    
@debug "这是一条调试信息"

#异常捕获
#Julia中提供了try-catch-finally-end结构用于捕获异常
#在异常捕捉的结构中，除了try和end关键字外，catch和finally两者也必须至少提供一个
try
    log(-10)
catch ex
    tuprintln("发生了一个异常：",ex)
finally
    println("这里是finally块")
end

except_test(x) = try
    if 1 == x
        log(-10)
    else
        x[2]
    end
catch ex
    if isa(ex,DomainError)
        println("发生了一个DomainError异常")
    elseif isa(ex,BoundsError)
        println("发生了一个BoundsError异常")
    else
        println("发生了一个未知异常")
    end
end

except_test(1)
except_test(0)

#在异常处理的语法结构中，无论try块中是否发生异常，还是catch代码块是否恰当地处理了异常，finally块中的代码都会被执行   