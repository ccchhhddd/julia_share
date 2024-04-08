#用in()判断其是否在该数集中存在
s=[1,2,3,4]
in(1,s) #true

#有序定位
a=[1;2;2;3;4;4;5]
searchsorted(a,2) #2:3
searchsortedfirst(a,2) #2
searchsortedlast(a,3) #4

#极值定位
findmax(a) #最大值为5 ，索引值为7
findmin(a) #最大值为1 ，索引值为1

findmax([1,7,7,NaN])
findmin([7,1,1,NaN])
findmax(filter(!isnan,[1,7,7,NaN]))

#findall()函数提供了自定义的接口
s =(1,1,2,3,2,4,1)
findall(in(1),s)
