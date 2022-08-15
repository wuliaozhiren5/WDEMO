//
//  MWSNumberView.h
//  MoWanShang
//
//  Created by aimeiju on 2022/7/8.
//

//数字加减控件
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MWSNumberViewDelegate <NSObject>
 
//数字改变
- (void)numberViewChangeNumber:(NSInteger)number;
  
@end

@interface MWSNumberView : UIView
//加法
@property (nonatomic, strong) UIButton *additionBtn;
//剪法
@property (nonatomic, strong) UIButton *subtractionBtn;

@property (nonatomic, strong) UILabel *numberLab;

@property (nonatomic, assign) NSInteger number;

@property (nonatomic, assign) NSInteger max;

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, weak) id<MWSNumberViewDelegate> delegate;

@property (nonatomic, strong) UIView *numberView;

 
@end

NS_ASSUME_NONNULL_END

//使用
/**
```
@property (nonatomic, strong) MWSNumberView *numberView;


- (MWSNumberView *)numberView {
    if (!_numberView) {
        _numberView = [[MWSNumberView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        _numberView.delegate = self;
        _numberView.min = 1;
        _numberView.layer.cornerRadius = 6;
        _numberView.layer.masksToBounds = YES;
        _numberView.layer.borderWidth = 2;
        _numberView.layer.borderColor  = kCOLOR_D9D9D9.CGColor;
        
        _numberView.numberView.layer.borderWidth = 2;
        _numberView.numberView.layer.borderColor  = kCOLOR_D9D9D9.CGColor;
     }
    return _numberView;
}
 
//@protocol MWSNumberViewDelegate <NSObject>
#pragma mark - MWSNumberViewDelegate
//数字改变
- (void)numberViewChangeNumber:(NSInteger)number {
    self.count = number;
//    self.allPriceLab.text = [NSString stringWithFormat:@"魔币总计： %zi枚", number];
}
```
**/
