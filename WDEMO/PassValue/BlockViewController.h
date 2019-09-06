//
//  BlockViewController.h
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

//写法1
//typedef void(^ButtonClickBlock)(void);
typedef void(^ButtonClickBlock)(NSString *);

NS_ASSUME_NONNULL_BEGIN

@interface BlockViewController : UIViewController

//写法1
@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;

//写法2
@property(nonatomic,copy) void (^valueBlcok)(void);

@end

NS_ASSUME_NONNULL_END
