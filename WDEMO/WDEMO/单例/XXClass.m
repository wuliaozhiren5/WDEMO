//
//  XXClass.m
//  WDEMO
//
//  Created by rrtv on 2020/11/30.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "XXClass.h"

@implementation XXClass 
//ios--->使用@synchronized和dispatch_once实现单例
//https://www.cnblogs.com/frankltf/p/7929300.html

////@synchronized来实现
//+ (id)sharedInstance {
//    static XXClass *sharedInstance = nil;
//    @synchronized(self) {
//        if (!sharedInstance) {
//            sharedInstance = [[self alloc] init];
//        }
//    }
//    return sharedInstance;
//}

//dispatch_once_t来实现
+ (id)sharedInstance {
    static XXClass *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
