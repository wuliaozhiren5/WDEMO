//
//  TipMessageDataModel.m
//  WDEMO
//
//  Created by rrtv on 2020/9/9.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "TipMessageDataModel.h"

@implementation TipMessageDataModel


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
