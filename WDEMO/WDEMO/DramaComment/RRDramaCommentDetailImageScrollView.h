//
//  RRDramaCommentDetailImageScrollView.h
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRDramaCommentDetailImageScrollView : UIView 

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *pageLab;
@property (nonatomic, strong) UIView *pageLabBackgroundView;

@property (nonatomic, copy) NSArray *imageArr;
//点击图片的currentIndex
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) BOOL isHalf;          //半屏 
@end

NS_ASSUME_NONNULL_END
