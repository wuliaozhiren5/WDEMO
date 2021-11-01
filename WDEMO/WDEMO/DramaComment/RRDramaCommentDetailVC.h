//
//  RRDramaCommentDetailVC.h
//  NJVideo
//
//  Created by rrtv on 2021/8/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "BaseViewController.h"
#import "RRSeniorCommentsModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol RRDramaCommentDetailVCDelegate;

@interface RRDramaCommentDetailVC : BaseViewController
@property (nonatomic, copy) NSString * __nullable dramaCommentId;//影评id
@property (nonatomic, strong) RRSeniorCommentsModel *passDramaCommentModel;//传入的影评model
@property (nonatomic, weak) id <RRDramaCommentDetailVCDelegate> delegate;

@end

@protocol RRDramaCommentDetailVCDelegate <NSObject>

@optional
- (void)dramaCommentDetailVC:(RRDramaCommentDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel;
- (void)closeDramaCommentDetailVC:(RRDramaCommentDetailVC *)vc;
@end
NS_ASSUME_NONNULL_END
