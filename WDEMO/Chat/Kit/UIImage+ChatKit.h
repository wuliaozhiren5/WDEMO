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

/**
*  从图片中按指定的位置大小截取图片的一部分
*
*  @param image UIImage image 原始的图片
*  @param rect  CGRect rect 要截取的区域
*
*  @return UIImage
*/
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
