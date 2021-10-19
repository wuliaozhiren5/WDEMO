//
//  ChatMessageYYDataModel.m
//  WDEMO
//
//  Created by WDEMO on 2020/7/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageYYDataModel.h"

@implementation ChatMessageYYDataModel

- (NSMutableAttributedString *)yyAttributedString {
    if (!_yyAttributedString) {
        
         _yyAttributedString = [self yyStringWithServerString:self.content];
        
        //表情
//        _yyAttributedString = [self yyFaceWithServerString:self.content];
        //公告
        //        _yyAttributedString = [self yyTipMessageWithString:self.content];
        //进入房间
//        _yyAttributedString = [self yyEnterMessageWithString:self.content];
        
    }
    return _yyAttributedString;
}

- (NSMutableAttributedString *)yyStringWithServerString:(NSString *)string{
    return [[NSMutableAttributedString alloc]initWithString:string];
}

- (NSMutableAttributedString *)yyFaceWithServerString:(NSString *)string {
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CGFloat lineSpacing = 8.0;

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
        //        NSAttributedString *faceAttributedString = [NSAttributedString attributedStringWithAttachment:faceAttachment];
        
        UIImage *image = faceAttachment.image;
        UIImage *faceImage = [image imageByResizeToSize:CGSizeMake(15, 15)];
        NSMutableAttributedString *faceAttributedString = [NSMutableAttributedString attachmentStringWithContent:faceImage contentMode:UIViewContentModeCenter attachmentSize:faceImage.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
        [attributedString replaceCharactersInRange:faceAttachment.range withAttributedString:faceAttributedString];
    }
    
    //    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:ChatTextColor} range:NSMakeRange(0, attributedString.length)];
    
    //设置行间距
    attributedString.lineSpacing = lineSpacing;
    attributedString.lineBreakMode = NSLineBreakByCharWrapping;
    //设置文本字号
    attributedString.font = font;
    //设置字体颜色
    attributedString.color = ChatTextColor;
    
    //nikename
    UIFont *namefont = [UIFont systemFontOfSize:12];
    //nickname
    NSString *name = @"用户冲冲冲:";
    //    NSString *name = self.sender.nickName;
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:name];
    nameStr.lineSpacing = lineSpacing;
    nameStr.lineBreakMode = NSLineBreakByCharWrapping;
    nameStr.font = namefont;
    nameStr.color = ChatNameColor;
    
    __weak __typeof(self) ws = self;;
    [nameStr setTextHighlightRange:nameStr.rangeOfAll
                             color:[UIColor redColor]//RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        //自定义代码，此处根据需要调整
        NSLog(@"点击了用户昵称:%@", name);
        if (ws.clickNickName) {
            ws.clickNickName();
        }
    }];
    
    //vip
    UIImage *vipImage = [UIImage chat_imageNamed:@"ic_common_vip_small"];;
    NSMutableAttributedString *vipAttachment = [NSMutableAttributedString attachmentStringWithContent:vipImage contentMode:UIViewContentModeCenter attachmentSize:vipImage.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    vipAttachment.lineSpacing = lineSpacing;
    vipAttachment.lineBreakMode = NSLineBreakByCharWrapping;
    
//    //房主
//    UIView *room = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 24, 12)];
//    room.backgroundColor = RGB(0, 187, 255);
//    room.layer.cornerRadius = 3.0;
//    UILabel *roomLabel = [[UILabel alloc]initWithFrame:room.frame];
//    roomLabel.text = @"房主";
//    roomLabel.textColor = [UIColor whiteColor];
//    roomLabel.font = [UIFont systemFontOfSize:9.0];
//    roomLabel.textAlignment = NSTextAlignmentCenter;
//    [room addSubview:roomLabel];
//    
//    NSMutableAttributedString *roomAttachment = [NSMutableAttributedString attachmentStringWithContent:room contentMode:UIViewContentModeBottom attachmentSize:room.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
//    roomAttachment.lineSpacing = lineSpacing;
//    roomAttachment.lineBreakMode = NSLineBreakByCharWrapping;
    
    //房主
    UIImage *image = [UIImage roomOwnimage];
    NSMutableAttributedString *roomAttachment = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    roomAttachment.lineSpacing = lineSpacing;
    roomAttachment.lineBreakMode = NSLineBreakByCharWrapping;
    
    //空格
    NSMutableAttributedString *spaceStr = [[NSMutableAttributedString alloc] initWithString:@" "];
    spaceStr.lineSpacing = lineSpacing;
    spaceStr.lineBreakMode = NSLineBreakByCharWrapping;
    spaceStr.font = namefont;
    spaceStr.color = ChatNameColor;
    
    //冒号
    NSMutableAttributedString *colonStr = [[NSMutableAttributedString alloc] initWithString:@":"];
    colonStr.lineSpacing = lineSpacing;
    colonStr.lineBreakMode = NSLineBreakByCharWrapping;
    colonStr.font = namefont;
    colonStr.color = ChatNameColor;
    
    //最后结果str
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@""];
    //设置行间距
    attrStr.lineSpacing = lineSpacing;
    attrStr.lineBreakMode = NSLineBreakByCharWrapping;
    
    //    BOOL isVip = self.sender.isVip;
    //    BOOL isRoomOwn = [self.creatorId isEqualToString:self.sender.userId];
    BOOL isVip = YES;
    BOOL isRoomOwn = YES;
    if (isVip) {
        [attrStr appendAttributedString:vipAttachment];
        [attrStr appendAttributedString:spaceStr];
    }
    if (isRoomOwn) {
        [attrStr appendAttributedString:roomAttachment];
        [attrStr appendAttributedString:spaceStr];
    }
    
    [attrStr appendAttributedString:nameStr];
    [attrStr appendAttributedString:colonStr];
    [attrStr appendAttributedString:spaceStr];
    [attrStr appendAttributedString:attributedString];
    
    //    self.yyVipStr = vipAttachment;
    //    self.yyRoomHostStr = roomAttachment;
    //    self.yyNickNameStr = nameStr;
    //    self.yyTextFaceStr = attributedString;
    //    self.yyColonStr = colonStr;
    //    self.yySpaceStr = spaceStr;
    
    return attrStr;
}

