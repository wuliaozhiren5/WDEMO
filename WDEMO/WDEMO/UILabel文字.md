#UILabel文字
#UILabel最后一行显示标签


获取UILabel每一行显示的文字（UILabel 最后一行显示标签）
https://blog.csdn.net/iosrookie/article/details/47974103

ios获取UILabel每行显示的文字
https://www.jianshu.com/p/65a07b6013c7

//准备用
iOS超过行数的label在末尾加“全文”“更多”
https://www.jianshu.com/p/b34cfc7c4530

swift
iOS获取UILabel每行文字
https://www.jianshu.com/p/bd098e0ccaef





>原文
>iOS超过行数的label在末尾加“全文”“更多”
>https://www.jianshu.com/p/b34cfc7c4530


适合人群：iOS开发人员。

本文内容：获取UILabel每一行显示的文本。通过计算，在需要最后一行加上“...更多”。

备注：根据文本计算出控件UILabel上会显示多少行，以及每行实际显示的文本内容。

1.先展示下实现效果，如下图所示：

1.PNG

2.例子为新建一个项目，在自带文件ViewController界面中改动。

先简单介绍下思路：

因为文本可能很长，不能全部显示，只能显示到最多几行（例子为最多4行），所以，需要计算并获取指定文本的前四行文本字符串。然后，对该字符串裁剪和拼接“...更多>”，再用富文本展示出来。

代码如下：
```
ViewController.h

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@end

ViewController.m

#import "ViewController.h"

#import <CoreText/CoreText.h>

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];



    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.0, 100.0, SCREENWIDTH-30.0, 100.0)];

    label.font = [UIFont systemFontOfSize:16.0];

    label.numberOfLines = 4;

    [self.view addSubview:label];



    NSString *text = @"明月几时有？把酒问青天。不知天上宫阙，今夕是何年。我欲乘风归去，又恐琼楼玉宇，高处不胜寒。起舞弄清影，何似在人间？转朱阁，低绮户，照无眠。不应有恨，何事长向别时圆？人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。";



    //获取每行显示的文本

    label.text = text;

    NSArray *array = [self getSeparatedLinesFromLabel:label];

    NSLog(@"...%@", array);



    //组合需要显示的文本

    NSString *line4String = array[3];

    NSString *showText = [NSString stringWithFormat:@"%@%@%@%@...更多>", array[0], array[1], array[2], [line4String substringToIndex:line4String.length-5]];



    //设置label的attributedText

    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:showText attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0], NSForegroundColorAttributeName:[UIColor blackColor]}];

    [attStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0], NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(showText.length-3, 3)];

    label.attributedText = attStr;



}

- (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label

{

    NSString *text = [label text];

    UIFont  *font = [label font];

    CGRect    rect = [label frame];

    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);

    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];

    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];



    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);



    CGMutablePathRef path = CGPathCreateMutable();

    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));



    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);



    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);

    NSMutableArray *linesArray = [[NSMutableArray alloc]init];



    for (id line in lines)

    {

        CTLineRef lineRef = (__bridge CTLineRef )line;

        CFRange lineRange = CTLineGetStringRange(lineRef);

        NSRange range = NSMakeRange(lineRange.location, lineRange.length);



        NSString *lineString = [text substringWithRange:range];

        [linesArray addObject:lineString];

    }

    return linesArray;



}
```
完成。具体需求再改动就不难了。

---------------------

原文：https://blog.csdn.net/weixin_33969116/article/details/86881754

版权声明：本文为博主原创文章，转载请附上博文链接！

作者：小和大大
链接：https://www.jianshu.com/p/b34cfc7c4530
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
