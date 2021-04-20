//
//  RRSeasonSeniorCommentsReplyTableView.h
//  PUClient
//
//  Created by rrtv on 2021/4/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
//一级评论cell的回复列表
NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsReplyTableView : UITableView
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, assign) NSInteger count;
@end


//一级评论cell的回复列表cell
@interface RRSeasonSeniorCommentsReplyTableViewCell : UITableViewCell
@property (nonatomic, strong)id model;
+ (CGFloat)cellHeightWithModel:(id)model;
@end

//@interface RRSeasonSeniorCommentsReplyMoreTableViewCell : UITableViewCell
//@end
NS_ASSUME_NONNULL_END
