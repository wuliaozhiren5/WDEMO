//
//  RRVideoCommentsPopView.h
//  PPVideo
//
//  Created by WDEMO on 2022/1/26.
//  Copyright © 2022 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RRPlayerProtocol.h"
//#import "RRPlayerControlBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRVideoCommentsPopView : UIView
////协议对象
//@property (nonatomic ,weak) id <RRPlayerProtocol> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                      videoId:(NSString *)videoId;
 
- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END


