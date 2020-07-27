//
//  ChatMemberListView.m
//  WDEMO
//
//  Created by rrtv on 2020/7/27.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMemberListView.h"
#import "ChatMemberListCell.h"

@interface ChatMemberListView () <UICollectionViewDelegate, UICollectionViewDataSource>

@end
@implementation ChatMemberListView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self addView];
        
    }
    return self;
    
}
- (void)addView {
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[ChatMemberListCell class] forCellWithReuseIdentifier:NSStringFromClass([ChatMemberListCell class])];
     
}


#pragma mark --UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 50;
            break;
        default:
            return 0;
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ChatMemberListCell *cell = (ChatMemberListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ChatMemberListCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
    NSString *str = [NSString stringWithFormat:@"%zi:%zi", indexPath.section, indexPath.row];
    cell.titleLabel.text = str;
    return cell;
    
}

#pragma mark -- UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    点击头像
}

-(BOOL)collectionView:(UICollectionView *)collectionView UICollectionViewDelegate:(NSIndexPath *)indexPath {
    return YES;
}
@end
