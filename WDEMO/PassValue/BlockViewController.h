//
//  BlockViewController.h
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//写法1
//typedef void(^ButtonClickBlock)(void);
typedef void(^ButtonClickBlock)(NSString * _Nonnull str);//不可以为空
//typedef void(^ButtonClickBlock)(NSString * _Nullable str);//可以为空

@interface BlockViewController : UIViewController

//写法1
@property (nonatomic, copy) ButtonClickBlock buttonClickBlock;

//写法2
@property(nonatomic,copy) void (^valueBlcok)(void);


//- (void)startWithCompletionBlock:(void (^)(JsonModel *result, NSError *error))block; 
- (void)startWithCompletionBlock:(void (^)(id result, NSError *error))block;

@end

NS_ASSUME_NONNULL_END
