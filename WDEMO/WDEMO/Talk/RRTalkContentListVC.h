//
//  RRTalkContentListVC.h
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRParentClassScrollViewController.h"
#import "RRTalkContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkContentListVC : RRParentClassScrollViewController
//话题id
@property (nonatomic, copy) NSString *talkId;
//hot--最热排序  new--最新排序
@property (nonatomic, copy) NSString *orderType;
 
- (void)createTalkContentModel:(RRTalkContentModel *)model;

@end

NS_ASSUME_NONNULL_END
