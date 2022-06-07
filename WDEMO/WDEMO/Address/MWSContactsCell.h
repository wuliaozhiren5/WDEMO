//
//  MWSContactsCell.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSContactsCell : UITableViewCell

@property(nonatomic, strong) UILabel *titleLab;

@property(nonatomic, strong) UITextField *textField;

@property(nonatomic, strong) UIImageView *icon;

@property(nonatomic, strong) UIView *line;

- (void)setupViews;

@end

NS_ASSUME_NONNULL_END
