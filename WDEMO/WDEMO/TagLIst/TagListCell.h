//
//  TagListCell.h
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TagListCell : UICollectionViewCell

@property(copy ,nonatomic)NSString *tagStr;
@property(assign ,nonatomic)BOOL isHideLine;
@property (nonatomic, strong) UIButton *tagBtn;

@property(assign , nonatomic)UIColor *textHighlightColor;
@property(assign , nonatomic)UIColor *textDefaultColor;
@property(assign , nonatomic)UIColor *textHighBackgroundColor;

@end

NS_ASSUME_NONNULL_END
