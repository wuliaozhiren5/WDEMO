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
//    UIImage *image = [UIImage d_imageWithImageLight:TUIKitResource(name) dark:[NSString stringWithFormat:@"%@_dark",TUIKitResource(name)]];
    UIImage *image =[UIImage imageNamed:TUIKitResource(name)];
    return image;
}

+ (UIImage *)chat_imagePath:(NSString *)path
{
//    UIImage *image = [UIImage d_imageWithImageLight:path dark:[NSString stringWithFormat:@"%@_dark",path]];
    
    UIImage *image = [UIImage imageNamed:path];

    return image;
}
@end
