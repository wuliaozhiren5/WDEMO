//
//  LZTagListCell.h
//  xxx
//
//  Created by xxx on 2017/10/30.
//  Copyright © 2017年 developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTagListCell : UICollectionViewCell

@property(copy ,nonatomic)NSString *tagStr;
@property(assign ,nonatomic)BOOL isHideLine;
@property (nonatomic, strong) UIButton *tagBtn;

@end
