//
//  SearchViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchBar.h"
//#import "SearchBarController.h"
//#import "ACMacros.h"
#import "UIColor+color.h"
#import "THeader.h"

@interface SearchViewController () <SearchBarDelegate>
//@property (nonatomic, strong) SearchBarController *searchBar;
@property (nonatomic, strong) SearchBar *searchBar;
 
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBar.translucent = NO;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupViews];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)setupViews {
//    SearchBarController *searchBar = [[SearchBarController alloc] init];
//
//    searchBar.view.backgroundColor = [UIColor grayColor];
//    searchBar.view.frame = CGRectMake(0, 20, Screen_Width, 10);
//    searchBar.delegate = self;
//
//    [self addChildViewController:searchBar];
//    [self.view addSubview:searchBar.view];
//    [searchBar didMoveToParentViewController:self];
    

//    self.searchBar = searchBar;
    //    searchBar.view.backgroundColor = [UIColor grayColor];
    //    searchBar.view.frame = CGRectMake(0, 0, Screen_Width, 52);
    //    searchBar.delegate = self;
    //    searchBar.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//        view.backgroundColor = [UIColor grayColor];
//        [self.view addSubview:view];
    
    
//        UIViewController *vc = [[UIViewController alloc] init];
//    //    vc.view.frame = CGRectMake(0, 0, Screen_Width, 52);
//        vc.view.backgroundColor = [UIColor grayColor];
//        vc.view.frame = CGRectMake(0, 0, Screen_Width, 10);
//    [self.view addSubview:vc.view];
//
//  [self addChildViewController:vc];

    
    SearchBar *searchBar = [[SearchBar alloc] initWithFrame:CGRectMake(0, 20, Screen_Width, 52)];
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
}

#pragma mark - SearchBarDelegate
- (void)searchBarDidBeginEditing:(SearchBar *)searchBar {
    
}
- (void)searchBarDidEndEditing:(SearchBar *)searchBar {
    
}
- (void)searchBarDidChange:(SearchBar *)searchBar {
    
}
- (void)searchBarShouldReturn:(SearchBar *)searchBar {
    
}
- (void)searchBarDidCancel:(SearchBar *)searchBar {
    
}
@end
