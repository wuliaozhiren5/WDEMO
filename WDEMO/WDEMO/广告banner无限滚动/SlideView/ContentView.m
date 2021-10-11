//
//  ContentView.m
//  DemoSlideView
//
//  Created by tony on 2020/8/26.
//  Copyright © 2020 tony. All rights reserved.
//

#import "ContentView.h"

@interface ContentView ()

@end

@implementation ContentView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];
}

- (void)createView {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    imageView.image = [UIImage imageNamed:@"Demo"];
    [self.view addSubview:imageView];
}

@end
