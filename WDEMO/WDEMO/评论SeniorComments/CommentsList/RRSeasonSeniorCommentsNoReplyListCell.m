//
//  RRSeasonSeniorCommentsNoReplyListCell.m
//  PUClient
//
//  Created by rrtv on 2021/4/29.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsNoReplyListCell.h"
#import "RRSeasonSeniorCommentsSecondarySubVC.h"

@interface RRSeasonSeniorCommentsNoReplyListCell () <RRSeasonSeniorCommentsSecondarySubVCDelegate>
@end

@implementation RRSeasonSeniorCommentsNoReplyListCell
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
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    //填充数据

    //文字部分
    //@"剧透 "
    //@"       " 7个空格
    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @"查看全文";
    NSString *returnTextStr = @"\n";
    NSString *hideAllTextStr = @"收起";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";
    
    //剧透
    BOOL isFirst = model.spoiler;
    if (isFirst) {
        //现实剧透标签
        self.firstView.hidden = NO;
        textStr = [firstTextStr stringByAppendingString:textStr];
    } else {
        //隐藏剧透标签
        self.firstView.hidden = YES;
    }
    
    //    self.contentLab.text = textStr;
    self.yyContentLab.text = textStr;
    
    //    ...查看全文
    //    ...查看图片
    //恢复View
    NSArray *array = [UILabel getSeparatedLinesFromYYLabel:self.yyContentLab];
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;
    
    BOOL isShowMore = self.isShowMore;
    if (array.count > 5) {
        if (isShowMore) {
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:returnTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                WS(weakSelf)
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:hideAllTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_0091FF;
                //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
                [one setTextHighlightRange:one.rangeOfAll
                                     color:kCOLOR_0091FF
                           backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                                 tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                    //自定义代码，此处根据需要调整
                    NSLog(@"收起，切断文字");
                    [weakSelf clickCutTextBtn];
                  }];
                [text appendAttributedString:one];
            }
        } else {
            //1-4行
            NSString *showText = [NSString stringWithFormat:@"%@%@%@%@", array[0], array[1], array[2], array[3]];
            //第5行：
            NSString *line5String = array[4];
            //第5行：过滤回车和空行
            line5String = [NSString filterReturn:line5String];
            line5String = [NSString filterNewLine:line5String];
            //第5行：拼接...查看全文
            line5String = [NSString stringWithFormat:@"%@%@%@", line5String, moreTextStr, showAllTextStr];//...查看全文
            //第5行：拼接后有去出第一行（因为之前拼接了@“...查看全文”，所以substringToIndex:,是安全的）
            self.yyContentLab.text = line5String;
            NSArray *lineArray = [UILabel getSeparatedLinesFromYYLabel:self.yyContentLab];
            NSString *lineString = lineArray[0];
            if (lineString.length >= moreTextStr.length + showAllTextStr.length) {
                lineString = [NSString stringWithFormat:@"%@%@", [lineString substringToIndex:lineString.length - moreTextStr.length - showAllTextStr.length], moreTextStr];
            } else {
                lineString = moreTextStr;//...
            }
            //最后，完成1-5行
            showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
            {
    //            WS(weakSelf)
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            {
                WS(weakSelf)
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showAllTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_0091FF;
                //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
                [one setTextHighlightRange:one.rangeOfAll
                                     color:kCOLOR_0091FF
                           backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                                 tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                    //自定义代码，此处根据需要调整
                    NSLog(@"查看全文");
                    [weakSelf clickFullTextBtn];
                 }];
                [text appendAttributedString:one];
            }
        }
    } else {
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(61, 34, (KWidth - 61 - 16), rect.size.height + 1);
    
    CGFloat currentHeight = 34 + rect.size.height + 1;
    CGFloat imageViewHeight = 0;
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (isHasImage) {
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];

        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = 8 + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        if (width > height) {
            showWidth = max * 4 / 3;
            showHeight = max;

        } else if (width < height) {
            showWidth = max;
            showHeight = max * 4 / 3;

        } else {
            showWidth = max;
            showHeight = max;
            
        }
        self.singleImageView.hidden = NO;
        self.singleImageView.frame = CGRectMake(x, y, showWidth, showHeight);
//        [self.singleImageView rr_setImageWithURLString:singleImage.url  placeholderImage:KplaceholderImg];
//        [self.singleImageView rr_downloadImageWithURLString:singleImage.url placeholderImage:KplaceholderImg];
        self.singleImageView.image = [UIImage imageNamed:@"KplaceholderImg"];
        
        imageViewHeight = showHeight;
    } else {
        self.singleImageView.hidden = YES;
        self.singleImageView.frame = CGRectZero;
        imageViewHeight = 0;

    }
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + 8 + imageViewHeight;
    }
    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, 45);
    
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    //顶部到文字 34
    //文字到图   4
    //图到回复   8
    //底部    45
    if (!model) {
        return 0;
    }
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
    yyContentLab.font = RR_COMMONFONT(14);
    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
  
    //@"剧透 "
    //@"       " 7个空格
    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @"查看全文";
    NSString *returnTextStr = @"\n";
    NSString *hideAllTextStr = @"收起";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";
    
    //剧透
    BOOL isFirst = model.spoiler;
    if (isFirst) {
        //现实剧透标签
//        self.firstView.hidden = NO;
        textStr = [firstTextStr stringByAppendingString:textStr];
    } else {
        //隐藏剧透标签
//        self.firstView.hidden = YES;
    }
    
    //    self.contentLab.text = textStr;
    yyContentLab.text = textStr;
    
    //    ...查看全文
    //    ...查看图片
    //恢复View
    NSArray *array = [UILabel getSeparatedLinesFromYYLabel:yyContentLab];
    
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;

    BOOL isShowMore = isShowAll;
    if (array.count > 5) {
        if (isShowMore) {
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:returnTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:hideAllTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_0091FF;
                [text appendAttributedString:one];
            }
        } else {
            //1-4行
            NSString *showText = [NSString stringWithFormat:@"%@%@%@%@", array[0], array[1], array[2], array[3]];
            //第5行：
            NSString *line5String = array[4];
            //第5行：过滤回车和空行
            line5String = [NSString filterReturn:line5String];
            line5String = [NSString filterNewLine:line5String];
            //第5行：拼接...查看全文
            line5String = [NSString stringWithFormat:@"%@%@%@", line5String, moreTextStr, showAllTextStr];//...查看全文
            //第5行：拼接后有去出第一行（因为之前拼接了@“...查看全文”，所以substringToIndex:,是安全的）
            yyContentLab.text = line5String;
            NSArray *lineArray = [UILabel getSeparatedLinesFromYYLabel:yyContentLab];
            NSString *lineString = lineArray[0];
            if (lineString.length >= moreTextStr.length + showAllTextStr.length) {
                lineString = [NSString stringWithFormat:@"%@%@", [lineString substringToIndex:lineString.length - moreTextStr.length - showAllTextStr.length], moreTextStr];
            } else {
                lineString = moreTextStr;//...
            }
            //最后，完成1-5行
            showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
            {
    //            WS(weakSelf)
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            {
    //            WS(weakSelf)
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showAllTextStr];
                //              one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = kCOLOR_0091FF;
                [text appendAttributedString:one];
            }
        }
    } else {
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;

    CGFloat currentHeight = rect.size.height + 1;
    
    CGFloat imageViewHeight = 0;
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (isHasImage) {
        RRSeniorCommentsImageModel *singleImage = [model.images firstObject];

        CGFloat width = singleImage.width;
        CGFloat height = singleImage.height;
        CGFloat x = 61;
        CGFloat y = 8 + currentHeight;
        CGFloat max = 197;
        CGFloat showWidth = 0;
        CGFloat showHeight = 0;
        
        if (width > height) {
            showWidth = max * 4 / 3;
            showHeight = max;

        } else if (width < height) {
            showWidth = max;
            showHeight = max * 4 / 3;

        } else {
            showWidth = max;
            showHeight = max;
            
        }
        imageViewHeight = showHeight;
    } else {
        imageViewHeight = 0;
    }
    if (imageViewHeight > 0) {
        currentHeight = currentHeight + 8 + imageViewHeight;
    }

    return 34 + 45 + currentHeight;
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
//    return 34 + 45 + currentHeight;
//}

//查看全文
- (void)clickFullTextBtn {
    if (self.clickFullText) {
        self.clickFullText(self.model);
    }
}

//收起
- (void)clickCutTextBtn {
    if (self.clickCutText) {
        self.clickCutText(self.model);
    }
}

//#pragma mark -  RRSeasonSeniorCommentsReplyTableViewDelegate
//- (void)seasonSeniorCommentsReplyTableView:(UITableView *)tableView
//                   didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//                            didSelectModel:(RRSeniorCommentsModel *)model {
//    [self gotoReplyVCWithCommentModel:self.model replyModel:model];
//}

////跳转到回复列表
//- (void)gotoReplyVCWithCommentModel:(RRSeniorCommentsModel *)commentModel replyModel:(RRSeniorCommentsModel *)replyModel {
//    RRSeasonSeniorCommentsSecondarySubVC *vc = [[RRSeasonSeniorCommentsSecondarySubVC alloc] initWithIsHalf:YES];
//    vc.commentModel = commentModel;
//    vc.replyModel = replyModel;
//    vc.delegate = self;
//    //    vc.actorId = [NSString stringWithFormat:@"%lld", model.ID];
//    //    vc.name = model.chineseName;
//    //    vc.communityEnable = model.communityEnable;
//    UIViewController *topVC = [UIViewController topViewController];
////    UIViewController *topVC = self.fatherVC;
//    [topVC addChildViewController:vc];
//    [vc didMoveToParentViewController:topVC];
//    [topVC.view addSubview:vc.view];
//    [vc show];
//}

//vc跳转删除
#pragma mark -  RRSeasonSeniorCommentsSecondarySubVCDelegate
- (void)seasonSeniorCommentsSecondarySubVC:(RRSeasonSeniorCommentsSecondarySubVC *)vc deleteModel:(RRSeniorCommentsModel *)deleteModel {
    if (self.clickDelete) {
        self.clickDelete(self.model);
    }
}

@end
