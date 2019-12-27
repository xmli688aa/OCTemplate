//
//  笔试题1.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/12/27.
//  Copyright (c) Hello  All rights reserves.
//
        

//iOS笔试题1

#pragma mark - 1:Swift的构造器在继承时需要遵循什么规则?请简述构造器的构造过程
/**
 答:规则  1.如果子类没有定义任何的指定构造器, 那么会默认继承所有来自父类的指定构造器.
         2.如果子类提供了所有父类指定构造器的实现, 不管是通过上一条规则继承过来的, 还是通过自定义实现的, 它将自动继承所有父类的便利构造器.
 构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
 Swift 构造函数使用 init() 方法。
 与 Objective-C 中的构造器不同，Swift 的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
 两段式构造过程
 Swift中类的构造过程包含两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性。

 拓展:
 一、两种构造器-指定构造器和便利构造器
 指定构造器：类中必备的构造器，为所有的属性赋初值。(有些子类可能不需要显示声明，因为默认从基类继承了)
 便利构造器：类中的辅助构造器，通过调用指定构造器为属性赋初值。(仅在必要的时候声明)
 举例
 class Food {
     var name: String
     init(name: String) {
         self.name = name
     }
     convenience init() {
         self.init(name: "[Unnamed]")
     }
 }
 便利构造器通过convenience关键字声明，可以看到，便利构造器是通过调用指定构造器来进行构造的。
 */

#pragma mark - 2.说说Swift为什么将String，Array，Dictionary设计成值类型？
/**
 1值类型相比引用类型，最大的优势在于内存使用的高效。值类型在栈上操作，引用类型在堆上操作。栈上的操作仅仅是单个指针的上下移动，而堆上的操作则牵涉到合并、移位、重新链接等。也就是说Swift这样设计，大幅减少了堆上的内存分配和回收的次数。同时copy-on-write又将值传递和复制的开销降到了最低。
 2.String，Array，Dictionary设计成值类型，也是为了线程安全考虑。通过Swift的let设置，使得这些数据达到了真正意义上的“不变”，它也从根本上解决了多线程内存访问和操作的问题。
 3.设计成值类型还可以提升API的灵活度。例如通过实现Collection这样的协议，我们可以遍历String，使得整个开发更加灵活高效。
 */

#pragma mark - 3.在Swift代码中定义了一个Struct类型,能否将该类型变量a的数据保存到UserDefaults中,为什么?
/**
 答:不可以,会崩溃,Attempt to set a non-property-list object,
     UserDefaults只能保存简单的数据对象,本身不支持自定义对象的存储，Struct不能被序列化成NSData对象,如果使用UserDefaults存储,最好使用class
 扩展
 自定义的class对象,支持NSData类型，对象装换成NSData类型再使用USerDefaults保存  自定义对象就要继承NSObject,遵守NSCoding协议,遵守Coding协议encodeWithCoder和initWithCoder 方法
 */

#pragma mark - 4.id, NSObject* 和id<NSObject>的区别
/**
 答:    1. id 与 NSObject *
 (1) 指针指向的范围:id 是 Objective-C 对象，但是并不一定是NSObject对象，并非所有的Foundation/Cocoa对象都是继承于NSObject对象的，比如NSProxy。同时，id与NSObject对象之间有很多的共同方法，比如retain与release等方法。更一步来说：所有的对象本质来说都是 id 类型的。
 (2) 方法调用:对于id来说，你可以调用任意可见的selector，编译器和IDE不会进行类型检查，这个时候就需要你自己进行类型检查并且进行类型转换，来确保这些调用不会出错。而对于NSObject *类型，只能调用NSObject对象所声明的selector，不能调用它子类的selector，编译器会进行检查。
 (3) 对于一些不想或者不能进行类型检查的地方，可以使用id。比如在集合(array, collection)类型中，比如在一些你并不知道方法的返回类型的地方(比如alloc)，比如我们经常声明delegate为id类型，在运行的时候再使用respondToSelector:来进行检查。
 2. id<NSObject>
 使用id<NSObject>来声明一个对象，相当于告诉编译我们并不知道这个对象的类型，但是它实现NSObject protocol。一个这种类型的指针，即可以用来指向NSObject*对象，也可以用来指向NSProxy*对象，因为NSObject对象与NSProxy对象都是现了NSObject protocol。
 */

