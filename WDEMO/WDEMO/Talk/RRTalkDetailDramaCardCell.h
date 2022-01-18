//
//  RRTalkDetailDramaCardCell.h
//  PPVideo
//
//  Created by rrtv on 2021/12/15.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkDetailDramaCardCell : UICollectionViewCell

@property (nonatomic, strong) RRSeriesItemModel *model; //剧集信息

@property (nonatomic ,strong) UIImageView *coverImgV;

@property (nonatomic, strong) UILabel *titleLab;

//评分 8.9分 富文本做
@property (nonatomic, strong) UILabel *subTitleLab;
//8.9
@property (nonatomic, strong) UILabel *scoreLab;
//分
@property (nonatomic, strong) UILabel *scoreStrLab;

@end

NS_ASSUME_NONNULL_END
