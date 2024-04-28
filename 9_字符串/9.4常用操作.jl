#1.连接
"""
String([]) 
join()
*

"""
String(['a','b','c']) # "abc"
#也可以使用专门的连接函数join()
join(['a','b','c']) # "abc"
join(['a','b','c'],"-") # "a-b-c"
#使用string()函数
string("abc","def") # "abcdef"
#使用 * 连接
"abc" * "def" # "abcdef"
#使用*结合broadcast()实现连接
broadcast(*,["a","b","c"],["d","e","f"]) # 3-element Array{String,1}:["ad", "be", "cf"]
broadcast(*,"abc","def") # "adefbcef"



#2.比较
"""
<
>
<=
>=
==
!=
isequal()
"""

#3.搜索
"""
findfirst()
findlast()
findnext()
occursin()
"""

#4.替换
"""
replace()
oppercase() #转为大写
"""
s= replace("I have a pen","pen"=>"apple")
println(s) # "I have a apple"
p1 ="hello world"
replace(p1,r"o"=>uppercase)  # "hellO wOrld"

#5.分割
"""
split()
利用正则表达进行分割
"""
p2= "a,b,c,d,e"
split(p2,",") # ["a", "b", "c"]

p3 = " a1b2c3d4"
split(p3,r"\d")