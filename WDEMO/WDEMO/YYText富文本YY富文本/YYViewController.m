//
//  YYViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/7/31.
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
    text.lineSpacing = 50;//text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
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
    text.lineSpacing = 2.5;//text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
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
    
    label.backgroundColor = [UIColor orangeColor];
    
    // text layout display
    label.size = layout.textBoundingSize;
    label.textLayout = layout;
    
    [self.view addSubview:label];
    
}

@end
