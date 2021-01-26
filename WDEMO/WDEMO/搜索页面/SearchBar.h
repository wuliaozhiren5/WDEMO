//
//  SearchBar.h
//  WDEMO
//
//  Created by rrtv on 2021/1/25.
//  Copyright © 2021 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SearchBarDelegate;

@interface SearchBar : UIView
@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) id<SearchBarDelegate> delegate;
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
@end

@protocol SearchBarDelegate <NSObject>
@optional
- (void)searchBarDidBeginEditing:(SearchBar *)searchBar;
- (void)searchBarDidEndEditing:(SearchBar *)searchBar;
- (void)searchBarDidChange:(SearchBar *)searchBar;
- (void)searchBarShouldReturn:(SearchBar *)searchBar;
- (void)searchBarDidCancel:(SearchBar *)searchBar;
@end
NS_ASSUME_NONNULL_END
