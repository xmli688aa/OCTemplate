//
//  面试题2.h
//  OCTemplateDemo
//
//  Created by zwz on 2023/9/14.
//  Copyright © 2023 zhao. All rights reserved.
//

#ifndef ___2_h
#define ___2_h
第一部分底层必问题：

1.什么情况使用 weak 关键字，相比 assign 有什么不同
在 ARC 中，在有可能出现循环引用的时候，往往要通过让其中一端使用 weak 来解决，比如:
delegate、block，自身已经对它进行一次强引用，没有必要再强引用一次，此时也会使用 weak。
eak 不会产生野指针问题。因为weak修饰的对象释放后（引用计数器值为0），指针会自动被置nil，之后再向该对象发消息也不会崩溃。 weak是安全的。
assign如果修饰基本数据类型如int,float,struct等值类型则是安全的。如果修饰对象，会产生野指针问题；修饰的对象释放后，指针不会自动被置空，此时向对象发消息会崩溃。

2.深拷贝与浅拷贝.
    浅拷贝主要是对指针的拷贝，拷贝后两个指针指向同一个内存空间，
    深拷贝不但对指针进行拷贝，并对指针指向的内容进行拷贝，经过深拷贝后的指针是指向两个不同地址的指针。

3.简要说一下@autoreleasePool的数据结构？
    自动释放池的主要底层数据结构是：AtAutoreleasePool、AutoreleasePoolPage
    调用了autorelease的对象最终都是通过AutoreleasePoolPage对象来管理的
    AutoreleasePoolPage对象通过双向链表的形式连接在一起每张链表头尾相接，有parent、child指针，
    调用push方法会将一个POOL_BOUNDARY入栈，并且返回其存放的内存地址
    调用pop方法时传入一个POOL_BOUNDARY的内存地址，会从最后一个入栈的对象开始发送release消息，直到遇到这个POOL_BOUNDARY
    id *next指向了下一个能存放autorelease对象地址的区域

4.说一下autoreleasePool的实现原理
    1.自动释放池的本质是一个AutoreleasePoolPage结构体对象，是一个栈结构存储的页，每一个AutoreleasePoolPage都是以双向链表的形式连接
    2.自动释放池的压栈和出栈主要是通过结构体的构造函数和析构函数调用底层的objc_autoreleasePoolPush和objc_autoreleasePoolPop，
        实际上是调用AutoreleasePoolPage的push和pop两个方法
    3.每次调用push操作其实就是创建一个新的AutoreleasePoolPage，而AutoreleasePoolPage的具体操作就是插入一个POOL_BOUNDARY，
        并返回插入POOL_BOUNDARY的内存地址。而push内部调用autoreleaseFast方法处理，主要有以下三种情况
    当page存在，且不满时，调用add方法将对象添加至page的next指针处，并next递增
    当page存在，且已满时，调用autoreleaseFullPage初始化一个新的page，然后调用add方法将对象添加至page栈中
    当page不存在时，调用autoreleaseNoPage创建一个hotPage，然后调用add方法将对象添加至page栈中
    4.当执行pop操作时，会传入一个值，这个值就是push操作的返回值，即POOL_BOUNDARY的内存地址token。
    所以pop内部的实现就是根据token找到哨兵对象所处的page中，然后使用 objc_release释放token之前的对象，并把next指针到正确位置

5.说一下iOS内存分区情况
    栈区：局部变量，函数参数（形式参数），自动分配内存，当局部变量的作用域执行完毕之后就会被系统立即回收，由编译器分配和自动释放，函数执行完后，局部变量和形参占用的空间会自动被释放。效率比较高，但是分配的容量很有限。
    堆区：程序代码new出的对象，动态分配内存，alloc出来的对象需要程序员自己进行内存管理
    全局静态区：全局变量和静态变量，编译时由系统分配内存空间，iOS中以0x1开头，运行过程中一直存在，程序结束后由系统释放
    常量区：存放常量：整型、浮点型、字符型、字符串等，编译时由系统分配内存空间，运行过程中一直存在，程序结束后由系统释放
    代码段：程序二进制代码，程序结束的时候系统会自动回收储存在代码段中的数据，内存区域较小

