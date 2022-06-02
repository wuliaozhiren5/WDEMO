//
//  MWSSendOutGoodsBottomBar.m
//  MoWanShang
//
//  Created by rrtv on 2022/5/10.
//

#import "MWSSendOutGoodsBottomBar.h"

@implementation MWSSendOutGoodsBottomBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    self.backgroundColor = [UIColor clearColor];

//    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    [self addSubview:self.cancelBtn];
    [self addSubview:self.confirmBtn];
    [self addSubview:self.tipsLabBackgroundView];
    [self addSubview:self.tipsLab];
   
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
        make.bottom.equalTo(@(0));
        make.leading.equalTo(@0);
        make.width.equalTo(@(KWidth / 2.0));
    }];

    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(50));
        make.bottom.equalTo(@(0));
        make.trailing.equalTo(@0);
        make.width.equalTo(@(KWidth / 2.0));
    }];

    [self.tipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(-55));
        make.height.equalTo(@(30));
        make.centerX.equalTo(@0);

    }];
    
    [self.tipsLabBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tipsLab.mas_top).offset();
        make.bottom.equalTo(@(-55));
        make.height.equalTo(@(30));
//        make.leading.equalTo(self.tipsLab.mas_leading).offset(-16.5);
//        make.trailing.equalTo(self.tipsLab.mas_trailing).offset(16.5);
        make.leading.equalTo(@37.5);
        make.trailing.equalTo(@-37.5);
    }];
    
    self.confirmBtn.backgroundColor = kCOLOR_C13030;
    self.cancelBtn.backgroundColor = kCOLOR_1D1D1D;

    //    self.agreementLab.text = @"同意《用户购买协议》";
        {
            UIFont *textFont = [UIFont systemFontOfSize:12];
            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
            //设置行间距
            text.lineSpacing = 2.5;
            //text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
            //设置文本字号
            text.font = textFont;
            //设置字体颜色
            text.color = [UIColor blackColor];

            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"在提交发货前，请务必阅读并了解"];
                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_FFFFFF;
                [text appendAttributedString:one];
            }

            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" 发货须知 "];
                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_C13030;
                //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
                [one setTextHighlightRange:one.rangeOfAll
                                     color:kCOLOR_C13030
                           backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                                 tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                    //自定义代码，此处根据需要调整
                    NSLog(@" 发货须知 ");

//                    MWSWebViewVC *webViewVC = [[MWSWebViewVC alloc]init];
//                    webViewVC.titleStr = @"发货须知";
//                    webViewVC.urlStr = kAppShipTipUrl;
//                    [[MWSLinkManager sharedManager] pushViewController:webViewVC animated:YES];

                }];
                [text appendAttributedString:one];
            }

            self.tipsLab.attributedText = text;
        }
    
}

//lazy
- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    }
    return _confirmBtn;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    return _cancelBtn;
}

//- (UILabel *)tipsLab {
//    if (!_tipsLab) {
//        _tipsLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _tipsLab.text = @"提示：满5件赏品包邮，如不满5件需支付18元运费";
//        _tipsLab.font = [UIFont systemFontOfSize:12.0];
//        _tipsLab.textColor = [UIColor whiteColor];
//        _tipsLab.textAlignment = NSTextAlignmentCenter;
//    }
//    return _tipsLab;
//}

- (YYLabel *)tipsLab {
    if (!_tipsLab) {
        _tipsLab = [[YYLabel alloc] init];
//        _agreementLab.font = [UIFont systemFontOfSize:18];
//        _agreementLab.textAlignment = NSTextAlignmentLeft;
    }
    return _tipsLab;
}


- (UIView *)tipsLabBackgroundView {
    if (!_tipsLabBackgroundView) {
        _tipsLabBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//        _tipsLabBackgroundView.backgroundColor = [UIColor blackColor];
        _tipsLabBackgroundView.backgroundColor = kCOLOR_1D1D1D;
        _tipsLabBackgroundView.layer.cornerRadius = 15;
        _tipsLabBackgroundView.layer.masksToBounds = YES;
    }
    return _tipsLabBackgroundView;
}
@end
