//
//  TagListViewController.m
//  WDEMO
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "TagListViewController.h"
#import <Masonry/Masonry.h>

#import "TagListView.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface TagListViewController ()<TagListViewDataSource>

@property (nonatomic, strong) TagListView *tagListView;

@end

@implementation TagListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    // Do any additional setup after loading the view.
    
    [self addView];
}
-(void)addView{
    
    
//    NSArray *arr = @[@"全部",
//       @"全部1",
//       @"全部2",
//       @"全部3",
//       @"全部4",
//                     @"全部5"];
    
    NSArray *arr = @[@"全部",
    @"全部1",
    @"全部2",
    @"全部3",
    @"全部4",
    @"全部5",
    @"全部6",
    @"全部7",
    @"全部8",
    @"全部9",
    @"全部10"];
    _tagListView= [[TagListView alloc]initWithFrame:self.view.bounds
                                             tagArr:arr
                                              index:0
                                     textDefaultColor:[UIColor grayColor]
                                   textHighlightColor:[UIColor whiteColor]
                              textHighBackgroundColor:[UIColor redColor]];
    _tagListView.backgroundColor = [UIColor whiteColor];
    _tagListView.dataSource = self;
    
    
    [self.view addSubview:_tagListView];
    _tagListView.frame= self.view.bounds;
    
    [_tagListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}


-(UIView *)tagListView:(TagListView *)tagListView didSelectItemAtIndex:(NSInteger)index{
    
    NSInteger pageIndex = index;
    switch (pageIndex) {
        case 0:
        {
            ViewController1 *vc=[[ViewController1 alloc]init];
            vc.view.backgroundColor = [UIColor whiteColor];
            [self addChildViewController:vc];
            return vc.view;
        }
            break;
            
        case 1:
        {
            ViewController2 *vc=[[ViewController2 alloc]init];
            vc.view.backgroundColor = [UIColor blueColor];
            [self addChildViewController:vc];
            return vc.view;
        }
            break;
          
        case 2:
        {
            ViewController3 *vc=[[ViewController3 alloc]init];
            vc.view.backgroundColor = [UIColor yellowColor];
            [self addChildViewController:vc];
            return vc.view;
        }
            break;
            
        default:
        {
            UIViewController *vc=[[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor grayColor];
            [self addChildViewController:vc];
            return vc.view;
        }
            
            break;
    }
    
}

@end
