//
//  RRSeasonSeniorCommentsHasReplyListCell.m
//  PUClient
//
//  Created by rrtv on 2021/4/12.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsHasReplyListCell.h"
#import "RRSeasonSeniorCommentsReplyTableView.h"
#import "RRMJTool.h"
//#import "PriseDynamicApi.h"
//#import "ReportApi.h"
//#import "RRSeniorCommentsDeletetApi.h"
//#import "RRAlertBase.h"
//#import "HXPhotoPicker.h"
#import "RRSeasonSeniorCommentsSecondarySubVC.h"

@interface RRSeasonSeniorCommentsHasReplyListCell () <RRSeasonSeniorCommentsSecondarySubVCDelegate, RRSeasonSeniorCommentsReplyTableViewDelegate>
@property (nonatomic, strong) RRSeasonSeniorCommentsReplyTableView *tableView;
@end

@implementation RRSeasonSeniorCommentsHasReplyListCell

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
 
    CGFloat currentHeight = 34 + self.yyContentLab.frame.size.height;
    CGFloat imageViewHeight = 0;
    imageViewHeight = self.photoCollectionView.frame.size.height;
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + 8 + imageViewHeight;
    }
    
    //有回复
    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
    
    if (isHasReply) {
        self.tableView.hidden = NO;
        self.tableView.isHalf = self.isHalf;
        self.tableView.count = model.replyCount;
        self.tableView.data = model.replies;
        self.tableView.model = model;
        self.tableView.frame = CGRectMake(61, 8 + currentHeight, (KWidth - 61 - 16), self.tableView.contentSize.height);
    } else {
        self.tableView.hidden = YES;
//        self.tableView.count = 0;
//        self.tableView.data = nil;
        self.tableView.frame = CGRectZero;
    }
    if (self.tableView.frame.size.height > 0) {
        currentHeight = currentHeight + 8 + self.tableView.frame.size.height;
    }
    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, 45);

}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
   
    CGFloat currentHeight = [super cellHeightWithModel:model isShowAll:isShowAll];
    RRSeasonSeniorCommentsReplyTableView *tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), 100)];
    tableView.scrollEnabled = NO;
    //有回复
    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
 
    if (isHasReply) {
        tableView.hidden = NO;
        tableView.count = model.replyCount;
        tableView.data = model.replies;
        tableView.model = model;
        tableView.frame = CGRectMake(61, 8 + currentHeight, (KWidth - 61 - 16), tableView.contentSize.height);
    } else {
        tableView.hidden = YES;
//        self.tableView.count = 0;
//        self.tableView.data = nil;
        tableView.frame = CGRectZero;
    }
    if (tableView.frame.size.height > 0) {
        currentHeight = currentHeight + 8 + tableView.frame.size.height;
    }
    return currentHeight;
}

