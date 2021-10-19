//
//  EnterMessageDataModel.m
//  WDEMO
//
//  Created by WDEMO on 2020/9/9.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "EnterMessageDataModel.h"

@implementation EnterMessageDataModel

- (NSMutableAttributedString *)yyStringWithServerString:(NSString *)string{
    return [self yyEnterMessageWithString:self.content];;
}

- (NSMutableAttributedString *)yyEnterMessageWithString:(NSString *)string {
    
    //nikename
    UIFont *namefont = [UIFont systemFontOfSize:12];
    CGFloat lineSpacing = 6.0;
    
    //nickname
    NSString *name = @"用户300冲冲冲";
    //    NSString *name = self.sender.nickName;
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:name];
    nameStr.lineSpacing = lineSpacing;
    nameStr.lineBreakMode = NSLineBreakByCharWrapping;
    nameStr.font = namefont;
    nameStr.color = ChatTextColor;
    
    __weak __typeof(self) ws = self;;
    [nameStr setTextHighlightRange:nameStr.rangeOfAll
                             color:ChatTextColor//RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        //自定义代码，此处根据需要调整
        NSLog(@"点击了用户昵称:%@", name);
        if (ws.clickNickName) {
            ws.clickNickName();
        }
    }];
    
    NSString *enter = string ? string :@"一起来看剧啦";
    NSMutableAttributedString *enterStr = [[NSMutableAttributedString alloc] initWithString:enter];
    enterStr.lineSpacing = lineSpacing;
    enterStr.lineBreakMode = NSLineBreakByCharWrapping;
    enterStr.font = namefont;
    enterStr.color = ChatNameColor;
    
    //最后结果str
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:@""];
    //设置行间距
    attrStr.lineSpacing = 10;
    attrStr.lineBreakMode = NSLineBreakByCharWrapping;
    
    [attrStr appendAttributedString:nameStr];
    [attrStr appendAttributedString:enterStr];

    return attrStr;
}


//- (CGSize)contentSize {
//    
//    //    CGRect rect = [self.attributedString boundingRectWithSize:CGSizeMake(TTextMessageCell_Text_Width_Max, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
//    //    CGSize size = rect.size;
//    
//    CGRect rect = self.layout.textBoundingRect;
//    CGSize size = self.layout.textBoundingSize;
//    
//    self.bubbleOrigin = CGPointMake(12, 6);
//    self.textOrigin = CGPointMake(9, 9);
//    self.bubbleSize = CGSizeMake(size.width + 9 * 2  , size.height + 9 * 2  );
//    self.textSize = CGSizeMake(size.width , size.height);
//    
//    size = CGSizeMake(rect.size.width + 12 * 2 + 9 * 2, rect.size.height + 6 * 2 + 9 * 2 );
//    
//    return size;
//}
//
//
//- (CGFloat)heightOfWidth:(CGFloat)width {
//    CGFloat height = 0;
//    
//    CGSize containerSize = [self contentSize];
//    height += containerSize.height  ;
//    //    height += self.cellLayout.messageInsets.top + self.cellLayout.messageInsets.bottom;
//    
//    if (height < 55)
//        height = 55;
//    
//    return height;
//}
@end
