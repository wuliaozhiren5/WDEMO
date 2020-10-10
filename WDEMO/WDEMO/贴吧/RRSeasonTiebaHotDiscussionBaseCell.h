//
//  RRSeasonTiebaHotDiscussionBaseCell.h
//  PUClient
//
//  Created by rrtv on 2020/9/29.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACMacros.h"

NS_ASSUME_NONNULL_BEGIN
@interface RRSeasonTiebaHotDiscussionBaseCell : UITableViewCell

//填充数据
- (void)fillWithData:(id)data;
//计算高度
+ (CGFloat)cellHeightWithModel:(id)model;

@end

@interface RRSeasonTiebaHotDiscussionTextCell : RRSeasonTiebaHotDiscussionBaseCell

@end

@interface RRSeasonTiebaHotDiscussionSinglePictureCell : RRSeasonTiebaHotDiscussionBaseCell

@end

@interface RRSeasonTiebaHotDiscussionThreePictureCell : RRSeasonTiebaHotDiscussionBaseCell

@end
NS_ASSUME_NONNULL_END
