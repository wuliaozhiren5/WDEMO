//
//  BigCollectionView.h
//  WDEMO
//
//  Created by Sun on 2020/7/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmallCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BigCollectionView : UICollectionView
@property(nonatomic,strong)SmallCollectionView *smallsCollectionView;

@end

NS_ASSUME_NONNULL_END
