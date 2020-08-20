//
//  FaceAttachment.h
//  自定义表情包
//
//  Created by rrtv on 17/2/22.
//  Copyright © 2017年 rrtv. All rights reserved.
//

#import "FaceAttachment.h"
#import "ChatImageCache.h"


@implementation FaceAttachment
- (UIImage *)image {
//    return [UIImage imageNamed:_imageName];
    return [[ChatImageCache sharedInstance] getFaceFromCache:_imageName];
}
@end
