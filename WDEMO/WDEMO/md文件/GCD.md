#GCD

iOS GCD之函数与队列
https://www.jianshu.com/p/99e875882492



//主队列 + 全局并发队列的日常使用
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    //执行耗时操作
    dispatch_async(dispatch_get_main_queue(), ^{
        //回到主线程进行UI操作
    });
 });
