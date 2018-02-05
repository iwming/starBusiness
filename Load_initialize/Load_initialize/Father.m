//
//  Father.m
//  Load_initialize
//
//  Created by Mi on 2018/2/2.
//  Copyright © 2018年 iwming. All rights reserved.
//

#import "Father.h"

@implementation Father

/*
 https://developer.apple.com/documentation/objectivec/nsobject/1418815-load?language=occ
 +load
 Invoked whenever a class or category is added to the Objective-C runtime; implement this method to perform class-specific behavior upon loading.
 当class或category被加入到OC运行时时，该方法被唤醒，用来在loading前实现类的特殊行为。
 
 Discussion
 The load message is sent to classes and categories that are both dynamically loaded and statically linked, but only if the newly loaded class or category implements a method that can respond.
 load消息会自动加载链接发送给多个class和多个category，但是只有最新加载的class或者category中实现了该方法才能被响应。
 
 The order of initialization is as follows:
 初始化顺序为：
 All initializers in any framework you link to.
 1、链接的framework中所有的初始化方法
 All +load methods in your image.
 2、在镜像中调用的所有+load方法
 All C++ static initializers and C/C++ __attribute__(constructor) functions in your image.
 3、所有的C++静态初始化方法和C/C++ 属性构造方法
 All initializers in frameworks that link to you.
 4、所有framework中链接的初始化方法
 
 In addition:
 A class’s +load method is called after all of its superclasses’ +load methods.
 class的+load方法在父类load方法后被调用
 
 A category +load method is called after the class’s own +load method.
 category的+load方法在class类的+load调用之后被调用
 
 In a custom implementation of load you can therefore safely message other unrelated classes from the same image, but any load methods implemented by those classes may not have run yet.
 在自定义的实现中，可以安全的向同一个二进制包（image镜像）中其他不相关的类发送消息。但是其他类中方法有可能还没有被调用。
 */


/*
 1、load方法只要被引入就会触发且在main执行之前。
 2、每个类的load函数只会被自动调用一次哦，而且是先调父类的然后是子类的最后是分类的(依次均调)。
 3、多个分类都实现load方法，调用顺序与compile sources出现的顺序一致
 4、多个类的load调用顺序也与compile Source出现的顺序一致
 5、当一个类未实现load方法时,不会调用父类load方法
 */

/*
    应用场景
 +load:常用的用来交换方法
 +initialize:主要用来对一些不方便在编译期初始化的对象进行赋值。对静态变量赋值
 */
+(void)load
{
    NSLog(@"%s",__FUNCTION__);
}
/*
The runtime sends initialize to each class in a program just before the class, or any class that inherits from it, is sent its first message from within the program. Superclasses receive this message before their subclasses.
 
    在class或继承class的类发送第一条消息之前， runtime发送initialize给在程序中每一个class。父类class优先于子类的class收到该消息。
 
 The runtime sends the initialize message to classes in a thread-safe manner. That is, initialize is run by the first thread to send a message to a class, and any other thread that tries to send a message to that class will block until initialize completes.
 
 runtime以线程安全的方式发送initialize消息，因为，initialize运行在第一个class发送消息的线程中，其他线程试图发送消息给该class时会被阻塞直到initialize完成。
 
 The superclass implementation may be called multiple times if subclasses do not implement initialize—the runtime will call the inherited implementation—or if subclasses explicitly call [super initialize]. If you want to protect yourself from being run multiple times, you can structure your implementation along these lines:
 父类实现initialize方法有可能会被多次调用，如果子类没有实现initialize，runtime会调用父类的initialize实现。或者子类通过[super initialize]也会导致多次调用父类实现。
 如果你想增加保护，避免多次被调用，则可以尝试增加一个判断：
 + (void)initialize {
 if (self == [ClassName self]) {
    // ... do the initialization ...
    }
 }
 
 Because initialize is called in a blocking manner, it’s important to limit method implementations to the minimum amount of work necessary possible. Specifically, any code that takes locks that might be required by other classes in their initialize methods is liable to lead to deadlocks. Therefore, you should not rely on initialize for complex initialization, and should instead limit it to straightforward, class local initialization.
 由于initialize方法采用阻塞的方式，所以最大限度的减小产生的影响是非常必要的。
 尤其是，其他的类有可能需要在initialize方法中加锁容易造成死锁。
 因此，你不应该在initialize中实现复杂的初始化逻辑，限制它直接用类自己的初始化方法完成复杂逻辑。
 
 总结：
 1、initialize在类或者子类的第一个方法被调用前调用。但引入没有使用是不调用的。
 2、当子类没有实现initialize时，会默认调父类的initialize，
    所以，子类没有实现，当方法触发时，父类的initialize会被调用2次，第一次为父类优先子类调的 第二次为子类没有实现默认调的。
 3、父类的initialize优先子类执行
 4、分类会覆盖本类的initialize方法（而且只有最后一个加入的分类initialize会被执行），
 依旧是父类、子类 这样的顺序。如有分类相应替换。
 
 */

/*
    应用：
    +load：实现方法交互
    +initialize：通常我们会在这里面对静态变量进行初始化
    需要加个判断保护 self == 【xx class】
    
 
 
 */

+(void)initialize
{
    NSLog(@"%s",__FUNCTION__);
}

@end
