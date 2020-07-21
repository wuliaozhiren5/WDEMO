//
//  RRDebugUtilService.h
//  PUClient
//
//  Created by Lee Jack on 2018/9/18.
//  Copyright © 2018年 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DebugUtilService : NSObject
+ (float)cpu_usage;
+ (float)memoryUsage;
@end
