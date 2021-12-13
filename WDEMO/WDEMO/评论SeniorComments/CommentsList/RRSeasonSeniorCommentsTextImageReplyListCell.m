//
//  RRSeasonSeniorCommentsTextImageReplyListCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextImageReplyListCell.h"
#import "RRSeasonSeniorCommentsDetailVC.h"
//#import "RRAppLinkManager.h"

@interface RRSeasonSeniorCommentsTextImageReplyListCell () <RRSeasonSeniorCommentsDetailVCDelegate, RRSeasonSeniorCommentsReplyTableViewDelegate>
//@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;
@end
@implementation RRSeasonSeniorCommentsTextImageReplyListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.isShowMore = NO;
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
    //replyTable
    [self.contentView addSubview:self.tableView];
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
    //图片高度
    CGFloat imageViewHeight = 0;
    imageViewHeight = self.photoCollectionView.frame.size.height;
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + spacing + imageViewHeight;
    }
    
    //有回复
    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
    
    if (isHasReply) {
        self.tableView.hidden = NO;
        self.tableView.isHalf = self.isHalf;
        self.tableView.count = model.replyCount;
        self.tableView.data = model.replies;
        self.tableView.model = model;
        self.tableView.frame = CGRectMake(61, currentHeight + spacing, (KWidth - 61 - 16), self.tableView.contentSize.height);
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
   
    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
    //填充数据
//    CGFloat contentLabTop = [self getContentLabTop];
    CGFloat spacing = [self getSpacing];
//    CGFloat bottomViewHeight = [self getBottomViewHeight];
    
    RRSeasonSeniorCommentsReplyTableView *tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), 100)];
    tableView.scrollEnabled = NO;
    //有回复
    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
 
    if (isHasReply) {
        tableView.hidden = NO;
        tableView.count = model.replyCount;
        tableView.data = model.replies;
        tableView.model = model;
        tableView.frame = CGRectMake(61, currentHeight + spacing, (KWidth - 61 - 16), tableView.contentSize.height);
    } else {
        tableView.hidden = YES;
//        self.tableView.count = 0;
//        self.tableView.data = nil;
        tableView.frame = CGRectZero;
    }
    
    //tableView高度
    CGFloat tableViewHeight = tableView.frame.size.height;
    if (tableViewHeight > 0) {
        currentHeight = currentHeight + spacing + tableViewHeight;
    }
    return currentHeight;
}
 
 
//查看全文
- (void)clickFullTextBtn {
    [self gotoReplyVCWithCommentModel:self.model replyModel:nil isShowMore:YES];

}

//收起
- (void)clickCutTextBtn {

}

#pragma mark -  RRSeasonSeniorCommentsReplyTableViewDelegate
- (void)seasonSeniorCommentsReplyTableView:(UITableView *)tableView
                   didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model;
    //indexPath存在说明点了cell
    //indexPath不存在说明点了头或脚
    if (indexPath) {
        model = [self.model.replies objectOrNilAtIndex:indexPath.row];
    }
    [self gotoReplyVCWithCommentModel:self.model replyModel:model isShowMore:NO];
}

//跳转到回复列表
- (void)gotoReplyVCWithCommentModel:(RRSeniorCommentsModel *)commentModel replyModel:(RRSeniorCommentsModel *)replyModel isShowMore:(BOOL)isShowMore {
    if (self.clickReplyListCell) {
        self.clickReplyListCell(commentModel, replyModel, isShowMore);
    }
    return;
    
//    if (!self.isHalf) {
//        RRSeasonSeniorCommentsDetailVC *vc = [[RRSeasonSeniorCommentsDetailVC alloc] initWithIsHalf:NO];
//        vc.commentModel = commentModel;
//        NSString *replyId = replyModel ? replyModel.ID : nil;
//        vc.replyId = replyId;
//        vc.delegate = self;
//        [[RRAppLinkManager sharedManager] pushViewController:vc animated:YES];
//    } else {
//        RRSeasonSeniorCommentsDetailVC *vc = [[RRSeasonSeniorCommentsDetailVC alloc] initWithIsHalf:YES];
//        vc.commentModel = commentModel;
//        NSString *replyId = replyModel ? replyModel.ID : nil;
//        vc.replyId = replyId;
//        vc.delegate = self;
//        UIViewController *topVC = [UIViewController topViewController];
//    //    UIViewController *topVC = self.fatherVC;
//        [topVC addChildViewController:vc];
//        [vc didMoveToParentViewController:topVC];
//        [topVC.view addSubview:vc.view];
//        [vc show];
//    }
}

//vc跳转删除
#pragma mark -  RRSeasonSeniorCommentsDetailVCDelegate
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsDetailVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
    if (self.clickDelete) {
        self.clickDelete(self.model);
    }
}

#pragma mark -  lazy
- (RRSeasonSeniorCommentsReplyTableView *)tableView {
    if (!_tableView) {
        _tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), 100)];
        _tableView.scrollEnabled = NO;
        _tableView.tableViewDelegate = self;
        _tableView.layer.cornerRadius = 4;
        _tableView.layer.masksToBounds = YES;
    }
    return _tableView;
}

@end
