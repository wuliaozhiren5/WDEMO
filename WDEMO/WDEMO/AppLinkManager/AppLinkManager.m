//
//  AppLinkManager.m
//  WDEMO
//
//  Created by rrtv on 2022/6/1.
//  Copyright © 2022 wwc. All rights reserved.
//

#import "AppLinkManager.h"

@implementation AppLinkManager

+ (instancetype)sharedManager {
    static AppLinkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AppLinkManager alloc] init];
    });
    return manager;
}

@end
