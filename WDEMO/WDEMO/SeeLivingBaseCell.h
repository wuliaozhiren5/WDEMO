//
//  SeeLivingBaseCell.h
//  WDEMO
//
//  Created by WDEMO on 2020/8/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeeLivingModel.h"

NS_ASSUME_NONNULL_BEGIN


@class SeeLivingBaseCell;
 
@protocol SeeLivingCellDelegate <NSObject>

- (void)seeLivingCell:(SeeLivingBaseCell *)cell subscribe:(SeeLivingModel *)data;
- (void)seeLivingCell:(SeeLivingBaseCell *)cell firstLook:(SeeLivingModel *)data;
- (void)seeLivingCell:(SeeLivingBaseCell *)cell seeLiving:(SeeLivingModel *)data;

@end

@interface SeeLivingBaseCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, weak) id<SeeLivingCellDelegate> delegate;
@property (nonatomic, strong) SeeLivingModel *seeLivingModel;

- (void)fillWithData:(id)data;

@end

//订阅直播cell
@interface RRSubscribeSeeLivingCell : SeeLivingBaseCell
@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UIButton *subscribeBtn;

@end

//看直播cell
@interface RRSeeLivingCell : SeeLivingBaseCell

@property (nonatomic, strong) UIButton *firstLookBtn;
@property (nonatomic, strong) UIButton *seeLivingBtn;

@end

NS_ASSUME_NONNULL_END
