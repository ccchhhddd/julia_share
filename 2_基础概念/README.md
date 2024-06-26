# 小结

## 2.1  静态语言、动态语言
动态语言也成为脚本语言，在程序编写完成后，不需要预先编译，在运行期实时地解析并逐条执行。

## 2.2  内存管理
系统内存分为以下几个区域：
寄存器（Registers）、栈（Stack）、堆（Heap）、静态（Static）区、常量（Constant）区

除了上述这些内存区，还有扩展存储空间，例如磁盘、固态硬盘、U盘等，在需要时，可以使用应用程序对这些非RAM存储介质中的内容进行存取操作，但效率不及内存，所以是IO（Input/Output，输入输出）操作最为耗时的部分。

垃圾回收（GC）————在该机制支持下，堆中对象的分配与释放并不需要开发者显示地操作，而由系统自动执行。

## 2.3  经典编程范式
### 1.面向过程编程
线性处理过程，任何程序都可以使用顺序、选择、循环三个基本结构进行控制，并可以通过函数的形式对步骤进行局部封装与调用，所以也被称为结构化程序设计。
例如：C语言
### 2.面向对象编程
这种思想在于对业务逻辑中的主体有了更多、更高层次的抽象。在面向对象的实施过程中，需先将各种动作或过程进行梳理、综合，抽象出各种交互主体并建立相应的一套事物模型（对象）
例如：C++，Java,中出现了常见的类、对象、封装、继承、多态等基础设施或概念。

多态：任何独立存在的事物都有其独特性，在同属抽象类的子类中，相同的动作会需要不同的控制参数，也需要不同的具体实现，在实际执行时，虽然通过同一个动作名（函数名）执行相应的操作，但却能够有不同的表现。
### 3.泛型编程
泛型编程将常用的、统一的处理过程抽象出来，并能够适用于不同的类型，不但能最大限度地实现代码复用，而且逻辑的集中也为开发和维护带来了巨大的好处。
例如：Julia语言极大程度地借鉴了泛型编程的优点。

### 4.函数式编程
Lisp是典型的函数式语言
函数作为对象，也称为闭包或仿函数、函子，除了可被调用外，还可以赋值、作为参数与返回值，甚至是传递转移。
“一切皆对象”是Julia最为吸引人的特色之一。

