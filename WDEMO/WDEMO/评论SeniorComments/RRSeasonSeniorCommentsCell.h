//
//  RRSeasonSeniorCommentsCell.h
//  PUClient
//
//  Created by rrtv on 2021/3/25.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
//一级评论cell
NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsCell : UITableViewCell

//剧透
@property (nonatomic, strong) UIView *firstView;//剧透
@property (nonatomic, strong) UILabel *firstLab;//剧透

//内容
//@property (nonatomic, strong) UILabel *contentLab; //内容
@property (nonatomic, strong) YYLabel *yyContentLab;//内容

@property (nonatomic, assign) BOOL isShowMore;    //是否显示更多数据 默认NO

- (void)setupViews;

@end

NS_ASSUME_NONNULL_END



 
 