#pragma mark - 5.如何计算cell中内容出现在屏幕内的单次时长?  (应该是某个cell出现在屏幕内的单次时长)
/**
 答:    通过tableView的代理方法
 1.  - (NSArray*)visibleCells;
 //UITableView的方法，这个最直接，返回一个UITableviewcell的数组。
 对于自定制的cell，之后的处理可能稍微繁琐些。
 2.- (NSArray*)indexPathsForVisibleRows;
 //UITableview的又一个方法，这个比较好用了，返回一个NSIndexPath的数组,可以直接用indexpath.row去调你的table_related_Array里的数据了。比较方便用于自定制的cell。
 3.- (CGRect)rectForRowAtIndexPath:(NSIndexPath*)indexPath;
 CGRect cellR = [myTV rectForRowAtIndexPath:indx];
 if (myTV.contentOffset.y - cellR.origin.y < myCell.frame.size.height || cellR.origin.y - myTV.contentOffset.y >myTV.size.height) {
 //这个时候myCell应该是不在myTV的可视区域了。
 } else {//myCell在可视区域时，业务处理
 }
 //这个方法可以用在代理回调较多的设计中。

 当cell第一次出现时,做个标记,记录当前时间,当cell不在屏幕时,标记一下记录时间,这两个时间间隔就是在屏幕的时长
 */

#pragma mark - 6.自动释放池是什么,如何工作?
/**
 答:    1.什么是自动释放池
 自动释放池(autorelease pool)是OC的一种内存自动回收机制.
 当你向一个对象发送一个autorelease消息的时候,cocoa就会将对象的一个引用放入
 到最新的自动释放池中(当前线程栈顶位置),它任然是一个正当的对象,因此自动释放池
 定义的作用域内的其他对象都可以向他发送消息.
 
 2.如何工作
 objective-C是通过一种”referring counting”(引用计数)的方式管理内存的
 对象在开始分配内存(alloc)的时候引用计数为1,以后如果有copy,retain的时候
 都会加1,每当release和autorelease的时候引用计数就会减1,如果一个对象的引
 用计数为0,就会被系统销毁.
 NSAutoreleasePool 就是用来做引用计数的管理工作的,这个东西一般不用你管的
 autorelease和release没什么区别,只是引用计数减1的时机不同而已.autorelease
 会在对象的使用真正结束的时候才做引用计数减1.

 3.自动释放池的实现原理
 实现原理:自动释放池以栈的形式实现:当你创建一个新的自动释放池时,它将被添加到
 栈顶.当一个对象收到autorelease消息的时候,它被添加到当前线程的处于
 栈顶的的自动释放池中,当自动释放池被回收时,他们就从栈中被删除,并且会
 给池子里面的所有对象都会做一次release操作
 */

#pragma mark - 7.什么时候会报unrecognized selector错误?iOS用哪些机制来避免走到这一步?
/**
 答:什么时候会报unrecognized selector错误？
 当发送消息的时候，我们会根据类里面的methodLists列表去查询我们要动用的SEL,当查询不到的时候，我们会一直沿着父类查询，当最终查询不到的时候我们会报unrecognized selector错误
 当系统查询不到方法的时候，会调用+(BOOL)resolveInstanceMethod:(SEL)sel动态解释的方法来给我一次机会来添加，调用不到的方法。或者我们可以再次使用-(id)forwardingTargetForSelector:(SEL)aSelector重定向的方法来告诉系统，该调用什么方法，一来保证不会崩溃。
 */

