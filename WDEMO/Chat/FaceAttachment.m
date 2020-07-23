//
//  FaceAttachment.m
//  自定义表情包
//
//  Created by 张祎 on 17/2/22.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "FaceAttachment.h"
#import "TUIImageCache.h"


@implementation FaceAttachment
- (UIImage *)image {
//    return [UIImage imageNamed:_imageName];
    return [[TUIImageCache sharedInstance] getFaceFromCache:_imageName];
}
@end
