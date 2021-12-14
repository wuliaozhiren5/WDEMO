//
//  YYViewController.m
//  WDEMO
//
//  Created by WDEMO on 2020/7/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "YYViewController.h"
#import <YYKit/YYKit.h>
#import "ChatHeader.h"
@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //YYText文字点击
    [self texthighlight];
    //YYText 富文本 本地图片使用UIImage 文字点击事件 图片点击事件 网络图片使用UIImageView
    [self textAttachments];
    // YYText 富文本 网络图片
    //    [self textAttachments];
    
    [self textTalk];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)textAttachments {
    CGFloat fontSize = 16.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"点击"];
    //设置行间距
    text.lineSpacing = 8;
    //text.lineSpacing = 8 - (textFont.lineHeight - textFont.pointSize);
    //设置文本字号
    text.font = textFont;
    //设置字体颜色
    text.color = RGBA(158, 158, 158, 1);
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"注册"];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"按钮，即表示您同意"];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(158, 158, 158, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"《嚯货协议》"];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
        [one setTextHighlightRange:one.rangeOfAll
                             color:RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"《嚯货协议》");
        }];
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"、"];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"《嚯货隐私政策》"];
        //              one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
        [one setTextHighlightRange:one.rangeOfAll
                             color:RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"《嚯货隐私政策》");
            
        }];
        
        [text appendAttributedString:one];
    }
    
    //    图文混排
    //    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:16];
    NSMutableAttributedString *attachment = nil;
    
    // 嵌入 UIImage
    UIImage *image = [UIImage imageNamed:@"dao"];
    attachment = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    
    [attachment setTextHighlightRange:attachment.rangeOfAll
                                color:RGBA(84, 84, 84, 1)
                      backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                            tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
        
        NSLog(@"点击了图片 dao");
        
    }];
    [text appendAttributedString: attachment];
    
    
    // 嵌入 UIView
    UISwitch *switcher = [UISwitch new];
    [switcher sizeToFit];
    attachment = [NSMutableAttributedString attachmentStringWithContent:switcher contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString: attachment];
    
    //    // 嵌入 CALayer
    //    CASharpLayer *layer = [CASharpLayer layer];
    ////    layer.path = ...
    //    attachment = [NSMutableAttributedString attachmentStringWithContent:layer contentMode:UIViewContentModeBottom attachmentSize:switcher.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    //    [text appendAttributedString: attachment];
    
    
    // 嵌入 UIImageViewv  网络图片 webimage
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, 20, 20);
//    imageView.backgroundColor = [UIColor redColor];
//    imageView.layer.cornerRadius = 10;
//    imageView.layer.masksToBounds = YES;
//    imageView.userInteractionEnabled = YES;
    [imageView setImageWithURL:[NSURL URLWithString:@"https://avatar.csdnimg.cn/D/A/E/1_weixin_39840387.jpg"] placeholder:[UIImage imageNamed:@"dao"]];
    attachment = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [text appendAttributedString: attachment];
    
    
    //文本布局计算
    CGSize size = CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:text];
    
    // text layout display
    YYLabel *label = [YYLabel new];
    //将上面的富文本设置过来
    label.attributedText = text;
    //设置Label的水平对齐格式
    //    label.textAlignment = NSTextAlignmentCenter;
    //设置垂直对齐格式
    //    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    //设置行数，0为多行
    label.numberOfLines = 0;
    //    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    label.frame = CGRectMake(0, 100, 100, 100);
    label.backgroundColor = [UIColor yellowColor];
    
    label.size = layout.textBoundingSize;
    label.textLayout = layout;
    
    [self.view addSubview:label];
    
}

