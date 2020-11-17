//
//  UIImage+TUIKIT.m
//  TXIMSDK_TUIKit_iOS
//
//  Created by annidyfeng on 2019/5/13.
//

#import "UIImage+ChatKit.h"
#import "ChatHeader.h"
 

@implementation UIImage (ChatKit)

+ (UIImage *)chat_imageNamed:(NSString *)name
{
//    UIImage *image = [UIImage d_imageWithImageLight:ChatKitResource(name) dark:[NSString stringWithFormat:@"%@_dark",ChatKitResource(name)]];
    UIImage *image =[UIImage imageNamed:ChatKitResource(name)];
    return image;
}

+ (UIImage *)chat_imagePath:(NSString *)path
{
//    UIImage *image = [UIImage d_imageWithImageLight:path dark:[NSString stringWithFormat:@"%@_dark",path]];
    
    UIImage *image = [UIImage imageNamed:path];

    return image;
}

+ (UIImage *)convertViewToImage:(UIView *)view {
    
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
    
}

+ (UIImage *)roomOwnimage {
    //房主
    UIView *room = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 24, 12.1)];
    room.backgroundColor = RGB(0, 187, 255);
    room.layer.cornerRadius = 3.0;
    UILabel *roomLabel = [[UILabel alloc]initWithFrame:room.frame];
    roomLabel.text = @"房主";
    roomLabel.textColor = [UIColor whiteColor];
    roomLabel.font = [UIFont systemFontOfSize:9.0];
    roomLabel.textAlignment = NSTextAlignmentCenter;
    [room addSubview:roomLabel];
    
    UIImage *image = [self convertViewToImage:room];
    return image;
}

/**
 *  从图片中按指定的位置大小截取图片的一部分
 *
 *  @param image UIImage image 原始的图片
 *  @param rect  CGRect rect 要截取的区域
 *
 *  @return UIImage
 */
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);

    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}
@end
