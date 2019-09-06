//
//  DelegateViewController.h
//  WDEMO
//
//  Created by longzhu on 2019/9/5.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol valueDelegate <NSObject>

//@require
//@optional

-(void)delegateChangevValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DelegateViewController : UIViewController

@property(nonatomic,assign) id<valueDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
