//
//  RRDramaCommentDetailImageScrollView.m
//  NJVideo
//
//  Created by rrtv on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentDetailImageScrollView.h"
//#import "HXPhotoPicker.h"

@interface RRDramaCommentDetailImageScrollView () <UIScrollViewDelegate>

@end
@implementation RRDramaCommentDetailImageScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)setupViews {
    [self addSubview:self.scrollView];
    [self addSubview:self.pageLabBackgroundView];
    [self addSubview:self.pageLab];
    self.clipsToBounds = YES;
}

- (void)updateViews {
    //将所有子视图从父视图上移除
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    self.scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
     
    NSInteger index = 0;
    NSInteger n = self.imageArr.count;
//    n = 9;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    for (NSInteger i = 0 ; i < n; i++) {
        RRSeniorCommentsImageModel *imageModel = self.imageArr[i];
        NSInteger modelImageWidth = imageModel.width;
        NSInteger modelImageHeight = imageModel.height;
        NSInteger showImageWidth = width;
        NSInteger showImageHeight = height;
        
        CGFloat orginY = 0;
        //图片尺寸转变，图片的宽width = 屏幕点宽，计算出图片的高height
        showImageHeight = showImageWidth * modelImageHeight / modelImageWidth;
        if (showImageHeight <= height) {
            showImageHeight = height;
        } else {
            //图片居中
            orginY = -(showImageHeight - height) / 2.0;
        }
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.frame = CGRectMake(width * i, orginY, showImageWidth, showImageHeight);
//        imgV.backgroundColor = kCOLOR_dynamicProvider_E6E7E8_333333;
        //UIViewContentModeScaleAspectFit会保证图片比例不变
        imgV.contentMode = UIViewContentModeScaleAspectFit;
        imgV.userInteractionEnabled = YES;
        imgV.tag = i;
        //产品要求不需要显示403图片
//        [imgV rr_delaySetImageWithURLString:imageModel.url placeholderImage:nil];
//        [imgV rr_downloadImageWithURLString:imageModel.url placeholderImage:KplaceholderImg];
        UITapGestureRecognizer *tapGesturRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
        [imgV addGestureRecognizer:tapGesturRecognizer];
        [self.scrollView addSubview:imgV];
    }
    
    self.scrollView.contentSize = CGSizeMake(width * n, height);
//    self.pageLab.text = @"1/9";
    self.pageLab.text = [NSString stringWithFormat:@"%zi/%zi", (index + 1), n];
    CGSize labSize = [self.pageLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    self.pageLabBackgroundView.frame = CGRectMake(width - (labSize.width + 5 * 2) - 10, height - 20 - 10, labSize.width + 5 * 2, 20);
    self.pageLab.frame = CGRectMake(0, 0, labSize.width, 20);
    self.pageLab.center = self.pageLabBackgroundView.center;
    //滑动
    [self scrollViewDidEndScroll];
}

- (void)setImageArr:(NSArray *)imageArr {
    _imageArr = imageArr;
    [self updateViews];
}

#pragma - mark UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}

- (void)scrollViewDidEndScroll {
    //在这里写监听滑动停止要做的事
    NSInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    NSInteger n = self.scrollView.contentSize.width / self.scrollView.frame.size.width;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    self.pageLab.text = [NSString stringWithFormat:@"%zi/%zi", (index + 1), n];
    CGSize labSize = [self.pageLab sizeThatFits:CGSizeMake(MAXFLOAT, 20)];
    self.pageLabBackgroundView.frame = CGRectMake(width - (labSize.width + 5 * 2) - 10, height - 20 - 10, labSize.width + 5 * 2, 20);
    self.pageLab.frame = CGRectMake(0, 0, labSize.width, 20);
    self.pageLab.center = self.pageLabBackgroundView.center;
}

#pragma mark - 点击图片
- (void)clickImage:(UITapGestureRecognizer *)tap {
    self.currentIndex = tap.view.tag;
    [self previewClick];
    
}


#pragma mark - 点击图片photo
- (void)previewClick {
//    NSMutableArray *assetArray = [NSMutableArray array];
//    for (RRSeniorCommentsImageModel *object in self.imageArr) {
//        HXCustomAssetModel *assetModel = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:object.url] selected:YES];
//        [assetArray addObject:assetModel];
//
//    }
//
//    if (self.currentIndex < 0 || self.currentIndex > assetArray.count - 1 || !assetArray.count) {
//        return;
//    }
//
//    HXPhotoManager *photoManager = [HXPhotoManager managerWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
//    photoManager.configuration.saveSystemAblum = YES;
//    photoManager.configuration.photoMaxNum = 0;
//    photoManager.configuration.videoMaxNum = 0;
//    photoManager.configuration.maxNum = 10;
//    photoManager.configuration.selectTogether = YES;
//    photoManager.configuration.photoCanEdit = NO;
//    photoManager.configuration.videoCanEdit = NO;
//
//    HXWeakSelf
//    // 长按事件
//    photoManager.configuration.previewRespondsToLongPress = ^(UILongPressGestureRecognizer *longPress, HXPhotoModel *photoModel, HXPhotoManager *manager, HXPhotoPreviewViewController *previewViewController) {
//        HXPhotoBottomViewModel *model = [[HXPhotoBottomViewModel alloc] init];
//        model.title = @"保存";
////        model.subTitle = @"这是一个长按事件";
//        [HXPhotoBottomSelectView showSelectViewWithModels:@[model] headerView:nil cancelTitle:nil selectCompletion:^(NSInteger index, HXPhotoBottomViewModel * _Nonnull model) {
//            if (index == 0) {
//                // 保存，处理...
//                UIImageWriteToSavedPhotosAlbum(photoModel.previewPhoto, nil, nil, nil);
//                TOAST(@"保存成功");
//            }
//        } cancelClick:nil];
////        hx_showAlert(previewViewController, @"提示", @"长按事件", @"确定", nil, nil, nil);
//    };
//
//    // 跳转预览界面时动画起始的view
//    photoManager.configuration.customPreviewFromView = ^UIView *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell;
//        return nil;
//
//    };
//    // 跳转预览界面时展现动画的image
//    photoManager.configuration.customPreviewFromImage = ^UIImage *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell.imageView.image;
//        return nil;
//    };
//    // 退出预览界面时终点view
//    photoManager.configuration.customPreviewToView = ^UIView *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell;
//        return nil;
//    };
//
//    [photoManager addCustomAssetModel:assetArray];
//    UIViewController *topVC = [UIViewController topViewController];
//
//    NSInteger currentIndex = self.currentIndex;
//    if (!self.isHalf) {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                              currentIndex:currentIndex
//                                                 photoView:nil];
//    } else {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                     showBottomPageControl:YES
//                                              currentIndex:currentIndex
//                                                 photoView:nil
//                                                    height:playerViewHeight()];
//    }
}

#pragma - mark lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UILabel *)pageLab {
    if (!_pageLab) {
        _pageLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _pageLab.font = SYSTEMFONT(12);
        _pageLab.textColor = kCOLOR_FFFFFF;
    }
    return _pageLab;
}

- (UIView *)pageLabBackgroundView {
    if (!_pageLabBackgroundView) {
        _pageLabBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        _pageLabBackgroundView.backgroundColor = [kCOLOR_000000 colorWithAlphaComponent:0.5];
        _pageLabBackgroundView.layer.cornerRadius = 10;
        _pageLabBackgroundView.layer.masksToBounds = YES;
    }
    return _pageLabBackgroundView;
}
@end