- (NSAttributedString *)yyTipMessageWithString:(NSString *)string {
    
    UIFont *font = [UIFont systemFontOfSize:12];
    CGFloat lineSpacing = 6.0;

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    //设置行间距
    attributedString.lineSpacing = lineSpacing;
    attributedString.lineBreakMode = NSLineBreakByCharWrapping;
    //设置文本字号
    attributedString.font = font;
    //设置字体颜色
    attributedString.color = ChatTextColor;
    
    return attributedString;
}

- (NSAttributedString *)yyEnterMessageWithString:(NSString *)string {
    
    //nikename
    UIFont *namefont = [UIFont systemFontOfSize:12];
    CGFloat lineSpacing = 6.0;

    //nickname
    NSString *name = @"用户冲冲冲";
    //    NSString *name = self.sender.nickName;
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:name];
    nameStr.lineSpacing = lineSpacing;
    nameStr.lineBreakMode = NSLineBreakByCharWrapping;
    nameStr.font = namefont;
    nameStr.color = [UIColor redColor];
    
    __weak __typeof(self) ws = self;;
    [nameStr setTextHighlightRange:nameStr.rangeOfAll
                             color:[UIColor redColor]//RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        //自定义代码，此处根据需要调整
        NSLog(@"点击了用户昵称:%@", name);
        if (ws.clickNickName) {
            ws.clickNickName();
        }
    }];
    
    NSString *enter = @"一起来看剧啦";
    NSMutableAttributedString *enterStr = [[NSMutableAttributedString alloc] initWithString:enter];
    enterStr.lineSpacing = lineSpacing;
    enterStr.lineBreakMode = NSLineBreakByCharWrapping;
    enterStr.font = namefont;
    enterStr.color = EnterUserContenTextColor;
    
    //最后结果str
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@""];
    //设置行间距
    attrStr.lineSpacing = 10;
    attrStr.lineBreakMode = NSLineBreakByCharWrapping;
    
    [attrStr appendAttributedString:nameStr];
    [attrStr appendAttributedString:enterStr];
    
    //    self.yyNameStr = nameStr;
    
    return attrStr;
}

//-(YYTextLayout *)layout {
//    if (!_layout) {
//        //文本布局计算
//        CGSize size = CGSizeMake(TTextMessageCell_Text_Width_Max, CGFLOAT_MAX);
//        _layout = [YYTextLayout layoutWithContainerSize:size text:self.yyAttributedString];
//    }
//    return _layout;
//}

- (CGSize)contentSize {
    
    CGRect rect = self.layout.textBoundingRect;
    CGSize size = self.layout.textBoundingSize;
    
//    self.bubbleOrigin = CGPointMake(TTextMessageCell_Bubble_LeftMargin, TTextMessageCell_Bubble_TopMargin);
//    self.textOrigin = CGPointMake(TTextMessageCell_BubbleText_Margin, TTextMessageCell_BubbleText_Margin);
//    self.bubbleSize = CGSizeMake(size.width + TTextMessageCell_BubbleText_Margin * 2  , size.height + TTextMessageCell_BubbleText_Margin * 2  );
//    self.textSize = CGSizeMake(size.width , size.height);
    
    size = CGSizeMake(rect.size.width + TTextMessageCell_Bubble_LeftMargin * 2 + TTextMessageCell_BubbleText_Margin * 2, rect.size.height + TTextMessageCell_Bubble_TopMargin * 2 + TTextMessageCell_BubbleText_Margin * 2 );
    return size;
}
 
- (CGFloat)heightOfWidth:(CGFloat)width {
    CGFloat height = 0;
    
    //文本布局计算
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    self.layout = [YYTextLayout layoutWithContainerSize:size text:self.yyAttributedString];
    
    CGSize containerSize = [self contentSize];
    height += containerSize.height;
 
//    if (height < 55)
//        height = 55;
    return height;
}
@end
