//
//  MWSTabBarButton.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSTabBarButton : UIButton

@property (nonatomic, strong) UIImageView *tabBarBtnImageView;

@property (nonatomic, strong) UIImage *selectedImage;

@property (nonatomic, strong) UIImage *normalImage;

@end

NS_ASSUME_NONNULL_END
