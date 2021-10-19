//
//  RRSeasonSeniorCommentsPraiseBtnInputBar.h
//  PUClient
//
//  Created by WDEMO on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsInputBar.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsPraiseBtnInputBar : RRSeasonSeniorCommentsInputBar

@property (nonatomic, strong) UIButton *praiseBtn;
@property (nonatomic, strong) UILabel  *praiseBtnLab;
@property (nonatomic, strong) RRSeniorCommentsModel *commentModel;

@end

NS_ASSUME_NONNULL_END