//+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
//    //顶部到文字 34
//    //文字到图   4
//    //图到回复   8
//    //底部    45
//    if (!model) {
//        return 0;
//    }
//    YYLabel *yyContentLab = [YYLabel new];
//    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
//    yyContentLab.font = RR_COMMONFONT(14);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
//    yyContentLab.numberOfLines = 0;
//
//    RRSeasonSeniorCommentsReplyTableView *tableView = [[RRSeasonSeniorCommentsReplyTableView alloc] initWithFrame:CGRectMake(61, 200, (KWidth - 61 - 16), 100)];
//    tableView.scrollEnabled = NO;
//
//    //@"剧透 "
//    //@"       " 7个空格
//    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
//    NSString *moreTextStr = @"...";
//    NSString *showAllTextStr = @"查看全文";
//    NSString *content = [model.content copy] ?: @"";
//    NSString *textStr = [model.content copy] ?: @"";
//
//    //剧透
//    BOOL isFirst = model.spoiler;
//    if (isFirst) {
//        //现实剧透标签
////        self.firstView.hidden = NO;
//        textStr = [firstTextStr stringByAppendingString:textStr];
//    } else {
//        //隐藏剧透标签
////        self.firstView.hidden = YES;
//    }
//
//    //    self.contentLab.text = textStr;
//    yyContentLab.text = textStr;
//
//    //    ...查看全文
//    //    ...查看图片
//    //恢复View
//    NSArray *array = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
//
//    CGFloat fontSize = 14;
//    UIFont *textFont = RR_COMMONFONT(fontSize);
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
//    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
//    text.font = textFont;
//    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;
//
//    BOOL isShowMore = NO;
//    if (array.count > 5 && !isShowMore) {
//        //1-4行
//        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@", array[0], array[1], array[2], array[3]];
//        //第5行：
//        NSString *line5String = array[4];
//        //第5行：过滤回车和空行
//        line5String = [NSString filterReturn:line5String];
//        line5String = [NSString filterNewLine:line5String];
//        //第5行：拼接...查看全文
//        line5String = [NSString stringWithFormat:@"%@%@%@", line5String, moreTextStr, showAllTextStr];//...查看全文
//        //第5行：拼接后有去出第一行（因为之前拼接了@“...查看全文”，所以substringToIndex:,是安全的）
//        yyContentLab.text = line5String;
//        NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
//        NSString *lineString = lineArray[0];
//        lineString = [NSString stringWithFormat:@"%@%@", [lineString substringToIndex:lineString.length - moreTextStr.length - showAllTextStr.length], moreTextStr];
//        //最后，完成1-5行
//        showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
//        {
////            WS(weakSelf)
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
//            [text appendAttributedString:one];
//        }
//        {
////            WS(weakSelf)
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showAllTextStr];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_0091FF;
////            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
////            [one setTextHighlightRange:one.rangeOfAll
////                                 color:kCOLOR_0091FF
////                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
////                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
////                //自定义代码，此处根据需要调整
////                NSLog(@"查看全文");
////                [weakSelf clickFullText];
////             }];
//            [text appendAttributedString:one];
//        }
//
//    } else {
//        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
//        //              one.lineSpacing = 2.5;
//        one.font = textFont;
//        one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
//        [text appendAttributedString:one];
//    }
//
//    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
//    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
//    //        CGSize size = layout.textBoundingSize;
//
//    CGFloat currentHeight = rect.size.height + 1;
//
//    CGFloat imageViewHeight = 0;
//    BOOL isHasImage = model.images.count > 0 ? YES : NO;
//    if (isHasImage) {
//        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];
//
//        CGFloat width = singleImage.width;
//        CGFloat height = singleImage.height;
//        CGFloat x = 61;
//        CGFloat y = 8 + currentHeight;
//        CGFloat max = 197;
//        CGFloat showWidth = 0;
//        CGFloat showHeight = 0;
//
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
//        imageViewHeight = showHeight;
//    } else {
//        imageViewHeight = 0;
//    }
//    if (imageViewHeight > 0) {
//        currentHeight = currentHeight + 8 + imageViewHeight;
//    }
//
//    //有回复
//    BOOL isHasReply = model.replies.count > 0 ? YES : NO;
//
//    if (isHasReply) {
//        tableView.hidden = NO;
//        tableView.count = model.replyCount;
//        tableView.data = model.replies;
//        tableView.model = model;
//        tableView.frame = CGRectMake(61, 8 + currentHeight, (KWidth - 61 - 16), tableView.contentSize.height);
//    } else {
//        tableView.hidden = YES;
////        self.tableView.count = 0;
////        self.tableView.data = nil;
//        tableView.frame = CGRectZero;
//    }
//    if (tableView.frame.size.height > 0) {
//        currentHeight = currentHeight + 8 + tableView.frame.size.height;
//    }
//    return 34 + 45 + currentHeight;
//}
 
//查看全文
- (void)clickFullTextBtn {
    [self gotoReplyVCWithCommentModel:self.model replyModel:nil];
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
    [self gotoReplyVCWithCommentModel:self.model replyModel:model];
}

//跳转到回复列表
- (void)gotoReplyVCWithCommentModel:(RRSeniorCommentsModel *)commentModel replyModel:(RRSeniorCommentsModel *)replyModel {
    RRSeasonSeniorCommentsSecondarySubVC *vc = [[RRSeasonSeniorCommentsSecondarySubVC alloc] initWithIsHalf:YES];
    vc.commentModel = commentModel;
//    vc.replyModel = replyModel;
    NSString *replyId = replyModel ? replyModel.ID : nil;
    vc.replyId = replyId;
    vc.delegate = self;
    //    vc.actorId = [NSString stringWithFormat:@"%lld", model.ID];
    //    vc.name = model.chineseName;
    //    vc.communityEnable = model.communityEnable;
    UIViewController *topVC = [UIViewController topViewController];
//    UIViewController *topVC = self.fatherVC;
    [topVC addChildViewController:vc];
    [vc didMoveToParentViewController:topVC];
    [topVC.view addSubview:vc.view];
    [vc show];
}

//vc跳转删除
#pragma mark -  RRSeasonSeniorCommentsSecondarySubVCDelegate
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsSecondarySubVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
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
        _tableView.layer.cornerRadius = 8;
        _tableView.layer.masksToBounds = YES;
    }
    return _tableView;
}

@end
