//
//  NSAttributedString+FaceString.m
//  WDEMO
//
//  Created by WDEMO on 2020/7/24.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "NSAttributedString+FaceString.h"
#import "FaceAttachment.h"

@implementation NSAttributedString (FaceString)
- (NSString *)toString {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithAttributedString:self];
    
    __block NSUInteger index = 0;
    
    [self enumerateAttribute:NSAttachmentAttributeName inRange:NSMakeRange(0, self.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        
        //从富文本中遍历出 FaceAttachment 对象
        if (value && [value isKindOfClass:[FaceAttachment class]]) {
            FaceAttachment *faceAttachment = value;
            //替换对象为[表情]
            [attributeString replaceCharactersInRange:NSMakeRange(range.location + index, range.length) withString:faceAttachment.tagName];
            //替换后对位置作一下调整(因为替换前长度为1替换后有可能是4 [龇牙] 也有可能是3 [晕])
            index += faceAttachment.tagName.length - 1;
        }
    }];
    
    return attributeString.string;
}

@end
