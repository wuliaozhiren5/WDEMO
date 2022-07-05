//
//  UITextField+NLLimit.h
//  WDEMO
//
//  Created by aimeiju on 2022/7/4.
//  Copyright © 2022 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (NLLimit)

@property (assign, nonatomic) NSUInteger nl_maxLength;

@end

NS_ASSUME_NONNULL_END
