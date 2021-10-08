//
//  RRSeasonSeniorCommentsReplyTableView.h
//  PUClient
//
//  Created by rrtv on 2021/4/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeniorCommentsModel.h"

//一级评论cell的回复列表
NS_ASSUME_NONNULL_BEGIN
@protocol RRSeasonSeniorCommentsReplyTableViewDelegate <NSObject>
@optional
//点击cell
- (void)seasonSeniorCommentsReplyTableView:(nullable UITableView *)tableView
                   didSelectRowAtIndexPath:(nullable NSIndexPath *)indexPath;
//                            didSelectModel:(nullable RRSeniorCommentsModel *)model;
@end

@interface RRSeasonSeniorCommentsReplyTableView : UITableView
@property (nonatomic, strong) RRSeniorCommentsModel *model; 
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL isHalf;          //半屏
@property (nonatomic, weak) id<RRSeasonSeniorCommentsReplyTableViewDelegate> tableViewDelegate;
@end

//一级评论cell的回复列表cell
@interface RRSeasonSeniorCommentsReplyTableViewCell : UITableViewCell
@property (nonatomic, strong)RRSeniorCommentsModel *model;
@property (nonatomic, assign) BOOL isHalf;          //半屏
+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model; 
@end

NS_ASSUME_NONNULL_END
