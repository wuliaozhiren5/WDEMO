//
//  SearchBarController.h
//  WDEMO
//
//  Created by rrtv on 2021/1/19.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SearchBarControllerDelegate;

@interface SearchBarController : UIViewController
@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) id<SearchBarControllerDelegate> delegate;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
@end

@protocol SearchBarControllerDelegate <NSObject>
@optional
- (void)searchBarDidBeginEditing:(SearchBarController *)searchBar;
- (void)searchBarDidEndEditing:(SearchBarController *)searchBar;
- (void)searchBarDidChange:(SearchBarController *)searchBar;
- (void)searchBarShouldReturn:(SearchBarController *)searchBar;
- (void)searchBarDidCancel:(SearchBarController *)searchBar;
@end
NS_ASSUME_NONNULL_END
