//
//  IsEqualViewController.h
//  WDEMO
//
//  Created by rrtv on 2020/8/11.
//  Copyright © 2020 wwc. All rights reserved.
//


//判断对象是否相等的方法,==与 isEqual
//https://www.jianshu.com/p/ba07b644cfba
/*
== 比较两个对象的内存地址

isEqualToString: 比较两个字符串的内容

isEqual: 默认情况下是比较两个对象的内存地址，但是有一些系统自带的类(比如Foundation中的NSString,NSArray等)重写了这个方法，改变了这个方法的判断规则(一般改为比较两个对象的内容，不是内存地址)

数组NSArray中的containsObject:,indexOfObject:方法就是利用isEqual来比较的,所以数组中的字符串内容一样,也会被认为是一样的

作者：苹果API搬运工
链接：https://www.jianshu.com/p/ba07b644cfba
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IsEqualViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