#pragma mark - 8.NSCache有何特点?如何利用这些特点?
/**
 答:    NSCache主要用来存储临时数据（键值对），当内存资源不够时，系统会自动释放部分数据。它有三个特点：
 1.NSCache为了保持不占用过多的系统内存，它有多种自动回收内存策略；当系统内存出现不足时，它会回收部分内存使系统正常运转，这种回收是不可控的。
 2.可以在多线程中对NSCache进行访问，同时不需要加锁，因为它是线程安全的。
 3.与NSMutableDictionary不同，NSCache不会copy其内部的键对象。
 由上边的特点看出，NSCache是一个很好的内存缓存类，通过它我们可以实现数据的缓存功能。常见的开源框架中也有NSCache的使用，AFN的图片缓存，SDWebImage等。
 比如在使用大量图片的app中，需要从存储里面读取数据，每次都从文件系统里面读取文件会造成卡顿现象。解决办法就是把NSData对象缓存起来，先从NSCache里面读取数据，然后再从文件系统获取数据，提高效率
 */

#pragma mark - 9.在一个App中间有一个button,在你手触摸屏幕点击后,到这个button收到点击事件,中间发生了什么?
/**
 答:    1.用户触摸屏幕，系统硬件进程会获取到这个点击事件，将事件简单处理封装后存到系统中，由于硬件检测进程和当前App进程是两个进程，所以进程两者之间传递事件用的是端口通信。硬件检测进程会将事件放到APP检测的那个端口。
 2.APP启动主线程RunLoop会注册一个端口事件，来检测触摸事件的发生。当事件到达，系统会唤起当前APP主线程的RunLoop。来源就是App主线程事件，主线程会分析这个事件。
 3.最后，系统判断该次触摸是否导致了一个新的事件, 也就是说是否是第一个手指开始触碰，如果是，系统会先从响应网中 寻找响应链。如果不是，说明该事件是当前正在进行中的事件产生的一个Touch message， 也就是说已经有保存好的响应链
 */

#pragma mark - 10.请描述NSRunLoop的实现机制,以及在多线程如何使用?
/**
 答:NSRunLoop是IOS消息机制的处理模式
 1.NSRunLoop的主要作用：控制NSRunLoop里面线程的执行和休眠，在有事情做的时候使当前NSRunLoop控制的线程工作，没有事情做让当前NSRunLoop的控制的线程休眠。
 2.NSRunLoop 就是一直在循环检测，从线程start到线程end，检测inputsource(如点击，双击等操作)异步事件，检测timesource同步事件，检测到输入源会执行处理函数，首先会产生通知，corefunction向线程添加runloop observers来监听事件，意在监听事件发生时来做处理。
 3.runloopmode是一个集合，包括监听：事件源，定时器，以及需通知的runloop observers
 多线程的使用
 1. 只有在为你的程序创建次线程的时候，才需要运行run loop。对于程序的主线程而言，run loop是关键部分。Cocoa提供了运行主线程run loop的代码同时也会自动运行run loop。IOS程序UIApplication中的run方法在程序正常启动的时候就会启动run loop。如果你使用xcode提供的模板创建的程序，那你永远不需要自己去启动run loop
 2. 在多线程中，你需要判断是否需要run loop。如果需要run loop，那么你要负责配置run loop并启动。你不需要在任何情况下都去启动run loop。比如，你使用线程去处理一个预先定义好的耗时极长的任务时，你就可以毋需启动run loop。Run loop只在你要和线程有交互时才需要
 */

#pragma mark - 11.dispatch_barrier_async的作用是什么?使用时有什么需要注意的地方?
/**
 答:    作用：与并发队列结合，可以高效率的避免数据竞争的问题
 dispatch_barrier_async是等待队列的前面的任务执行完毕后，才执行dispatch_barrier_async的block里面的任务,不会阻塞主线程；
 使用 dispatch_barrier_async ，该函数只能搭配自定义并行队列 dispatch_queue_t 使用。不能使用： dispatch_get_global_queue ，否则 dispatch_barrier_async 的作用会和 dispatch_async 的作用一模一样。
 */

