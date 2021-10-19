//
//  RRActorInfoCell.m
//  PUClient
//
//  Created by WDEMO on 2021/3/10.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRActorInfoCell.h"
#import <Masonry/Masonry.h>
#import "ACMacros.h"
#import "UIColor+color.h"

@interface RRActorInfoCell ()
@property (nonatomic, strong) UILabel *titleLab;
//@property (nonatomic, strong) UIButton *moreBtn;
@end

@implementation RRActorInfoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.moreBtn];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(16));
        make.trailing.equalTo(@(-16));
        make.top.equalTo(@(0));
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(0);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@(60));
        make.height.equalTo(@(28));
    }];
}

- (void)setModel:(id)model {
    _model = model;
    //最大69
    
    UIFont *textFont = self.titleLab.font;
    //    UIFont *textFont = [UIFont systemFontOfSize:16];
    //    NSString *contentStr = model.desc;
    NSString *contentStr= @"阿斯顿就离开撒的饭卡上阿斯顿就离开撒的ref 被用来给DOM元素或子组件注册引用信息。引用信息会根据父组件的 $refs 对象进行注册。如果在普通的DOM元素上使用，引用信息就是元素; 如果用在子组件上，引用信息就是组件实例.注意：只要想要在Vue中直接操作DOM元素，就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    [attributedString addAttributes:@{NSFontAttributeName:textFont,
                                      //                                      NSForegroundColorAttributeName: [UIColor blackColor],
                                      NSParagraphStyleAttributeName:paragraph}
                              range:NSMakeRange(0, attributedString.length)];
    
    self.titleLab.attributedText = attributedString;
    self.titleLab.lineBreakMode = NSLineBreakByTruncatingTail;
    if (self.isShowMore) {
        self.titleLab.numberOfLines = 0;
    } else {
        self.titleLab.numberOfLines = 3;
    }
    
    UILabel *moreLineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 20)];
    moreLineLab.numberOfLines = 0;
    moreLineLab.attributedText = attributedString;
    //计算高度方法
    CGSize moreLineSize = [moreLineLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
    CGFloat moreLineHeight = moreLineSize.height;
    //    NSLog(@"计算高度方法1：text width = %f, text height = %f", size.width, size.height);
    
    UILabel *threeLineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 20)];
    threeLineLab.numberOfLines = 3;
    threeLineLab.attributedText = attributedString;
    //计算高度方法
    CGSize threeLineSize = [threeLineLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
    CGFloat threeLineHeight = threeLineSize.height;
    //    NSLog(@"计算高度方法1：text width = %f, text height = %f", size.width, size.height);
    
    BOOL isHidden = NO;
    if (!(threeLineHeight < moreLineHeight)) {
        isHidden = YES;
    }
    //按钮
    self.moreBtn.hidden = isHidden;
    self.moreBtn.selected = self.isShowMore;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
        _titleLab.numberOfLines = 3;
        _titleLab.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLab;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] init];
        _moreBtn.frame = CGRectMake(0, 0, 40, 40);
        [_moreBtn setImage:IMAGENAME(@"ic_more_down_gray24") forState:UIControlStateNormal];
        [_moreBtn setImage:IMAGENAME(@"ic_more_up_gray24") forState:UIControlStateSelected];
    }
    return _moreBtn;
}

+ (CGFloat)cellHeightWithModel:(id)model {
    UIFont *textFont = RR_COMMONFONT(14);
    //    NSString *contentStr = model.desc;
    NSString *contentStr= @"阿斯顿就离开撒的饭卡上阿斯顿就离开撒的ref 被用来给DOM元素或子组件注册引用信息。引用信息会根据父组件的 $refs 对象进行注册。如果在普通的DOM元素上使用，引用信息就是元素; 如果用在子组件上，引用信息就是组件实例.注意：只要想要在Vue中直接操作DOM元素，就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    [attributedString addAttributes:@{NSFontAttributeName:textFont,
                                      //                                      NSForegroundColorAttributeName: [UIColor blackColor],
                                      NSParagraphStyleAttributeName:paragraph}
                              range:NSMakeRange(0, attributedString.length)];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 20)];
    titleLab.numberOfLines = 0;
    titleLab.attributedText = attributedString;
    //计算高度方法
    CGSize size = [titleLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
    CGFloat height = size.height;
    NSLog(@"计算高度方法1：text width = %f, text height = %f", size.width, size.height);
    return height;
}

+ (CGFloat)cellHeightWithModel:(id)model isShowMore:(BOOL)isShowMore {
    UIFont *textFont = RR_COMMONFONT(14);
    //    NSString *contentStr = model.desc;
    NSString *contentStr= @"阿斯顿就离开撒的饭卡上阿斯顿就离开撒的ref 被用来给DOM元素或子组件注册引用信息。引用信息会根据父组件的 $refs 对象进行注册。如果在普通的DOM元素上使用，引用信息就是元素; 如果用在子组件上，引用信息就是组件实例.注意：只要想要在Vue中直接操作DOM元素，就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    [attributedString addAttributes:@{NSFontAttributeName:textFont,
                                      //                                      NSForegroundColorAttributeName: [UIColor blackColor],
                                      NSParagraphStyleAttributeName:paragraph}
                              range:NSMakeRange(0, attributedString.length)];
    
    UILabel *moreLineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 20)];
    moreLineLab.numberOfLines = 0;
    moreLineLab.attributedText = attributedString;
    //计算高度方法
    CGSize moreLineSize = [moreLineLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
    CGFloat moreLineHeight = moreLineSize.height;
    //    NSLog(@"计算高度方法1：text width = %f, text height = %f", size.width, size.height);
    
    UILabel *threeLineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 20)];
    threeLineLab.numberOfLines = 3;
    threeLineLab.attributedText = attributedString;
    //计算高度方法
    CGSize threeLineSize = [threeLineLab sizeThatFits:CGSizeMake(KWidth - 16 * 2, MAXFLOAT)];
    CGFloat threeLineHeight = threeLineSize.height;
    //    NSLog(@"计算高度方法1：text width = %f, text height = %f", size.width, size.height);
    
    CGFloat showHeight = 0;
    if (isShowMore) {
        showHeight = moreLineHeight;
    } else {
        showHeight = threeLineHeight;
    }
    
    BOOL isHidden = NO;
    if (!(threeLineHeight < moreLineHeight)) {
        isHidden = YES;
    }
    if (isHidden) {
        //不显示more按钮     +16
        showHeight += 16;
    } else {
        //显示more按钮      +36
        showHeight += 36;
    }
    
    return showHeight;
}

@end