6.如何解决循环引用？
情况一：delegate
    Delegate是ios中开发中最常遇到的循环引用，一般在声明delegate的时候都要使用弱引用weak或者assign
情况二：Block
    Block也是比较常见的循环引用问题，在Block中使用了self容易出现循环引用，
    一般的做法是加入里面有用到self的操作都会声明一个__weak来修饰self，不是所有的都需要声明，只有self拥有Block的强引用才需要
    当然不一定要Self对Block有直接的引用才会出现，假如self的变量B，B中有个Block变量，就容易出现这种情况，
情况三：定时器
    NSTimer会对target产生强引用，如果target又对它们产生强引用，那么就会引发循环引用
    1.NSTimer使用block的形式创建
    2.使用代理对象NSProxy，代理对象作为定时器的target，
        创建代理对象的时候将控制器传过去，成为代理对象的属性，用weak修饰，不强持有控制器，
        然后代理对象内部使用runtime消息转发的形式，让控制器去实现定时器的方法

7.Runloop 和线程的关系？
    7.1 runloop与线程是一一对应的，一个runloop对应一个核心的线程
    7.2 RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
    7.3 线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
    7.4 RunLoop会在线程结束时销毁
    7.5 主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop

8.runloop内部是如何实现的:
    8.1、有一个判断循环的条件，满足条件，就一直循环
    8.2、线程得到唤醒事件被唤醒，事件处理完毕以后，回到睡眠状态，等待下次唤醒

9.runloop的mode作用是什么?:
    1.model 主要是用来指定事件在运行循环中的优先级的，分为：
    * NSDefaultRunLoopMode（kCFRunLoopDefaultMode）：默认，空闲状态
    * UITrackingRunLoopMode                       ：ScrollView滑动时
    * UIInitializationRunLoopMode                 ：启动时
    * NSRunLoopCommonModes（kCFRunLoopCommonModes）：Mode集合
    2.苹果公开提供的 Mode有两个：
        1. NSDefaultRunLoopMode（kCFRunLoopDefaultMode）
        2. NSRunLoopCommonModes（kCFRunLoopCommonModes）

10.isa指针的理解，对象的isa指针指向哪里？
    isa：是一个Class 类型的指针.
    实例对象的isa指向类对象；
    类对象的isa指向元类对象。
    元类对象的isa指向基类的元类对象；

11.OC的类信息存放在哪里？
    对象方法、属性、成员变量、协议信息，存放在class对象中
    类方法，存放在meta-class对象中
    成员变量的具体值，存放在instance对象

12.runtime如何实现weak属性
    weak是一种非拥有关系,属性所值对象销毁时,属性值会情况(nil).
    Runtime维护了一个weak表，用于存储指向某个对象的所有weak指针，weak表实际是hash表，key是指对象的地址，value是weak指针的地址
    当对象引用计数器为0时会dealloc,假如weak指向的对象内存地址为a,那么就会以a为键,在这个weak表中搜索,找到以a为键的weak对象,从二设置为nil.


13.load和initialize的区别
    1.调用方式
        1> load是根据函数地址直接调用
        2> initialize是通过objc_msgSend调用
    2.调用时刻
        1> load是runtime加载类、分类的时候调用（只会调用1次）
        2> initialize是类第一次接收到消息的时候调用，每一个类只会initialize一次（父类的initialize方法可能会被调用多次）
    load、initialize的调用顺序？
        1.load
            1> 先调用类的load
                a) 先编译的类，优先调用load
                b) 调用子类的load之前，会先调用父类的load
            2> 再调用分类的load
                a) 先编译的分类，优先调用load
        2.initialize
            1> 先初始化父类
            2> 再初始化子类（可能最终调用的是父类的initialize方法）






#endif /* ___2_h */