#pragma mark - 12.谈谈你对OC的运行时机制的理解?尽可能多的描述你所知道的运行时特性以及运行时在项目中的应用场景?
/**
 答:    OC的运行时机制：将数据类型的确定由编译时，推迟到运行时。OC的这种运行时机制使对象的类型及对象的属性和方法在运行时才能确定。
 特性:
 1.最主要的是消息机制:
     OC代码，最终都是转成了runtime（c语言库）的C语言实现。类转成了runtime库里面的结构体等数据类型,方法转成了runtime库里面的C语言函数，平时调方法都是转成了objc_msgSend函数（所以说OC有个消息发送机制）
     消息机制原理：对象根据方法编号SEL去映射表查找对应的方法实现。
 2.runtime的多态
     对于C语言，编译完成之后函数的调用关系就已经确定。OC的函数调用成为消息发送。属于动态调用过程。（在编译阶段，OC可以调用任何函数，即使这个函数并未实现，只要申明过就不会报错。）。只有在真正运行的时候才会根据函数的名称找 到对应的函数来调用。

 runtime 常见应用
     动态交换两个方法的实现
     动态添加属性
     实现字典转模型的自动转换(获取对象的成员变量列表，通过KVC设置数据/字典转模型框架)
     发送消息
     动态添加方法
     拦截并替换方法
     实现 NSCoding 的自动归档和解档

 拓展:
     面试：消息机制方法调用流程
         怎么去调用eat方法，对象方法：(保存到类对象的方法列表) ，类方法：(保存到元类(Meta Class)中方法列表)。
         1.OC 在向一个对象发送消息时，runtime 库会根据对象的 isa指针找到该对象对应的类或其父类中查找方法。。
         2.注册方法编号（这里用方法编号的好处，可以快速查找）。
         3.根据方法编号去查找对应方法。
         4.找到只是最终函数实现地址，根据地址去方法区调用对应函数。
         补充：一个objc 对象的 isa 的指针指向什么？有什么作用？
         每一个对象内部都有一个isa指针，这个指针是指向它的真实类型，根据这个指针就能知道将来调用哪个类的方法。
 */

#pragma mark - 13.简单说一下APP的启动过程,从main文件开始说起
/**
 程序启动分为两类:1.有storyboard 2.没有storyboard
 有storyboard情况下:
 1.main函数
 2.UIApplicationMain
 * 创建UIApplication对象
 * 创建UIApplication的delegate对象
 3.根据Info.plist获得最主要storyboard的文件名,加载最主要的storyboard(有storyboard)
 * 创建UIWindow
 * 创建和设置UIWindow的rootViewController
 * 显示窗口

 没有storyboard情况下:
 1.main函数
 2.UIApplicationMain
 * 创建UIApplication对象
 * 创建UIApplication的delegate对象
 3.delegate对象开始处理(监听)系统事件(没有storyboard)
 * 程序启动完毕的时候, 就会调用代理的application:didFinishLaunchingWithOptions:方法
 * 在application:didFinishLaunchingWithOptions:中创建UIWindow
 * 创建和设置UIWindow的rootViewController
 * 显示窗口
 */

#pragma mark - 14.OC中load方法和initialize方法的异同
/**
 +load是根据函数地址调用的，每个类只执行一次，执行时直接调用函数地址
 当父类和子类都实现了load方法，系统会先执行父类load再执行load方法
 当类别实现了load方法，类中的load方法会先执行，再执行类别中的load方法
 当有多个类别(Category)实现load方法时，每个类load 执行顺序与其在Compile Sources出现的顺序一致，系统会根据先编译先调用去执行
 总结执行顺序：[super load] -> [class load] -> [category load]
 ————————————————
 initialize在类或其子类第一次接受到消息时调用。即使类文件被引用到项目中，类没有被使用，initialize不会被使用。由于是系统自动调用的，和load一样也不需要调用[super initialize]，否则父类的initialize会被多次执行。
 1、+initialize方法会在类第一次接收到消息时调用
 2、initialize会先调用父类的initialize再调用子类的
 3、当子类未调用initialize时，会调用父类的initialize，如果子类实现了initialize会覆盖initialize方法
 4、子类未实现initialize时，父类initialize可能会调用多次
 5、当有多个Category都实现了initialize方法,会覆盖类中的方法,只执行一个(会执行Compile Sources 列表中最后一个Category 的initialize方法)
 */
