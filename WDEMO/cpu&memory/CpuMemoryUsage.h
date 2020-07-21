//
//  CpuMemoryUsage.h
//  WDEMO
//
//  Created by rrtv on 2020/7/21.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CpuMemoryUsage : NSObject

+ (float)cpuUsage;
+ (float)memoryUsage;

@end

NS_ASSUME_NONNULL_END

