//
//  RRDestroyAccountAlterview.h
//  PUClient
//
//  Created by rrtv on 2020/8/14.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRDestroyAccountAlterview : UIControl
- (instancetype)initWithFrame:(CGRect)frame
                        titel:(NSString *)title
                      content:(NSString *)content
                      confirm:(nullable NSString *)confirm
                        close:(nullable NSString *)close
            confirmHandler:(void (^)(void))confirmHandler
            closeHandler:(void (^)(void))closeHandler;
-(void)showInView:(UIView *)view;
-(void)show;
-(void)hidden;
@end

NS_ASSUME_NONNULL_END
