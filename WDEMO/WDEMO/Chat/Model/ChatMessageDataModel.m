//
//  ChatMessageData.m
//  WDEMO
//
//  Created by rrtv on 2020/7/24.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageDataModel.h"


@implementation ChatMessageDataModel

- (NSAttributedString *)attributedString
{
    if (!_attributedString) {
        //表情
        _attributedString = [self faceWithServerString:_content];
        //公告
//                _attributedString = [self tipMessageWithString:_content];
        //进入房间
//                _attributedString = [self enterMessageWithString:_content];
        
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
    
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:ChatTextColor} range:NSMakeRange(0, attributedString.length)];
    
    //nickname
    NSString *name = @"用户XXX:";
    //    NSString *name = self.sender.nickName;
    NSDictionary *dictAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:ChatNameColor};
    NSAttributedString *nameStr = [[NSAttributedString alloc]initWithString:name attributes:dictAttr];
    
    //vip
    UIImage *vipImage = [UIImage chat_imageNamed:@"ic_common_vip_small"];
    NSTextAttachment *attachmentVip = [[NSTextAttachment alloc]init];
    attachmentVip.image = vipImage;
    attachmentVip.bounds = CGRectMake(0, -2, 12, 12);
    NSAttributedString *vipStr = [NSAttributedString attributedStringWithAttachment:attachmentVip];
    
    UIImage *roomImage = [UIImage roomOwnimage];
    NSTextAttachment *attachmentRoom = [[NSTextAttachment alloc]init];
    attachmentRoom.image = roomImage;
    attachmentRoom.bounds = CGRectMake(0, -2, 24, 12);
    NSAttributedString *roomStr = [NSAttributedString attributedStringWithAttachment:attachmentRoom];
    
    //空格
    NSAttributedString *spaceStr = [[NSAttributedString alloc]initWithString:@" " attributes:dictAttr];
    //冒号
    NSAttributedString *colonStr = [[NSAttributedString alloc]initWithString:@":" attributes:dictAttr];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@""];
    
    //    BOOL isVip = self.sender.isVip;
    //    BOOL isRoomOwn = [self.creatorId isEqualToString:self.sender.userId];
    BOOL isVip = YES;
    BOOL isRoomOwn = YES;
    if (isVip) {
        [attrStr appendAttributedString:vipStr];
        [attrStr appendAttributedString:spaceStr];
    }
    if (isRoomOwn) {
        [attrStr appendAttributedString:roomStr];
        [attrStr appendAttributedString:spaceStr];
    }
    [attrStr appendAttributedString:nameStr];
    [attrStr appendAttributedString:colonStr];
    [attrStr appendAttributedString:spaceStr];
    [attrStr appendAttributedString:attributedString];
    
    //行高
    NSMutableParagraphStyle *aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    aParagraphStyle.lineSpacing = 5.0;
    [aParagraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    [attrStr addAttributes:@{NSParagraphStyleAttributeName:aParagraphStyle} range:NSMakeRange(0, attrStr.length)];
    
    return attrStr;
}

- (NSAttributedString *)tipMessageWithString:(NSString *)string {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    //行高
    NSMutableParagraphStyle *aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    aParagraphStyle.lineSpacing = 5.0;
    [aParagraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:ChatTextColor, NSParagraphStyleAttributeName:aParagraphStyle} range:NSMakeRange(0, attributedString.length)];
    return attributedString;
}

- (NSAttributedString *)enterMessageWithString:(NSString *)string {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@""];
   
    NSString *nameStr = @"用户XXX";
//    NSString *nameStr = self.sender.nickName;
    NSDictionary *dictAttr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:ChatTextColor};
    NSAttributedString *attr1 = [[NSAttributedString alloc]initWithString:nameStr attributes:dictAttr1];
    
    //    NSString *contentStr = @"一起来看剧啦";
    NSString *contentStr = string;
    NSDictionary *dictAttr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:EnterUserContenTextColor};
    NSAttributedString *attr2 = [[NSAttributedString alloc]initWithString:contentStr attributes:dictAttr2];
    
    [attributedString appendAttributedString:attr1];
    [attributedString appendAttributedString:attr2];
    
    //行高
    NSMutableParagraphStyle *aParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    aParagraphStyle.lineSpacing = 5.0;
    [aParagraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    [attributedString addAttributes:@{NSParagraphStyleAttributeName:aParagraphStyle} range:NSMakeRange(0, attributedString.length)];
    
    return attributedString;
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


- (CGFloat)heightOfWidth:(CGFloat)width {
    CGFloat height = 0;
    
    CGSize containerSize = [self contentSize];
    height += containerSize.height  ;
    //    height += self.cellLayout.messageInsets.top + self.cellLayout.messageInsets.bottom;
    
    if (height < 55)
        height = 55;
    
    return height;
}
@end
