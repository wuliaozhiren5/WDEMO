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
    UIView *room = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 24, 12)];
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
@end
