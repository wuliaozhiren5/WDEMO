//
//  TUIFaceView.m
//  UIKit
//
//  Created by kennethmiao on 2018/9/18.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "FaceView.h"
#import "FaceCell.h"
#import "ChatHeader.h"
#import "UIImage+ChatKit.h"

@implementation TFaceGroup
@end

@interface FaceView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *faceGroups;
@property (nonatomic, strong) NSMutableArray *sectionIndexInGroup;
@property (nonatomic, strong) NSMutableArray *pageCountInGroup;
@property (nonatomic, strong) NSMutableArray *groupIndexInSection;
@property (nonatomic, strong) NSMutableDictionary *itemIndexs;
@property (nonatomic, assign) NSInteger sectionCount;
@property (nonatomic, assign) NSInteger curGroupIndex;
@end

@implementation FaceView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
        [self defaultLayout];
    }
    return self;
}

- (void)setupViews {
    _faceFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    _faceFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _faceFlowLayout.minimumLineSpacing = 1;//TFaceView_Margin;
    _faceFlowLayout.minimumInteritemSpacing = 1;//TFaceView_Margin;
    _faceFlowLayout.sectionInset = UIEdgeInsetsMake(0, TFaceView_Page_Padding, 0, TFaceView_Page_Padding);
    
    _faceCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_faceFlowLayout];
    [_faceCollectionView registerClass:[FaceCell class] forCellWithReuseIdentifier:TFaceCell_ReuseId];
    _faceCollectionView.collectionViewLayout = _faceFlowLayout;
    //    _faceCollectionView.pagingEnabled = YES;
    _faceCollectionView.delegate = self;
    _faceCollectionView.dataSource = self;
    _faceCollectionView.showsHorizontalScrollIndicator = NO;
    _faceCollectionView.showsVerticalScrollIndicator = NO;
    _faceCollectionView.backgroundColor = self.backgroundColor;
    //    _faceCollectionView.alwaysBounceHorizontal = YES;
    [self addSubview:_faceCollectionView];
    
    [_faceCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [_faceCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
    _lineView = [[UIView alloc] init];
    //    _lineView.backgroundColor = [UIColor d_colorWithColorLight:TLine_Color dark:TLine_Color_Dark];
    [self addSubview:_lineView];
    
    _pageControl = [[UIPageControl alloc] init];
    //pageControl不可点击
    _pageControl.userInteractionEnabled = NO;
    //    _pageControl.currentPageIndicatorTintColor = [UIColor d_colorWithColorLight:TPage_Current_Color dark:TPage_Current_Color_Dark];
    //    _pageControl.pageIndicatorTintColor = [UIColor d_colorWithColorLight:TPage_Color dark:TPage_Color_Dark];
    [self addSubview:_pageControl];
    
    _sendMessageBtn= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    [_sendMessageBtn setTitle:@"发送" forState:UIControlStateNormal];
    _sendMessageBtn.backgroundColor = [UIColor grayColor];
    [_sendMessageBtn addTarget:self action:@selector(clickSendMessageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sendMessageBtn];
    
    _deleteBtn= [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    [_deleteBtn addTarget:self action:@selector(clickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_deleteBtn];
    
    _sendMessageBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    _sendMessageBtn.layer.masksToBounds = YES;
    _sendMessageBtn.layer.cornerRadius = 5;
    _sendMessageBtn.backgroundColor = InputBarTextViewColor;
    _deleteBtn.layer.masksToBounds = YES;
    _deleteBtn.layer.cornerRadius = 5;
    _deleteBtn.backgroundColor = InputBarTextViewColor;
}

- (void)showButton:(NSString *)str {
    BOOL flag;
    if (str.length>0) {
        flag =YES;
    }else {
        flag =NO;
    }
    
    if (!flag) {
        //不可以删状态
        [_deleteBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_delete_noclickable@2x"] forState:UIControlStateNormal];
        [_deleteBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_delete_noclickable@2x"] forState:UIControlStateHighlighted];
        [_sendMessageBtn setTitleColor:FaceButtonTextNoAvailable forState:UIControlStateNormal];
        _sendMessageBtn.backgroundColor = FaceButtonBackGroundNoAvailable;
    }else{
        //    //可以删状态
        [_deleteBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_delete@2x"] forState:UIControlStateNormal];
        [_deleteBtn setImage:[UIImage chat_imageNamed:@"ic_inputbox_delete@2x"] forState:UIControlStateHighlighted];
        
        [_sendMessageBtn setTitleColor:FaceButtonTextAvailable forState:UIControlStateNormal];
        _sendMessageBtn.backgroundColor = FaceButtonBackGroundAvailable;
    }
}

- (void)defaultLayout {
    _lineView.frame = CGRectMake(0, 0, self.frame.size.width, TLine_Heigh);
    //    _pageControl.frame = CGRectMake(0, self.frame.size.height - TFaceView_Page_Height, self.frame.size.width, TFaceView_Page_Height);
    _faceCollectionView.frame = CGRectMake(0,
                                           _lineView.frame.origin.y + _lineView.frame.size.height + TFaceView_Margin,
                                           self.frame.size.width,
                                           self.frame.size.height - _pageControl.frame.size.height - _lineView.frame.size.height - 2 * TFaceView_Margin);
    
    
    
    _sendMessageBtn.frame = CGRectMake(self.frame.size.width - TFaceView_Margin - 60, self.frame.size.height - TFaceView_Margin - 40 , 60, 40);
    
    _deleteBtn.frame = CGRectMake(_sendMessageBtn.frame.origin.x - TFaceView_Margin - 50 , self.frame.size.height - TFaceView_Margin - 40, 50, 40);
}

- (void)setData:(NSMutableArray *)data {
    _faceGroups = data;
    [self defaultLayout];
    [_faceCollectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //    return _sectionCount;
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    int groupIndex = [_groupIndexInSection[section] intValue];
    TFaceGroup *group = _faceGroups[groupIndex];
    return group.faces.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FaceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TFaceCell_ReuseId forIndexPath:indexPath];
    int groupIndex = [_groupIndexInSection[indexPath.section] intValue];
    TFaceGroup *group = _faceGroups[groupIndex];
    
    TFaceCellData *data = group.faces[indexPath.row];
    [cell setData:data];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(_delegate && [_delegate respondsToSelector:@selector(faceView:didSelectItemAtIndexPath:)]){
        
        [_delegate faceView:self didSelectItemAtIndexPath:indexPath];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    int groupIndex = [_groupIndexInSection[indexPath.section] intValue];
    TFaceGroup *group = _faceGroups[groupIndex];
    CGFloat width = (self.frame.size.width - TFaceView_Page_Padding * 2 - TFaceView_Margin * (group.itemCountPerRow - 1)) / group.itemCountPerRow;
    CGFloat height = (collectionView.frame.size.height -  TFaceView_Margin * (group.rowCount - 1)) / group.rowCount;
    return CGSizeMake(width, height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(screenWidth, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        //        header.backgroundColor = [UIColor whiteColor];
        return header;
        
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        //        footer.backgroundColor = [UIColor whiteColor];
        return footer;
        
    } else {
        return nil;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

-(void)clickSendMessageBtn:(UIButton *)btn {
    if(_delegate && [_delegate respondsToSelector:@selector(faceViewSendMessage:)]){
        [_delegate faceViewSendMessage:self];
    }
}

-(void)clickDeleteBtn:(UIButton *)btn {
    if(_delegate && [_delegate respondsToSelector:@selector(faceViewDidBackDelete:)]){
        [_delegate faceViewDidBackDelete:self];
    }
}
@end
