//
//  SearchViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchBar.h"
#import "SearchBarController.h"
//#import "ACMacros.h"
#import "UIColor+color.h"
#import "THeader.h"
#import "ChatViewController.h"

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
    [self.navigationController setNavigationBarHidden:YES animated:NO];

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
    
//    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, Screen_Width, 52)];
//    [self.view addSubview:barView];
//
//    SearchBarController *searchBar1 = [[SearchBarController alloc] init];
////    searchBar1.view.backgroundColor = [UIColor grayColor];
//    searchBar1.view.frame = CGRectMake(0, 0, Screen_Width, 52);
//    searchBar1.delegate = self;
//    [self addChildViewController:searchBar1];
//    [barView addSubview:searchBar1.view];
//    [searchBar1 didMoveToParentViewController:self];
    

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
//        vc.view.backgroundColor = [UIColor redColor];
//        vc.view.frame = CGRectMake(0, 100, Screen_Width, 10);
//    [self.view addSubview:vc.view];
//
//  [self addChildViewController:vc];
 
    SearchBar *searchBar = [[SearchBar alloc] initWithFrame:CGRectMake(0, 20, Screen_Width, 52)];
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    
//    ChatViewController *chat = [[ChatViewController alloc] init];
//    chat.view.backgroundColor = [UIColor grayColor];
//    chat.view.frame = CGRectMake(0, 100, Screen_Width, 380);
//    [self addChildViewController:chat];
//    [self.view addSubview:chat.view];
//    [chat didMoveToParentViewController:self];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //    ChatViewController *chat = [[ChatViewController alloc] init];
    //    chat.view.backgroundColor = [UIColor grayColor];
    //    chat.view.frame = CGRectMake(0, 100, Screen_Width, 380);
    //    [self addChildViewController:chat];
    //    [self.view addSubview:chat.view];
    //    [chat didMoveToParentViewController:self];
    
    
    //    ChatViewController *chat = [[ChatViewController alloc] init];
    //    chat.view.backgroundColor = [UIColor grayColor];
    //    chat.view.frame = CGRectMake(0, 100, Screen_Width, 380);
    //    [self addChildViewController:chat];
    //    [self.view addSubview:chat.view];
    //    [chat didMoveToParentViewController:self];
    
    //    ChatViewController *chat = [[ChatViewController alloc] init];
    //    chat.view.backgroundColor = [UIColor grayColor];
    //    chat.view.frame = CGRectMake(0, 100, Screen_Width, 380);
    //    [self addChildViewController:chat];
    //    [self.view addSubview:chat.view];
    //    [chat didMoveToParentViewController:self];
    
    //    ChatViewController *chat = [[ChatViewController alloc] init];
    //    chat.view.backgroundColor = [UIColor grayColor];
    //    chat.view.frame = CGRectMake(0, 100, Screen_Width, 380);
    //    [self addChildViewController:chat];
    //    [self.view addSubview:chat.view];
    //    [chat didMoveToParentViewController:self];

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
