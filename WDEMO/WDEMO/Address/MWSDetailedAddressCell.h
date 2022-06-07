//
//  MWSDetailedAddressCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSDetailedAddressCell : UITableViewCell <UITextViewDelegate>

@property(nonatomic, strong) UILabel *titleLab;

@property(nonatomic, strong) UITextView *textView;

@property(nonatomic, strong) UILabel *textViewPlaceholder;

@property(nonatomic, strong) UIView *line;

@end

NS_ASSUME_NONNULL_END
