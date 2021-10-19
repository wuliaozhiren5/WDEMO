//
//  UserEditBar.h
//  WDEMO
//
//  Created by WDEMO on 2020/12/29.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserEditBar : UIView

@property(nonatomic,copy) void (^selectClick)(BOOL isAll);
@property(nonatomic,copy) void (^deleteClick)(void);

//全选
- (void)isAllSelected:(BOOL)isAll;
//删除个数
- (void)deleteCount:(NSInteger)count;

- (void)reset;

@end

NS_ASSUME_NONNULL_END
