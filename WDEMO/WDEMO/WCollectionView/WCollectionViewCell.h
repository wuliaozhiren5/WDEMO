//
//  WCollectionViewCell.h
//  WDEMO
//
//  Created by WDEMO on 2020/7/21.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *xibLabel;

@end

NS_ASSUME_NONNULL_END
