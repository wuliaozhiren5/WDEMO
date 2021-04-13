//
//  RRSeasonSeniorCommentsInputBar.h
//  PUClient
//
//  Created by rrtv on 2021/3/24.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRSeasonSeniorCommentsInputBar : UIView
@property (nonatomic, strong)UIImageView *iconImageView;
//@property (nonatomic, strong)UIImageView *textBtnLeftImageView;
@property (nonatomic, strong)UIButton *textBoxBtn;
@property (nonatomic, strong)UILabel *textBoxLab;
- (void)setupViews;
@end

NS_ASSUME_NONNULL_END



