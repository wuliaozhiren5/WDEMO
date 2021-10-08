#iOS 线程安全之@synchronized的用法
https://www.cnblogs.com/jukaiit/p/5570056.html

iOS 线程安全之@synchronized的用法

@synchronized(self)的用法：
@synchronized 的作用是创建一个互斥锁，保证此时没有其它线程对self对象进行修改。这个是objective-c的一个锁定令牌，防止self对象在同一时间内被其它线程访问，起到线程的保护作用。

```
●互斥锁使用格式
@synchronized(锁对象) { //需要锁定的代码}
注意:锁定1份代码只用1把锁，用多把锁是无效的
互斥锁的优缺点
p优点:能有效防止因多线程抢夺资源造成的数据安全问题
p缺点:需要消耗大量的CPU资源
。互斥锁的使用前提:多条线程抢夺同一块资源
相关专业术语:线程同步
p线程同步的意思是:多条线程在同一-条线.上执行(按顺序地执行任务)
p互斥锁，就是使用了线程同步技术
```
例如：一个电影院，有3个售票员。一场电影的总数量固定。3个售票员售票时，要判断是非还有余票。

```
#import "ViewController.h"

@interface ViewController ()
/** 售票员01 */
@property (nonatomic, strong) NSThread *thread01;
/** 售票员02 */
@property (nonatomic, strong) NSThread *thread02;
/** 售票员03 */
@property (nonatomic, strong) NSThread *thread03;

/** 票的总数 */
@property (nonatomic, assign) NSInteger ticketCount;

/** 锁对象 */
//@property (nonatomic, strong) NSObject *locker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.locker = [[NSObject alloc] init];
    
    self.ticketCount = 100;
    
    self.thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread01.name = @"售票员01";
    
    self.thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread02.name = @"售票员02";
    
    self.thread03 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread03.name = @"售票员03";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
}

- (void)saleTicket
{
    while (1) {
        @synchronized(self) {
            // 先取出总数
            NSInteger count = self.ticketCount;
            if (count > 0) {
                self.ticketCount = count - 1;
                NSLog(@"%@卖了一张票，还剩下%zd张", [NSThread currentThread].name, self.ticketCount);
            } else {
                NSLog(@"票已经卖完了");
                break;
            }
        }
    }
}

@end
```

iOS锁系列-@synchronized(self)
https://www.jianshu.com/p/434e008fc09c
https://www.cnblogs.com/iOSJason/p/5139883.html

@synchronized 是递归锁，类似NSRecursiveLock,递归调用不会引起死锁，而NSLock是非递归锁。
 

假设我们正在用 Objective-C 实现一个线程安全的队列，我们一开始可能会这么干：
```
@implementation ThreadSafeQueue
{
    NSMutableArray *_elements;
    NSLock *_lock;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _elements = [NSMutableArray array];
        _lock = [[NSLock alloc] init];
    }
    return self;
}
- (void)push:(id)element
{
    [_lock lock];
    [_elements addObject:element];
    [_lock unlock];
}
@end
```
上面的 ThreadSafeQueue 类有个 init 方法，它初始化了一个 _elements 数组和一个 NSLock 实例。这个类还有个 push: 方法，它先获取锁、然后向数组中插入元素、最终释放锁。可能会有许多线程同时调用 push: 方法，但是 [_elements addObject:element] 这行代码在任何时候将只会在一个线程上运行。步骤如下：

线程 A 调用 push: 方法

线程 B 调用 push: 方法

线程 B 调用 [_lock lock] - 因为当前没有其他线程持有锁，线程 B 获得了锁

线程 A 调用 [_lock lock]，但是锁已经被线程 B 占了所以方法调用并没有返回-这会暂停线程 A 的执行

线程 B 向 _elements 添加元素后调用 [_lock unlock]。当这些发生时，线程 A 的 [_lock lock] 方法返回，并继续将自己的元素插入 _elements。

我们可以用 @synchronized 结构更简要地实现这些：
```
@implementation ThreadSafeQueue
{
    NSMutableArray *_elements;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _elements = [NSMutableArray array];
    }
    return self;
}
- (void)increment
{
    @synchronized (self) {
        [_elements addObject:element];
    }
}
@end
```
在前面的例子中，”synchronized block” 与 [_lock lock] 和 [_lock unlock] 效果相同。你可以把它当成是锁住 self，仿佛 self 就是个 NSLock。锁在左括号 { 后面的任何代码运行之前被获取到，在右括号 } 后面的任何代码运行之前被释放掉。这爽就爽在妈妈再也不用担心我忘记调用 unlock 了！

你可以给任何 Objective-C 对象上加个 @synchronized。那么我们也可以在上面的例子中用 @synchronized(_elements) 来替代 @synchronized(self)，效果是相同的。
