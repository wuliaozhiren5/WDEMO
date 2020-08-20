//
//  TUIFaceCell.m
//  UIKit
//
//  Created by kennethmiao on 2018/9/29.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "FaceCell.h"
#import "ChatKit.h" 
#import "ChatImageCache.h"


@implementation TFaceCellData
@end

@implementation FaceCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
        [self defaultLayout];
    }
    return self;
}

- (void)setupViews {
    _face = [[UIImageView alloc] init];
    _face.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_face];
}

- (void)defaultLayout {
    CGSize size = self.frame.size;
    _face.frame = CGRectMake(0, 0, size.width, size.height);
}

- (void)setData:(TFaceCellData *)data {
    _face.image = [[ChatImageCache sharedInstance] getFaceFromCache:data.path];
    [self defaultLayout];
}


@end
