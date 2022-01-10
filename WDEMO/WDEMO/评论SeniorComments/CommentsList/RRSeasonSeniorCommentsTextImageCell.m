//
//  RRSeasonSeniorCommentsTextImageCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageCell.h"
//#import "HXPhotoPicker.h"

@implementation RRSeasonSeniorCommentsTextImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setupViews {
    [super setupViews];
    //image
    [self.contentView addSubview:self.photoCollectionView];
 
}
- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    //填充数据
    CGFloat contentLabTop = [[self class] getContentLabTop];
    CGFloat spacing = [[self class] getSpacing];
    CGFloat bottomViewHeight = [[self class] getBottomViewHeight];
  
    //当前高度
    CGFloat currentHeight = contentLabTop - spacing;
    //文字高度
    CGFloat textViewHeight = self.yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + spacing + textViewHeight;
    }
//    CGFloat currentHeight = contentLabTop + rect.size.height;
    //图片高度
    CGFloat imageViewHeight = 0;
    NSInteger imageCount = model.images.count;
    if (imageCount == 1) {
        //等于1张图
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        //        if (width > height) {
        //            showWidth = max * 4 / 3;
        //            showHeight = max;
        //
        //        } else if (width < height) {
        //            showWidth = max;
        //            showHeight = max * 4 / 3;
        //
        //        } else {
        //            showWidth = max;
        //            showHeight = max;
        //
        //        }
        //
        //        //5.9UI展示逻辑修改
        //        showWidth = (KWidth - 61 - 16) - 100;
        //        showHeight = showWidth;
        
        //5.12UI展示逻辑修改
        if (width > height) {
            showWidth = max;
            showHeight = max * 9 / 16;
            
        } else if (width < height) {
            showWidth = max;
            showHeight = showWidth * height / width;
            if (showHeight > max * 4 / 3) {
                showHeight = max * 4 / 3;
            }
            
        } else {
            showWidth = max;
            showHeight = max;
            
        }
  
        self.photoCollectionView.hidden = NO;
        self.photoCollectionView.frame = CGRectMake(x, y, showWidth, showHeight);
        self.photoCollectionView.data = model.images;
        imageViewHeight = showHeight;
        
    } else if (imageCount > 1) {
        //大于1张图
        //最大长度
        CGFloat maxWidth = (KWidth - 61 - 16);
        //最大高度
        CGFloat maxHeight = maxWidth;
        //间距
        CGFloat imageSpacing = 2;
        //单个长度
        CGFloat oneImageWidth = (KWidth - 61 - 16 - imageSpacing * 2) / 3;
        //最大高度
        CGFloat oneImageHeight = oneImageWidth;
        //实际长度
        CGFloat multiImageViewWidth = 0;
        //实际高度
        CGFloat multiImageViewHeight = 0;
  
        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;
        
        switch (imageCount) {
            case 0:
            case 1:
                multiImageViewWidth = 0;
                multiImageViewHeight = 0;
                break;
            case 2:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 3:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 4:
                multiImageViewWidth = oneImageWidth * 2 + imageSpacing;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 5:
            case 6:
                multiImageViewWidth = oneImageWidth * 3 + imageSpacing * 2;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 7:
            case 8:
            case 9:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
            default:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
        }
        
        self.photoCollectionView.hidden = NO;
        self.photoCollectionView.frame = CGRectMake(x, y, multiImageViewWidth, multiImageViewHeight);
        self.photoCollectionView.data = model.images;
        imageViewHeight = multiImageViewHeight;
    } else {
        //小于1张图
        self.photoCollectionView.hidden = YES;
        self.photoCollectionView.frame = CGRectZero;
        imageViewHeight = 0;
    }

    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }
    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, bottomViewHeight);
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
   
    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
    //填充数据
    CGFloat contentLabTop = [self getContentLabTop];
    CGFloat spacing = [self getSpacing];
