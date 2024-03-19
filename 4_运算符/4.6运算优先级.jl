#Julia操作符优先级
#对于任意的操作符，可以通过内置的Base.operator_precedence()函数来查看其优先级
#Base.operator_precedence(:操作符)
Base.operator_precedence(:+)
Base.operator_precedence(:-)
Base.operator_precedence(:+=)
Base.operator_precedence(:(=))