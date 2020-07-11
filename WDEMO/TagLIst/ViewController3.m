//
//  ViewController3.m
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *touchBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 40)];
    [touchBtn setTitle:@"click" forState:UIControlStateNormal];
    touchBtn.backgroundColor = [UIColor grayColor];
    [touchBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchBtn];
}
-(void)clickBtn:(UIButton *)btn {
    
    NSLog(@"333333");
}

@end
