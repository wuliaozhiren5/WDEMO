//
//  CJAppUncaughtExceptionHandler.m
//  WDEMO
//
//  Created by Sun on 2020/7/17.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "CJAppUncaughtExceptionHandler.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>
//未捕获的异常处理器信号异常的名字
NSString * const UncaughtExceptionHandlerSignalExceptionName    = @"UncaughtExceptionHandlerSignalExceptionName";
//异常处理程序信号保存到字典的key
NSString * const UncaughtExceptionHandlerSignalKey              = @"UncaughtExceptionHandlerSignalKey";
NSString * const UncaughtExceptionHandlerAddressesKey           = @"UncaughtExceptionHandlerAddressesKey";
//当前处理异常个数
volatile int32_t UncaughtExceptionCount                         = 0;
//最大能够处理的异常个数
const int32_t    UncaughtExceptionMaximum                       = 10;
//这两个预留的,暂时用不到
const NSInteger  UncaughtExceptionHandlerSkipAddressCount       = 4;
const NSInteger  UncaughtExceptionHandlerReportAddressCount     = 5;

void InstallUncaughtExceptionHandler(void);


@implementation CJAppUncaughtExceptionHandler

NSUncaughtExceptionHandler* _uncaughtExceptionHandler = nil;

//暴露在.h中,在AppDelegate中调用,保证在程序开始运行就具有获取崩溃信息的功能
+ (void)InstallUncaughtExceptionHandler
{
    InstallUncaughtExceptionHandler();
}

//创建异常对象调用
+ (NSString* )getAppInfo
{
    NSString *appInfo = [NSString stringWithFormat:@"App : %@ %@(%@)\nDevice : %@\nOS Version : %@ %@\n",
                         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"],
                         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"],
                         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"],
                         [UIDevice currentDevice].model,
                         [UIDevice currentDevice].systemName,
                         [UIDevice currentDevice].systemVersion
                         ];
    return appInfo;
}

