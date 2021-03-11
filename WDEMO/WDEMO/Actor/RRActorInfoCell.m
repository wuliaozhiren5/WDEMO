//
//  RRActorInfoCell.m
//  PUClient
//
//  Created by rrtv on 2021/3/10.
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
    //最大69
    
    UIFont *textFont = self.titleLab.font;
    //    UIFont *textFont = [UIFont systemFontOfSize:16];
    NSString *contentStr = @"阿斯顿就离开撒的饭卡上阿斯顿就离开撒的ref 被用来给DOM元素或子组件注册引用信息。引用信息会根据父组件的 $refs 对象进行注册。如果在普通的DOM元素上使用，引用信息就是元素; 如果用在子组件上，引用信息就是组件实例.注意：只要想要在Vue中直接操作DOM元素，就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册就必须用ref属性进行注册";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:contentStr];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    [attributedString addAttributes:@{NSFontAttributeName:textFont,
                                      //                                      NSForegroundColorAttributeName: [UIColor blackColor],
                                      NSParagraphStyleAttributeName:paragraph}
                              range:NSMakeRange(0, attributedString.length)];
    self.titleLab.attributedText = attributedString;
    self.titleLab.lineBreakMode = NSLineBreakByTruncatingTail;
    
    //计算高度
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(KWidth - 16 * 2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size  = rect.size;
    CGFloat height = size.height;//真实的高度
    CGFloat showHeight = height;//显示的高度
    
    
//    if (self.isNoOtherData) {
//        self.isShowMore = YES;
//    } else {
//        
//    }
    
    //按钮
    self.moreBtn.hidden = NO;
    if (height <= 69) {
        //不显示more按钮
        self.moreBtn.hidden = YES;
    } else {
        //显示more按钮
        self.moreBtn.hidden = NO;
        showHeight = 69;
    }
    
    //状态发生变化 显示全部
    if (self.isShowMore) {
        showHeight = height;
    }
   
    //状态发生变化
//    if (!self.isNoOtherData) {
//        if (!self.isShowMore) {
//            if (height <= 69) {
//                //不显示more按钮
//             } else {
//                //显示more按钮
//                height = 69;
//             }
//        } else {
//
//        }
//    } else {
//
//    }

    [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(showHeight));
    }];
}

- (void)clickMoreBtn:(UIButton *)btn {
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_E5E7EB;
        _titleLab.numberOfLines = 0;
        _titleLab.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLab;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] init];
        _moreBtn.frame = CGRectMake(0, 0, 40, 40);
        //        _moreBtn.titleLabel.font = RR_COMMONFONT(12);
        //        [_moreBtn setTitle:@"查看作品" forState:UIControlStateNormal];
        //        [_moreBtn setTitleColor:kCOLOR_1890FF forState:UIControlStateNormal];
        //        _moreBtn.backgroundColor = [kCOLOR_1890FF colorWithAlphaComponent:0.1];
        [_moreBtn setImage:IMAGENAME(@"ic_search_follow_n") forState:UIControlStateNormal];
        [_moreBtn setImage:IMAGENAME(@"ic_search_follow_h") forState:UIControlStateSelected];
//        [_moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreBtn;
}
@end
