//
//  FaceAttachment.h
//  自定义表情包
//
//  Created by WDEMO on 17/2/22.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceAttachment : NSTextAttachment
@property(nonatomic, strong) NSString *tagName;
@property(nonatomic, strong) NSString *imageName;
@property(nonatomic, assign) NSRange range;
@end
