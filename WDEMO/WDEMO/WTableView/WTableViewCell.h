//
//  WTableViewCell.h
//  WDEMO
//
//  Created by longzhu on 2019/9/2.
//  Copyright © 2019年 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *firstLabel;

@property (nonatomic, strong) UILabel *secondLabel;

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@property (nonatomic, strong) UIImageView *nextImage;

@property (nonatomic, strong) UIButton *selectBtn;

@property (weak, nonatomic) IBOutlet UILabel *xibLabel;

//填充数据
- (void)fillWithData:(id)data;

//计算高度
//+ (CGFloat)heightForCellWithModel:(id)model;
+ (CGFloat)cellHeightWithModel:(id)model;
@end

NS_ASSUME_NONNULL_END
