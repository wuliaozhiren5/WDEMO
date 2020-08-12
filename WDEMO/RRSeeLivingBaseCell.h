//
//  RRSeeLivingBaseCell.h
//  WDEMO
//
//  Created by rrtv on 2020/8/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeeLivingModel.h"

NS_ASSUME_NONNULL_BEGIN


@class RRSeeLivingBaseCell;
 
@protocol RRSeeLivingCellDelegate <NSObject>

- (void)seeLivingCell:(RRSeeLivingBaseCell *)cell subscribe:(RRSeeLivingModel *)data;
- (void)seeLivingCell:(RRSeeLivingBaseCell *)cell firstLook:(RRSeeLivingModel *)data;
- (void)seeLivingCell:(RRSeeLivingBaseCell *)cell seeLiving:(RRSeeLivingModel *)data;

@end

@interface RRSeeLivingBaseCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, weak) id<RRSeeLivingCellDelegate> delegate;
@property (nonatomic, strong) RRSeeLivingModel *seeLivingModel;

- (void)fillWithData:(id)data;

@end

//订阅直播cell
@interface RRSubscribeSeeLivingCell : RRSeeLivingBaseCell
@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UIButton *subscribeBtn;

@end

//看直播cell
@interface RRSeeLivingCell : RRSeeLivingBaseCell

@property (nonatomic, strong) UIButton *firstLookBtn;
@property (nonatomic, strong) UIButton *seeLivingBtn;

@end

NS_ASSUME_NONNULL_END
