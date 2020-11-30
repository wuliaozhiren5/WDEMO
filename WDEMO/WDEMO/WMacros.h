//
//  WMacros.h
//  WDEMO
//
//  Created by xxx on 2017/11/21.
//  Copyright © 2017年 wwc. All rights reserved.
//

//宏定义和宏方法
//http://www.jianshu.com/p/b757a1fefa62

#ifndef WMacros_h
#define WMacros_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size


#define IMAGEPLAYERVIEW_SCALE 8.0f*3.0f      //headerview的宽高比

//在主线程去执行block
#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}



//weakSelf,strongSelf
//__weak __typeof(self) weakSelf = self;
//__strong __typeof(self) strongSelf = weakSelf;
//__strong __typeof(weakSelf) strongSelf = weakSelf;

#define WeakObject(obj) __weak typeof(obj) weakObject = obj;
#define StrongObject(obj) __strong typeof(obj) strongObject = weakObject;
 
#define WeakSelf(obj) __weak typeof(obj) weakSelf = obj;
#define StrongSelf(obj) __strong typeof(obj) strongSelf = weakSelf;

//#define WEAKSELF typeof(self) __weak weakSelf = self;
//#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//用法如下：
//WS(weakself)
//...
//[weakSelf doSomething];

#endif /* WMacros_h */

//#ifdef DEBUG
//#else
//#endif



