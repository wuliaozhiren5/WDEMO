//
//  SettingModuleHandler.m
//  WDEMO
//
//  Created by rrtv on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "SettingModuleHandler.h"
@interface SettingModuleHandler ()

@end

@implementation SettingModuleHandler

- (instancetype)init {
    self = [super init];
    if (self) {
        _setting = [[SettingModule alloc]init];
        _setting.delegate = self;
    }
    return self;
}

@end
