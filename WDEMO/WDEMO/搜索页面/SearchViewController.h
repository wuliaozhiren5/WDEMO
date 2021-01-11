//
//  SearchViewController.h
//  WDEMO
//
//  Created by rrtv on 2021/1/9.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@protocol SearchBarDelegate;
 
@interface SearchViewController : BaseViewController

@end

@interface SearchBar : UIView
@property (nonatomic, copy) NSString *text;
@property (nonatomic, weak) id<SearchBarDelegate> delegate;
@end

@protocol SearchBarDelegate <NSObject>
@optional
- (void)searchBarDidBeginEditing:(SearchBar *)searchBar;
- (void)searchBarDidEndEditing:(SearchBar *)searchBar;
- (void)searchBarDidChange:(SearchBar *)searchBar;
- (void)searchBarShouldReturn:(SearchBar *)searchBar;

//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)); // if implemented, called in place of textFieldDidEndEditing:
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
//
//- (void)textFieldDidChangeSelection:(UITextField *)textField API_AVAILABLE(ios(13.0), tvos(13.0));
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
@end

NS_ASSUME_NONNULL_END
