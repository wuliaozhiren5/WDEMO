//
//  RRSeasonSeniorCommentsHearder.h
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsHearder : UIView
//点击状态条件
@property (nonatomic, copy) ClickIndexBlock clickStatusIndex;
//点击开关
@property (nonatomic, copy) ClickIndexBlock clickSwichIndex;
@end

NS_ASSUME_NONNULL_END
