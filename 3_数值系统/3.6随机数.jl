#随机数发生器RNG(Random Number Generator)
#Julia默认的随机发生器是马特赛旋转演算法(Mersenne Twister Library)发生器，它是一种高质量的随机数发生器，能够产生高质量的随机数。

#常见的两种随机数生成方法
#1.均匀分布随机数
#rand()函数可以用来生成0到1之间的均匀分布随机数
rand()

#2.正态分布随机数
#randn()函数可以用来生成均值为0，方差为1的正态分布中的随机数
randn()
