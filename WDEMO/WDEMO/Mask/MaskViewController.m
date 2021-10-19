//
//  MaskViewController.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//
#define textstr @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."

#define textstr1 @"Gradient：本身就是梯度的意思，所以在这里就是作为渐变色来理解\
1，CAGradientLayer用于处理渐变色的层结构\
2，CAGradientLayer的渐变色可以做隐式动画\
3，大部分情况下，CAGradientLayer时和CAShapeLayer配合使用的。\
4，CAGradientLayer可以用作PNG的遮罩效果\
关于CAGradientLayer的坐标系统\
为什么要提到CAGradientLayer的坐标系统呢？因为渐变色的作用范围，变化梯度的方向，颜色变换的作用点都和CAGradientLayer的坐标系统有关 "

#import "MaskViewController.h"
#import <Masonry/Masonry.h>
@interface MaskViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITextView *bioText;

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //渐变透明
    [self creatTableView];
    //渐变透明
    [self creatTextView];
    //渐变
    [self creatColorLabel];
}

- (void)creatColorLabel{
//    使用CAGradientLayer还可以处理文字渐变效果
    NSString* str = textstr1;
    UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 200, 200)];
    lab.numberOfLines = 0;
    lab.text = str;
    lab.font = [UIFont systemFontOfSize:13];
    [lab sizeToFit];
    [self.view addSubview:lab];
    
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = lab.frame;
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor blueColor].CGColor,(id)[UIColor yellowColor].CGColor];;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
//    gradientLayer.locations = gradient.locations = @[@(0.0f), @(0.5f), @(1.0f)];
    [self.view.layer addSublayer:gradientLayer];
    
    gradientLayer.mask = lab.layer;
    lab.frame = gradientLayer.bounds;
}

- (void)creatTextView {
    UIView *subview = [[UIView alloc]init];
    subview.backgroundColor = [UIColor redColor];
    subview.frame = CGRectMake(0, 0, 150, 150);
    subview.center = self.view.center;
    subview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:subview];
    
    UITextView *textView = [[UITextView alloc]init];
    textView.frame = CGRectMake(0, 0, 150, 150);
    [subview addSubview:textView];
    textView.text = textstr;
    self.bioText = textView;
    //    有的时候为了展示下面还有文字，需要添加一个灰度的遮罩效果，例如textview中文字过长，需要再下面添加一个遮罩效果，这个时候可以用CAGradientLayer来处理，方法如下：
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bioText.superview.bounds;
    
    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor yellowColor].CGColor];
    gradient.startPoint = CGPointMake(0, 0.0);
    gradient.endPoint = CGPointMake(0, 0.2);
    self.bioText.superview.layer.mask = gradient;
    //subview可以和textview一样尺寸即可
}

- (void)creatTableView {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *subview = [[UIView alloc]init];
    //    subview.backgroundColor = [UIColor redColor];
    subview.frame = self.view.bounds;
    [self.view addSubview:subview];
    [subview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
 
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.frame = self.view.bounds;;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    //codecell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [subview addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(subview);
    }];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.tableView.superview.bounds;
    gradient.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor yellowColor].CGColor];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 0.2);
    self.tableView.superview.layer.mask = gradient;
   
}
 
#pragma mark -- UITableViewDataSource
//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

//row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zi",indexPath.row];
    
    //cell的右边有一个小箭头，距离右边有十几像素；
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置cell分割线的edge可以设置去除指定cell的分割线
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //tableviewCell点击取消选中变灰效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