- (void)texthighlight {
    CGFloat fontSize = 16.;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"点击"];
    //设置行间距
    text.lineSpacing = 2.5;
    //text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    //设置文本字号
    text.font = textFont;
    //设置字体颜色
    text.color = RGBA(158, 158, 158, 1);
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"注册"];
        one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"按钮，即表示您同意"];
        one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(158, 158, 158, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"《嚯货协议》"];
        one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
        [one setTextHighlightRange:one.rangeOfAll
                             color:RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"《嚯货协议》");
        }];
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"、"];
        one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        [text appendAttributedString:one];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"《嚯货隐私政策》"];
        one.lineSpacing = 2.5;
        one.font = textFont;
        one.color = RGBA(84, 84, 84, 1);
        //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
        [one setTextHighlightRange:one.rangeOfAll
                             color:RGBA(84, 84, 84, 1)
                   backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
            //自定义代码，此处根据需要调整
            NSLog(@"《嚯货隐私政策》");
            
        }];
        
        [text appendAttributedString:one];
    }
    
    //文本布局计算
    CGSize size = CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX);
    YYTextLayout * layout = [YYTextLayout layoutWithContainerSize:size text:text];
    
    //获取文本边界
    // get text bounding
    //    layout.textBoundingRect; //获取边界rect
    //    layout.textBoundingSize; //获得边界大小
    
    //查询文本布局
    // query text layout
    [layout lineIndexForPoint:CGPointMake(10,10)];
    [layout closestLineIndexForPoint:CGPointMake(10,10)];
    [layout closestPositionToPoint:CGPointMake(10,10)];
    [layout textRangeAtPoint:CGPointMake(10,10)];
    [layout rectForRange:[YYTextRange rangeWithRange:NSMakeRange(10,2)]];
    [layout selectionRectsForRange:[YYTextRange rangeWithRange:NSMakeRange(10,2)]];
    
    YYLabel *label = [YYLabel new];
    //将上面的富文本设置过来
    label.attributedText = text;
    //设置Label的水平对齐格式
    //    label.textAlignment = NSTextAlignmentCenter;
    //设置垂直对齐格式
    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    //设置行数，0为多行
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    label.frame = CGRectMake(0, 0, 100, 100);
    label.backgroundColor = [UIColor orangeColor];
    
    // text layout display
    label.size = layout.textBoundingSize;
    label.textLayout = layout;
    
    [self.view addSubview:label];
    
}

- (void)textTalk {
    
    NSString *authorStr = @"@小白君";
    NSString *talkStr = @"#火凤燎原#";
    NSString *content = @"#火凤燎原#漫画很好看，现在要出动画了。@小白君，快去看看吧。强推！！！\n《火凤燎原》是2001年开始出版的漫画作品，也是作者陈某继《不是人》之后，再度呈现一个纵横幻想与史实的三国时代漫画。其剧情发展以机略、谋算、智斗而为人所称道。@小白君@小白君@小白君#火凤燎原##火凤燎原##火凤燎原#";
    
    //字体
    CGFloat fontSize = 14.0;
    UIFont *textFont = [UIFont systemFontOfSize:fontSize];
    //颜色
    UIColor *textColor = [UIColor blackColor];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    //设置行间距
    text.lineSpacing = 8;
    text.lineSpacing = 8 - (textFont.lineHeight - textFont.pointSize);
    //设置文本字号
    text.font = textFont;
    //设置字体颜色
    text.color = textColor;
    
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:content];
//                one.lineSpacing = 2.5;
        one.font = textFont;
//                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
        [text appendAttributedString:one];
    }
    
    {
        //多个（字符串中出现的所有）
        NSMutableArray *mArry = [self getRangeStr:content findText:authorStr];
        for (NSNumber *number in mArry) {
            NSUInteger location = number.integerValue;
            NSUInteger length = authorStr.length;
            NSRange range = NSMakeRange(location, length);
            [text setTextHighlightRange:range
                                  color:[UIColor greenColor]
                        backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"点击了%@",authorStr);
            }];
        }
    }
    {
        //多个（字符串中出现的所有）
        NSMutableArray *mArry = [self getRangeStr:content findText:talkStr];
        for (NSNumber *number in mArry) {
            NSUInteger location = number.integerValue;
            NSUInteger length = talkStr.length;
            NSRange range = NSMakeRange(location, length);
            [text setTextHighlightRange:range
                                  color:[UIColor greenColor]
                        backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"点击了%@",talkStr);
            }];
        }
    }
    
