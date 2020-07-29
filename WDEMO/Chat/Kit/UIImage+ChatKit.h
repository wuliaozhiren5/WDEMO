//
//  UIImage+TUIKIT.h
//  TXIMSDK_TUIKit_iOS
//
//  Created by annidyfeng on 2019/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ChatKit)

+ (UIImage *)chat_imageNamed:(NSString *)name;

+ (UIImage *)chat_imagePath:(NSString *)path;

//UIView转化为UIImage
+ (UIImage *)convertViewToImage:(UIView *)view;

//房主标签图片
+ (UIImage *)roomOwnimage;
@end

NS_ASSUME_NONNULL_END
