//
//  SearchViewController.m
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchBarController.h"
//#import "ACMacros.h"
#import "UIColor+color.h"
#import "THeader.h"

@interface SearchViewController () 
@property (nonatomic, strong) SearchBarController *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViews];

}

- (void)setupViews {
    SearchBarController *searchBar = [[SearchBarController alloc] init];
    searchBar.delegate = self;
    searchBar.view.frame = CGRectMake(0, 0 , Screen_Width, 100);
    [self.view addSubview:searchBar.view];
    [self addChildViewController:searchBar];
    self.searchBar = searchBar;
    
    
//  
//    SearchBar *searchBar = [[SearchBar alloc] initWithFrame:CGRectMake(0, 0 , KWidth, 52)];
////    searchBar.backgroundColor = [UIColor darkGrayColor];
//    searchBar.delegate = self;
//    [self.view addSubview:searchBar];
}

#pragma mark - SearchBarControllerDelegate
- (void)searchBarDidBeginEditing:(SearchBarController *)searchBar {
    
}

- (void)searchBarDidEndEditing:(SearchBarController *)searchBar {
    
}

- (void)searchBarDidChange:(SearchBarController *)searchBar {
    
}

- (void)searchBarShouldReturn:(SearchBarController *)searchBar {
    
}

- (void)searchBarDidCancel:(SearchBarController *)searchBar {
    
}
@end
