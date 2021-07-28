//
//  ZZStarViewVC.m
//  ZZToolsDemo
//
//  Created by 刘猛 on 2019/2/1.
//  Copyright © 2019年 刘猛. All rights reserved.
//

#import <Masonry.h>
//#import "ZZTools.h"
//#import <SDAutoLayout.h>
#import "ZZStarViewVC.h"
#import "ZZStarView.h"

@interface ZZStarViewVC ()

/**星星评价*/
@property (nonatomic , strong) ZZStarView   *starView;

@end

@implementation ZZStarViewVC

///在load方法中注册路由
+ (void)load {
//    [[ZZRouter shared] mapRoute:@"app/demo/starView" toControllerClass:[self class]];//星星评价
}

- (void)viewDidLoad {
    
    [super viewDidLoad];self.title = @"星星评价";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //第一个
    [self setupFirstStarView];

    //第二个
    [self setupSecondStarView];
    
    //第三个
    [self setupThirdStarView];
    
    //用作标题提示, 与demo使用无关.
    [self createTitleLabels];
   
}

///第一个, 基础用法
- (void)setupFirstStarView {
    
    self.starView = [[ZZStarView alloc] initWithImage:[UIImage imageNamed:@"star"] selectImage:[UIImage imageNamed:@"didStar"] starWidth:20 starHeight:20 starMargin:5 starCount:5 callBack:^(CGFloat userGrade, CGFloat finalGrade) {
        NSLog(@"用户实际选择分 === %.2f, 最终分 === %.2f", userGrade, finalGrade);
    }];
    //默认值, 可以不写, 用户可选分值范围是0.5的倍数.(建议在设置分值之前确定此值)
    self.starView.sublevel = 0.5;
    //设置分值, 可以不写, 默认显示0分.(self.params是UIViewController在ZZRouter中扩展的属性, 包含了所有参数)
//    self.starView.grade = [self.params[@"grade1"] floatValue];
    //最小值, 默认0.5可以不写, 用户可以设置的最低分值.
    self.starView.miniGrade = 0;
    [self.view addSubview:self.starView];
    //设置位置, 定位左上角, 宽高为固定写法
    self.starView.frame = CGRectMake(50, 220, self.starView.bounds.size.width, self.starView.bounds.size.height);
    
}

///第二个, 指明了如何配合屏幕适配框架使用
- (void)setupSecondStarView {
    
    ZZStarView *starView = [[ZZStarView alloc] initWithImage:[UIImage imageNamed:@"star"] selectImage:[UIImage imageNamed:@"didStar"] starWidth:20 starHeight:20 starMargin:5 starCount:10 callBack:^(CGFloat userGrade, CGFloat finalGrade) {
        NSLog(@"用户实际选择分 === %.2f, 最终分 === %.2f", userGrade, finalGrade);
    }];
    starView.sublevel = 1;
//    starView.grade = [self.params[@"grade2"] floatValue];
    starView.miniGrade = 2;
    [self.view addSubview:starView];
    
    //普通的设置frame用法
    starView.frame = CGRectMake(50, 310, starView.bounds.size.width, starView.bounds.size.height);
    
    /**frame, SDAutoLayout, Masonry任选其一即可
     //SDAutoLayout用法
     starView.sd_layout.leftSpaceToView(self.view, 50).topSpaceToView(self.view, 310)
     .widthIs(starView.bounds.size.width).heightIs(starView.bounds.size.height);
     
     //Masonry用法
     [starView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(@50);
         make.top.equalTo(@310);
         make.width.equalTo(@(starView.bounds.size.width));
         make.height.equalTo(@(starView.bounds.size.height));
     }];
     */
    
}

///第三个, 指明了如何让ZZStarView自身超出其父视图, 依然有效, 实际使用建议父视图宽高大于ZZStarView
- (void)setupThirdStarView {
    
//    StarSuperView *darkView = [[StarSuperView alloc] initWithGrade:[self.params[@"grade3"] floatValue]];
    StarSuperView *darkView = [[StarSuperView alloc] initWithGrade:0.0];
    [self.view addSubview:darkView];
    
}

///用作标题提示, 与demo使用无关.
- (void)createTitleLabels {
    
    UILabel *tipLabel = [[UILabel alloc] init];
    [self.view addSubview:tipLabel];
    tipLabel.frame = CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 20);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor darkTextColor];
    tipLabel.text = @"支持自定义星星图, 整星, 半星, 任意进度星";
    
    UILabel *label1 = [[UILabel alloc] init];
    [self.view addSubview:label1];
    label1.frame = CGRectMake(50, 190, 300, 20);
    label1.textAlignment = NSTextAlignmentLeft;
    label1.textColor = [UIColor darkTextColor];
    label1.text = @"1. 分阶=0.5(半星), 最低分=0";
    
    UILabel *label2 = [[UILabel alloc] init];
    [self.view addSubview:label2];
    label2.frame = CGRectMake(50, 280, 300, 20);
    label2.textAlignment = NSTextAlignmentLeft;
    label2.textColor = [UIColor darkTextColor];
    label2.text = @"2. 分阶=1(整星), 最低分=2";
    
    UILabel *label3 = [[UILabel alloc] init];
    [self.view addSubview:label3];
    label3.frame = CGRectMake(50, 370, 300, 50);
    label3.textAlignment = NSTextAlignmentLeft;
    label3.textColor = [UIColor darkTextColor];
    label3.numberOfLines = 2;
    label3.text = @"3. 分阶=0.01(任意星), 最低分=0, 超出蓝色父视图依然可用";
    
}

///在这里给出了通过路由将值反向传出的例子, 一般写在事件内
- (void)dealloc {
//    if (self.routerCallBack) {
//        //页面路由反向传值, 字典内请尽量使用json字符串, 避免回传对象, 特别是自定义类的对象, 做到谁使用, 谁解析! 想象成数据使用方调了一个接口, 这里是接口给了返回值.
//        self.routerCallBack(@{ @"code": @"1", @"data": @"jsonString, 可用于具体的数据回调, jsonString内容请自行处理" });
//    }
}

@end

# pragma mark- ZZStarView超出其父视图的使用示例(这里只是在同一个文件写了两个类)
@interface StarSuperView ()

@property (nonatomic, strong) ZZStarView *starView;

@end

@implementation StarSuperView

///这里自定义init方法是为了传入预设分数
- (instancetype)initWithGrade:(CGFloat)grade {
    if (self == [super init]) {
        ZZStarView *starView = [[ZZStarView alloc] initWithImage:[UIImage imageNamed:@"star"] selectImage:[UIImage imageNamed:@"didStar"] starWidth:20 starHeight:20 starMargin:5 starCount:8 callBack:^(CGFloat userGrade, CGFloat finalGrade) {
            NSLog(@"用户实际选择分 === %.2f, 最终分 === %.2f", userGrade, finalGrade);
        }];
        starView.sublevel = 0.01;
        starView.grade = grade;
        starView.miniGrade = 0.0;
        self.starView = starView;
        [self addSubview:starView];
        starView.frame = CGRectMake(0, 0, starView.bounds.size.width, starView.bounds.size.height);
        self.frame = CGRectMake(50, 430, starView.bounds.size.width / 2, starView.bounds.size.height + 2);
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

///实现超出其父视图可用的关键部分, 也可参照按钮超出父视图不可点击的解决方案.
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [self.starView convertPoint:point fromView:self];
       //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.starView.bounds, tempPoint)){
            //返回starView
            return self.starView;
        }
    }
    return view;
}

@end
