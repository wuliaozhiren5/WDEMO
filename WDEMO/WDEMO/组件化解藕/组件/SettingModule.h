//
//  SettingModule.h
//  WDEMO
//
//  Created by WDEMO on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SettingModuleDelegate <NSObject>
@optional
- (NSString *)userId;
@end

@interface SettingModule : NSObject
@property (nonatomic, weak) id<SettingModuleDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
