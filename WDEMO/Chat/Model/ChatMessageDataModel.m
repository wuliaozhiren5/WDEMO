//
//  ChatMessageData.m
//  WDEMO
//
//  Created by rrtv on 2020/7/24.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageDataModel.h"
#import "FaceAttachment.h"
#import "FaceCell.h"
#import "FaceView.h"
#import "ChatKit.h"
#import "ChatKit.h"
#import "ChatHeader.h"

@implementation ChatMessageDataModel

- (NSAttributedString *)attributedString
{
    if (!_attributedString) {
        _attributedString = [self faceWithServerString:_content];
    }
    return _attributedString;
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
    
    TFaceGroup *group = [ChatKit sharedInstance].config.faceGroups[0];

    
    for (NSTextCheckingResult *result in resultArr) {
        NSRange range = result.range;
        NSString *subString = [string substringWithRange:range];
        
        for (TFaceCellData *model in group.faces) {
            if ([subString isEqualToString:model.name]) {
                
                FaceAttachment *faceAttachment = [[FaceAttachment alloc]init];
                faceAttachment.imageName = model.path;
                faceAttachment.tagName = model.name;
                faceAttachment.range = range;
                faceAttachment.bounds = CGRectMake(0, 0, 14, 14);

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
    
     
    NSString *str = @"沫沫沫:";
    NSDictionary *dictAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor purpleColor]};
    NSAttributedString *attr = [[NSAttributedString alloc]initWithString:str attributes:dictAttr];
 
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@""];
    [attrStr appendAttributedString:attr];
    [attrStr appendAttributedString:attributedString];
 
//    return attributedString;
    return attrStr;
}

- (CGSize)contentSize
{
    CGRect rect = [self.attributedString boundingRectWithSize:CGSizeMake(TTextMessageCell_Text_Width_Max, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size = rect.size;
    
    
    _bubbleOrigin = CGPointMake(12, 6);
    _textOrigin = CGPointMake(9, 9);
    _bubbleSize = CGSizeMake(size.width + 9 * 2  , size.height + 9 * 2  );
    _textSize = CGSizeMake(size.width , size.height);
     
    size = CGSizeMake(rect.size.width + 12 * 2 + 9 * 2, rect.size.height + 6 * 2 + 9 * 2 );

    return size;
}


- (CGFloat)heightOfWidth:(CGFloat)width
{
    CGFloat height = 0;
 
    CGSize containerSize = [self contentSize];
    height += containerSize.height  ;
//    height += self.cellLayout.messageInsets.top + self.cellLayout.messageInsets.bottom;

    if (height < 55)
        height = 55;

    return height;
}
@end
