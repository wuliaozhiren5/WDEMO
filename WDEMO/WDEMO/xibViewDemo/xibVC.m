//
//  xibVC.m
//  WDEMO
//
//  Created by WDEMO on 2020/12/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "xibVC.h"
//xib
#import "xibView.h"
@interface xibVC ()

@end

@implementation xibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. 
    [self setupViews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupViews {
    //create xib
    xibView *xib = [xibView initWithXib];
    xib.frame = CGRectMake(0, 0, 100, 210);
    [self.view addSubview:xib];
    
}

@end
