//
//  ZYFaceHelper.m
//  自定义表情包
//
//  Created by 张祎 on 17/2/23.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "ZYFaceHelper.h"

@interface ZYFaceHelper ()
@property(nonatomic, strong) NSMutableArray *faceArray;
@end

@implementation ZYFaceHelper

- (NSMutableArray *)faceArray {
    if (!_faceArray) {
        _faceArray = [NSMutableArray array];
        
        //创建一个标签数组
        NSArray *tagArr = @[@"[龇牙]", @"[吐舌]", @"[流汗]", @"[偷笑]", @"[再见]", @"[砸]", @"[擦汗]", @"[猪头]", @"[玫瑰]", @"[流泪]", @"[大哭]", @"[嘘]", @"[酷]", @"[抓狂]", @"[委屈]", @"[便便]", @"[地雷]", @"[菜刀]", @"[可爱]", @"[心心眼]", @"[害羞]", @"[帅气]", @"[吐]", @"[笑脸]", @"[生气]", @"[尴尬]", @"[惊吓]", @"[尴尬2]", @"[心]", @"[嘴唇]", @"[白眼]", @"[傲慢]", @"[难过]", @"[惊讶]", @"[疑问]", @"[睡觉]", @"[亲亲]", @"[憨笑]", @"[企鹅爱]", @"[衰]", @"[撇嘴]", @"[阴险]", @"[加油]", @"[发呆]", @"[睡着]", @"[抱抱]", @"[坏笑]", @"[飞吻]", @"[鄙视]", @"[晕]"];
        
        for (NSInteger i = 1; i < 51; i++) {
            //创建一个表情对象
            FaceAttachment *model = [[FaceAttachment alloc] init];
            //从第一张图片依次赋值
            model.imageName = [NSString stringWithFormat:@"%03ld", i];
            //刻上标签名 用途:上传服务器替换
            model.tagName = tagArr[i - 1];
            //将model装入数组
            [_faceArray addObject:model];
        }
    }
    return _faceArray;
}

+ (void)insertFaceToString:(FaceAttachment *)model textView:(UITextView *)textView {
    
    //创建一个附件
    FaceAttachment *faceAttachement = [[FaceAttachment alloc]init];
    //添加表情
    faceAttachement.imageName = model.imageName;
    //添加标签名
    faceAttachement.tagName = model.tagName;
    //设置表情大小
    faceAttachement.bounds = CGRectMake(0, 0, 18, 18);
    //记录光标位置
    NSInteger location = textView.selectedRange.location;
    //插入表情
    [textView.textStorage insertAttributedString:[NSAttributedString attributedStringWithAttachment:faceAttachement] atIndex:textView.selectedRange.location];
    //将光标位置向前移动一个单位
    textView.selectedRange = NSMakeRange(location + 1, 0);
}


- (NSAttributedString *)faceWithServerString:(NSString *)string {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    
    NSString *pattern = @"\\[[^\\[|^\\]]+\\]";
    NSError *error = nil;
    NSRegularExpression *regularExpression = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (!regularExpression) {
        NSLog(@"错误信息 : %@", error);
    }
    
    //将匹配到的字符存入数组
    NSArray *resultArr = [regularExpression matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    NSMutableArray *faceModelArr = [NSMutableArray array];
    
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = result.range;
        NSString *subString = [string substringWithRange:range];
        
        for (FaceAttachment *model in self.faceArray) {
            if ([subString isEqualToString:model.tagName]) {
                
                FaceAttachment *faceAttachment = [[FaceAttachment alloc]init];
                faceAttachment.imageName = model.imageName;
                faceAttachment.tagName = model.tagName;
                faceAttachment.range = range;
                faceAttachment.bounds = CGRectMake(0, 0, 18, 18);
                
                [faceModelArr addObject:faceAttachment];
            }
        }
    }
    
    faceModelArr = [NSMutableArray arrayWithArray:[[faceModelArr reverseObjectEnumerator] allObjects]];
    
    for (FaceAttachment *faceAttachment in faceModelArr) {
        NSAttributedString *faceAttributedString = [NSAttributedString attributedStringWithAttachment:faceAttachment];
        [attributedString replaceCharactersInRange:faceAttachment.range withAttributedString:faceAttributedString];
    }
    
    
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(0, attributedString.length)];
    
    return attributedString;
}

@end
