#对于任意类型、数量的操作数，可以通过promote()函数将它们转为共同的类型。
promote(1, 1.0)
typeof(ans)
#定义这样一种方法
promote_rule(::Type{Float64}, ::Type{Float32}) = Float64
promote(1.0, 1.0f0)
typeof(ans)