//    ////单个（字符串中出现的第一个）
//    {
//        //单个（字符串中出现的第一个）
//        NSRange authorRange = [content rangeOfString:authorStr];
//        if(authorRange.location != NSNotFound){
//            NSLog(@"这个字符串中存在 authorRange");
//            [text setTextHighlightRange:authorRange
//                                  color:[UIColor greenColor]
//                        backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
//                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"点击了%@",authorStr);
//            }];
//        }
//    }
//    {
//        //单个（字符串中出现的第一个）
//        NSRange talkRange = [content rangeOfString:talkStr];
//        if(talkRange.location != NSNotFound){
//            NSLog(@"这个字符串中存在 authorRange");
//            [text setTextHighlightRange:talkRange
//                                  color:[UIColor greenColor]
//                        backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
//                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"点击了%@",talkStr);
//            }];
//        }
//    }
    
    //文本布局计算
    CGSize size = CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX);
    YYTextLayout * layout = [YYTextLayout layoutWithContainerSize:size text:text];
    
    //获取文本边界
    // get text bounding
    //    layout.textBoundingRect; //获取边界rect
    //    layout.textBoundingSize; //获得边界大小
    
    //查询文本布局
    // query text layout
    [layout lineIndexForPoint:CGPointMake(10,10)];
    [layout closestLineIndexForPoint:CGPointMake(10,10)];
    [layout closestPositionToPoint:CGPointMake(10,10)];
    [layout textRangeAtPoint:CGPointMake(10,10)];
    [layout rectForRange:[YYTextRange rangeWithRange:NSMakeRange(10,2)]];
    [layout selectionRectsForRange:[YYTextRange rangeWithRange:NSMakeRange(10,2)]];
    
    YYLabel *label = [YYLabel new];
    //将上面的富文本设置过来
    label.attributedText = text;
    //设置Label的水平对齐格式
    //    label.textAlignment = NSTextAlignmentCenter;
    //设置垂直对齐格式
//    label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    //设置行数，0为多行
    label.numberOfLines = 0;
//    label.lineBreakMode = NSLineBreakByCharWrapping;
    
    label.frame = CGRectMake(0, 200, 100, 100);
    label.backgroundColor = [UIColor purpleColor];
    
    label.size = layout.textBoundingSize;
    label.textLayout = layout;
    
    [self.view addSubview:label];
}

#pragma mark - 获取这个字符串中的所有xxx的所在的index
- (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
{
    
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    
    if (findText == nil && [findText isEqualToString:@""])
    {
        
        return nil;
        
    }
    
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    
    if (rang.location != NSNotFound && rang.length != 0)
    {
        
        [arrayRanges addObject:[NSNumber numberWithInteger:rang.location]];//将第一次的加入到数组中
        
        NSRange rang1 = {0,0};
        
        NSInteger location = 0;
        
        NSInteger length = 0;
        
        for (int i = 0;; i++)
        {
            
            if (0 == i)
            {//去掉这个xxx
                
                location = rang.location + rang.length;
                
                length = text.length - rang.location - rang.length;
                
                rang1 = NSMakeRange(location, length);
                
            }
            else
            {
                
                location = rang1.location + rang1.length;
                
                length = text.length - rang1.location - rang1.length;
                
                rang1 = NSMakeRange(location, length);
                
            }
            
            //在一个range范围内查找另一个字符串的range
            
            rang1 = [text rangeOfString:findText options:NSCaseInsensitiveSearch range:rang1];
            
            if (rang1.location == NSNotFound && rang1.length == 0)
            {
                
                break;
                
            }
            else//添加符合条件的location进数组
            
            [arrayRanges addObject:[NSNumber numberWithInteger:rang1.location]];
            
        }
        
        return arrayRanges;
        
    }
    
    return nil;
    
}
@end