//ExceptionSignalHandler()会调用
+ (NSArray *)backtrace
{
    //定义一个指针数组
    void* callstack[128];
    //该函数用于获取当前线程的调用堆栈,获取的信息将会被存放在callstack中。
    //参数128用来指定callstack中可以保存多少个void* 元素。
    //函数返回值是实际获取的指针个数,最大不超过128大小在callstack中的指针实际是从堆栈中获取的返回地址,每一个堆栈框架有一个返回地址。
    int frames = backtrace(callstack, 128);
    //backtrace_symbols将从backtrace函数获取的信息转化为一个字符串数组.
    //参数callstack应该是从backtrace函数获取的数组指针,frames是该数组中的元素个数(backtrace的返回值)
    //函数返回值是一个指向字符串数组的指针,它的大小同callstack相同.每个字符串包含了一个相对于callstack中对应元素的可打印信息.
    char **strs = backtrace_symbols(callstack, frames);
    
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    
    for (int i=0;i<frames;i++)
    {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    //注意释放
    free(strs);
    return backtrace;
}

//由InstallUncaughtExceptionHandler()调用
+ (void)InstallUncaughtExceptionHandlerB
{
    //获取崩溃统计的函数指针
    _uncaughtExceptionHandler = NSGetUncaughtExceptionHandler();
    
    //利用 NSSetUncaughtExceptionHandler，当程序异常退出的时候，可以先进行处理，然后做一些自定义的动作
    //其实控制台输出的日志信息就是NSException产生的，一旦程序抛出异常，程序就会崩溃，控制台就会有崩溃日志
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

//异常截获处理方法
void UncaughtExceptionHandler(NSException *exception)
{
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    // 出现异常的原因
    NSString *reason = [exception reason];
    // 异常名称
    NSString *name = [exception name];
    //在沙盒的Documents目录下创建文件保存//也可以上传到服务器或者发送邮件之类的
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:name,@"exception_name",
                         reason,@"exception_reason",
                         stackArray,@"stack_info", nil];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *fileName = [path stringByAppendingPathComponent:@"crash.plist"];
    [dic writeToFile:fileName atomically:YES];
}

@end


//捕获信号后的回调函数,由InstallUncaughtExceptionHandler()调用
void ExceptionSignalHandler(int signalval)
{
    int32_t exceptionCount = OSAtomicIncrement32(&UncaughtExceptionCount);
    //如果太多不用处理
    if (exceptionCount > UncaughtExceptionMaximum)
    {
        return;
    }
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:signalval]
                                                                       forKey:UncaughtExceptionHandlerSignalKey];
    
    //此方法获取的栈信息太少
    NSArray *callStack = [CJAppUncaughtExceptionHandler backtrace];
    
    [userInfo setObject:callStack forKey:UncaughtExceptionHandlerAddressesKey];
    
    //创建一个oc异常对象
    NSString *appInfo = [CJAppUncaughtExceptionHandler getAppInfo];
    
    NSString *exceptionReason = [NSString stringWithFormat:@"Signal %d was raised.\n"@"%@", signalval, appInfo];
    
    NSException *exception = [NSException exceptionWithName:UncaughtExceptionHandlerSignalExceptionName
                                                     reason:exceptionReason
                                                   userInfo:userInfo];
    
    //在沙盒的Documents目录下创建文件保存//也可以上传到服务器或者发送邮件之类的
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         exception,@"exception",
                         userInfo,@"stack_info", nil];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *fileName = [path stringByAppendingPathComponent:@"crash.plist"];
    [dic writeToFile:fileName atomically:YES];
    
    
    //取消异常捕获，在应用退出或者销毁的时候设置，只需调用此函数，参数为NULL
    NSSetUncaughtExceptionHandler(NULL);
    //signal函数中的信号处理函数handler，可以是用户指定的一个信号处理函数，也可以是内核特定的函数指针SIG_IGN或SIG_DFL。
    //若信号句柄是SIG_IGN或SIG_DFL，则分别表示对捕获的信号采取忽略操作或者默认操作。
    //其实对于大多数信号的系统默认动作是终止该进程。这与不写此处理函数是一样的。
    signal(SIGHUP, SIG_DFL);
    signal(SIGINT, SIG_DFL);
    signal(SIGQUIT,SIG_DFL);
    signal(SIGABRT, SIG_DFL);
    signal(SIGILL, SIG_DFL);
    signal(SIGSEGV, SIG_DFL);
    signal(SIGFPE, SIG_DFL);
    signal(SIGBUS, SIG_DFL);
    signal(SIGPIPE, SIG_DFL);
    
    //对异常对象处理(最后一步)
    if ([[exception name] isEqual:UncaughtExceptionHandlerSignalExceptionName])
    {
        //kill()可以用来送参数sig 指定的信号给参数pid 指定的进程。
        //getpid()用来取得目前进程的进程识别码
        //第二个参数sig即SIGHUP之类的信号
        kill(getpid(), [[[exception userInfo] objectForKey:UncaughtExceptionHandlerSignalKey] intValue]);
    }
    else
    {
        //抛出异常,不做处理
        [exception raise];
    }
}

//注册崩溃拦截
void InstallUncaughtExceptionHandler()
{
    [CJAppUncaughtExceptionHandler InstallUncaughtExceptionHandlerB];
    //signal信号函数，第一个参数表示需要处理的信号值，第二个参数为处理函数
    //由挂起导致的终止信号
    signal(SIGHUP, ExceptionSignalHandler);
    //由中断导致的终止信号
    signal(SIGINT, ExceptionSignalHandler);
    //由退出导致的终止信号
    signal(SIGQUIT, ExceptionSignalHandler);
    //注册程序由于abort()函数调用发生的程序终止信号
    signal(SIGABRT, ExceptionSignalHandler);
    //注册程序由于非法指令产生的程序终止信号
    signal(SIGILL, ExceptionSignalHandler);
    //注册程序由于无效内存的引用导致的程序终止信号
    signal(SIGSEGV, ExceptionSignalHandler);
    //注册程序由于浮点数异常导致的程序终止信号
    signal(SIGFPE, ExceptionSignalHandler);
    //注册程序由于内存地址未对齐导致的程序终止信号
    signal(SIGBUS, ExceptionSignalHandler);
    //程序通过端口发送消息失败导致的程序终止信号
    signal(SIGPIPE, ExceptionSignalHandler);
}