//    CGFloat bottomViewHeight = [self getBottomViewHeight];
 
    //图片高度
    CGFloat imageViewHeight = 0;
    NSInteger imageCount = model.images.count;
    if (imageCount == 1) {
        //等于1张图
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = contentLabTop + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        //        if (width > height) {
        //            showWidth = max * 4 / 3;
        //            showHeight = max;
        //
        //        } else if (width < height) {
        //            showWidth = max;
        //            showHeight = max * 4 / 3;
        //
        //        } else {
        //            showWidth = max;
        //            showHeight = max;
        //
        //        }
        //
        //        //5.9UI展示逻辑修改
        //        showWidth = (KWidth - 61 - 16) - 100;
        //        showHeight = showWidth;
       
        //5.12UI展示逻辑修改
        if (width > height) {
            showWidth = max;
            showHeight = max * 9 / 16;
            
        } else if (width < height) {
            showWidth = max;
            showHeight = showWidth * height / width;
            if (showHeight > max * 4 / 3) {
                showHeight = max * 4 / 3;
            }
            
        } else {
            showWidth = max;
            showHeight = max;
            
        }
        
        imageViewHeight = showHeight;
    } else if (imageCount > 1) {
        //大于1张图
        //最大长度
        CGFloat maxWidth = (KWidth - 61 - 16);
        //最大高度
        CGFloat maxHeight = maxWidth;
        //间距
        CGFloat imageSpacing = 2;
        //单个长度
        CGFloat oneImageWidth = (KWidth - 61 - 16 - imageSpacing * 2) / 3;
        //最大高度
        CGFloat oneImageHeight = oneImageWidth;
        //实际长度
        CGFloat multiImageViewWidth = 0;
        //实际高度
        CGFloat multiImageViewHeight = 0;

        CGFloat x = 61;
        CGFloat y = spacing + currentHeight;

        switch (imageCount) {
            case 0:
            case 1:
                multiImageViewWidth = 0;
                multiImageViewHeight = 0;
                break;
            case 2:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 3:
                multiImageViewWidth = oneImageWidth * imageCount + imageSpacing * (imageCount - 1);
                multiImageViewHeight = oneImageHeight;
                break;
            case 4:
                multiImageViewWidth = oneImageWidth * 2 + imageSpacing;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 5:
            case 6:
                multiImageViewWidth = oneImageWidth * 3 + imageSpacing * 2;
                multiImageViewHeight = oneImageHeight * 2 + imageSpacing;
                break;
            case 7:
            case 8:
            case 9:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
            default:
                multiImageViewWidth = maxWidth;
                multiImageViewHeight = maxHeight;
                break;
        }
        imageViewHeight = multiImageViewHeight;
    } else {
        //小于1张图
        imageViewHeight = 0;
    }

    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }

    return currentHeight;
}

#pragma mark - 点击图片
//- (void)tapImageAction:(UITapGestureRecognizer *)tap {
//    [self previewClick];
//}

#pragma mark - RRSeasonSeniorCommentsPhotoCollectionViewDelegate
- (void)seasonSeniorCommentsPhotoCollectionView:(UICollectionView *)collectionView
                       didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.currentIndex = indexPath.item;
    [self previewClick];
}

#pragma mark - 点击图片photo
- (void)previewClick {
//    NSMutableArray *assetArray = [NSMutableArray array];
//    for (RRSeniorCommentsImageModel *object in self.model.images) {
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

#pragma mark - lazy
- (RRSeasonSeniorCommentsPhotoCollectionView *)photoCollectionView {
   if (!_photoCollectionView) {
       UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
       //垂直
       flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
       _photoCollectionView = [[RRSeasonSeniorCommentsPhotoCollectionView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), (KWidth - 61 - 16)) collectionViewLayout:flowLayout];
       _photoCollectionView.collectionViewDelegate = self;
       _photoCollectionView.scrollEnabled = NO;
//       _photoCollectionView.layer.cornerRadius = 8;
//       _photoCollectionView.layer.masksToBounds = YES;
       _photoCollectionView.hidden = NO;
   }
   return _photoCollectionView;
}
@end
