//
//  ScoreViewController.m
//  WDEMO
//
//  Created by WDEMO on 2021/1/7.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "ScoreViewController.h"
#import "ScoreView.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //评分ScoreView
    ScoreView *scoreView = [[ScoreView alloc] initWithFrame:CGRectMake(0, 100, 100, 40)];
    [scoreView createScoreViewWithCount:5 width:20 height:20 spacing:10];
    [self.view addSubview:scoreView];
    [scoreView score:1.9];
    [scoreView score:1.9];
    [scoreView score:2];
    
//    [scoreView scoreAll:10];
    scoreView.backgroundColor = [UIColor grayColor];
    
    
    
    ScoreTitleView *scoreTitleView = [[ScoreTitleView alloc] initWithFrame:CGRectMake(0, 200, 320, 20)];
    [scoreTitleView createScoreViewWithCount:5 width:20 height:20 spacing:10];
    [scoreTitleView createScoreViewTitleWithTitltFont:[UIFont boldSystemFontOfSize:20] titltColor:[UIColor blueColor] titltSpacing:10];
    [self.view addSubview:scoreTitleView];
    [scoreTitleView score:2.1];
    [scoreTitleView scoreTitleStr:@"豆瓣评分2.1"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
