//
//  CJAppUncaughtExceptionHandler.h
//  WDEMO
//
//  Created by Sun on 2020/7/17.
//  Copyright © 2020 wwc. All rights reserved.
//


//https://www.jianshu.com/p/ea1381c29941

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJAppUncaughtExceptionHandler : NSObject

+ (void)InstallUncaughtExceptionHandler;

@end

NS_ASSUME_NONNULL_END
