//
//  RRDramaCommentScoreView.h
//  NJVideo
//
//  Created by WDEMO on 2021/8/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRStarScoreView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRDramaCommentScoreView : UIView

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UILabel *recommendLab;//推荐语是根据用户评分生成（10分：力荐、8分：推荐、6分：还行、4分：较差、2分：很差）
@property (nonatomic, strong) UILabel *scoreLab;//评分（10分：力荐、8分：推荐、6分：还行、4分：较差、2分：很差）
@property (nonatomic, strong) RRStarScoreView *starScoreView;//星级（10分：5星、8分：4星、6分：3星、4分：2星、2分：1星）

@property (nonatomic, assign) CGFloat score;

@end

NS_ASSUME_NONNULL_END
