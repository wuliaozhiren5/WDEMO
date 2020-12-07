//
//  SettingModuleHandler.h
//  WDEMO
//
//  Created by rrtv on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingModule.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingModuleHandler : NSObject<SettingModuleDelegate>
@property (nonatomic, strong) SettingModule *setting;
@end

NS_ASSUME_NONNULL_END
