//
//  PLUPersonalHomePageCell.h
//  TGA
//
//  Created by plu on 16/9/23.
//  Copyright © 2016年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLURoomTaskModel.h"
#import "LZAnchorCertifyGuide.h"
@interface PLUPersonalHomePageCell : UITableViewCell

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UILabel *bookLabel;
@property (nonatomic, strong) UIImageView *bookImageView;

@property (nonatomic, strong) UIView *line;
//箭头
@property (nonatomic, strong) UIImageView *arrowImageView;

@property (strong, nonatomic) UIButton *getImageBtn;
@property (strong, nonatomic) UIView *redDotView;
@property (nonatomic, strong) LZAnchorCertifyGuide *anchorGuide;

- (void)updateImageBtnWithTitle:(NSString *)title isHidden:(BOOL)hidden;
- (void)updateImageBtnWithImgName:(NSString *)imageName isHidden:(BOOL)hidden;
- (void)updateRedDotView:(PLURoomTaskTabModel *)noviceTaskModel;

- (void)showAnchorGuide:(BOOL)show;

@end
