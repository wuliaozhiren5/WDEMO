//
//  MWSTradeAlertView.h
//  MoWanShang
//
//  Created by wwc on 2022/6/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSTradeAlertView : UIView

- (instancetype)initWithFrame:(CGRect)frame
           attributedTitelStr:(NSAttributedString *)attributedTitelStr
         attributedContentStr:(NSAttributedString *)attributedTitelStr
                   confirmStr:(NSString *)confirmStr
                    cancelStr:(NSString *)cancelStr
               confirmHandler:(void (^)(void))confirmHandler
                cancelHandler:(void (^)(void))cancelHandler;


- (instancetype)initWithFrame:(CGRect)frame
                     titelStr:(NSString *)titelStr
                   contentStr:(NSString *)contentStr
                   confirmStr:(NSString *)confirmStr
                    cancelStr:(NSString *)cancelStr
               confirmHandler:(void (^)(void))confirmHandler
                cancelHandler:(void (^)(void))cancelHandler;
 

-(void)showInView:(UIView *)view;
-(void)show;
-(void)hidden;

@end

NS_ASSUME_NONNULL_END
