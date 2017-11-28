//
//  LZTagListVC.m
//  longzhu
//
//  Created by longzhu on 2017/10/30.
//  Copyright © 2017年 developer. All rights reserved.
//
#import "ViewController.h"

#import "LZTagListVC.h"
#import "LZTagListView.h"

@interface LZTagListVC ()
@property (nonatomic, strong) LZTagListView *tagListView;

@end

@implementation LZTagListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)addView{
    
    _tagListView= [[LZTagListView alloc]initWithFrame:self.view.bounds];
    _tagListView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tagListView];
//    _tagListView.frame= self.view.bounds;
    
//    [_tagListView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
}
@end
