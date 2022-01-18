//
//  RRTalkCommentCell.m
//  NJVideo
//
//  Created by rrtv on 2021/12/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkCommentCell.h"

@implementation RRTalkCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setupViews {
    [super setupViews];
//    self.yyContentLab.userInteractionEnabled = NO;
    self.tableView.userInteractionEnabled = NO;
    self.photoCollectionView.userInteractionEnabled = NO;
    //剧集卡片darmaCard
    [self.contentView addSubview:self.darmaCard];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    //不显示剧透
    model.spoiler = NO;
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
    
    //图片高度
    CGFloat imageViewHeight = 0;
    imageViewHeight = self.photoCollectionView.frame.size.height;
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }

    //有剧集卡片
    BOOL isHasDrama = model.drama;
//    BOOL isHasDrama = YES;
//    BOOL isHasDrama = NO;
    if (isHasDrama) {
        self.darmaCard.hidden = NO;
        self.darmaCard.frame = CGRectMake(61, currentHeight + spacing, KWidth - 61 - 16, 51);
        self.darmaCard.model = model.drama;
        if (self.showDrama) {
            self.showDrama(self.model);
        }
    } else {
        self.darmaCard.hidden = YES;
        self.darmaCard.frame = CGRectMake(61, currentHeight + spacing, KWidth - 61 - 16, 0);
    }
    
    //剧集卡片高度
    CGFloat darmaCardHeight = 0;
    darmaCardHeight = self.darmaCard.frame.size.height;
    if (darmaCardHeight > 0) {
        currentHeight = currentHeight + spacing + darmaCardHeight;
    }
      
    //有回复
    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
    if (isHasReply) {
//        self.tableView.hidden = NO;
//        self.tableView.isHalf = self.isHalf;
//        self.tableView.count = model.replyCount;
//        self.tableView.data = model.replies;
//        self.tableView.model = model;
        self.tableView.frame = CGRectMake(61, spacing + currentHeight, (KWidth - 61 - 16), self.tableView.contentSize.height);
    } else {
        self.tableView.hidden = YES;
//        self.tableView.count = 0;
//        self.tableView.data = nil;
        self.tableView.frame = CGRectZero;
    }
    
    //tableView高度
    CGFloat tableViewHeight = self.tableView.frame.size.height;
    if (tableViewHeight > 0) {
        currentHeight = currentHeight + spacing + tableViewHeight;
    }
    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, bottomViewHeight);
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    //不显示剧透
    model.spoiler = NO;
    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
    //填充数据
//    CGFloat contentLabTop = [self getContentLabTop];
    CGFloat spacing = [self getSpacing];
//    CGFloat bottomViewHeight = [self getBottomViewHeight];
     
    //有剧集卡片
    BOOL isHasDrama = model.drama;
//    BOOL isHasDrama = YES;
//    BOOL isHasDrama = NO;
    
    //剧集卡片高度
    CGFloat darmaCardHeight = 0;
    if (isHasDrama) {
        darmaCardHeight = 51;
    } else {
        darmaCardHeight = 0;
    }
    if (darmaCardHeight > 0) {
        currentHeight = currentHeight + spacing + darmaCardHeight;
    }
    
    return currentHeight;
}

//查看全文
- (void)clickFullTextBtn {
    if (self.clickFullText) {
        self.clickFullText(self.model);
    }
}
#pragma mark -  lazy
- (RRTalkDarmaCard *)darmaCard {
    if (!_darmaCard) {
        _darmaCard = [[RRTalkDarmaCard alloc] initWithFrame:CGRectMake(0, 0, KWidth - 61 - 16, 51)];
        _darmaCard.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_2A2A2A;
        _darmaCard.layer.cornerRadius = 8;
        _darmaCard.layer.masksToBounds = YES;
        
        _darmaCard.userInteractionEnabled = YES;
        //单击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickDarmaCard:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [_darmaCard addGestureRecognizer:tap];
    }
    return _darmaCard;
}
 
- (void)clickDarmaCard:(UIGestureRecognizer *)gesture {
    
//    BOOL enable = self.model.drama.enable;
//    if (enable) {
//        NSString *dramaId = self.model.drama.dramaId;
//        [[RRAppLinkManager sharedManager] goSeasonDetail:dramaId title:nil isMovie:NO toRoot:NO];
//    }
    if (self.clickDrama) {
        self.clickDrama(self.model);
    }
}
@end
