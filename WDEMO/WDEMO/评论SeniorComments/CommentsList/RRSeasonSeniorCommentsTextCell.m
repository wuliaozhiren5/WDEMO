//
//  RRSeasonSeniorCommentsTextCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsTextCell.h"
#import "RRMJTool.h"
//#import "RRAlertBase.h"
//#import "RRAlertView.h"
//#import "ReportApi.h"
//#import "RRSeniorCommentsDeletetApi.h"

@implementation RRSeasonSeniorCommentsTextCell

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
    //contentLab
    //    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.yyContentLab];
    //剧透
    [self.contentView addSubview:self.firstView];
    [self.firstView addSubview:self.firstLab];
  
    //firstView
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.contentLab.mas_top).offset(0);
        make.top.equalTo(self.yyContentLab.mas_top).offset(4);
        make.leading.equalTo(@61);
        make.width.equalTo(@26);
        make.height.equalTo(@14);
    }];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.firstView);
        make.center.equalTo(self.firstView);
    }];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    [super setModel:model];
    //填充数据
    CGFloat contentLabTop = [[self class] getContentLabTop];
    CGFloat spacing = [[self class] getSpacing];
    CGFloat bottomViewHeight = [[self class] getBottomViewHeight];
 
    //文字部分
    //@"剧透 "
    //@"       " 7个空格
    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @" 查看全文 ";
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
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
    yyContentLab.font = RR_COMMONFONT(14);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
    yyContentLab.text = textStr;

    //    ...查看全文
    //    ...查看图片
    //恢复View
    NSArray *array = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
    
    //颜色
    UIColor *textColor = kCOLOR_222222;
    if (@available(iOS 13.0, *)) {
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            //当前 "深色"模式
            NSLog(@"深色");
            textColor = kCOLOR_E5E7EB;
            
        } else {
            //当前 "浅色"模式
            NSLog(@"浅色");
            textColor = kCOLOR_222222;
            
        }
    } else {
        // Fallback on earlier versions
    }
    
    //字号
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    
    //字体间距
    CGFloat textLineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = textLineSpacing;
    text.font = textFont;
    text.color = textColor;//kCOLOR_dynamicProvider_222222_E5E7EB;

    BOOL isShowMore = self.isShowMore;
    if (array.count > 5) {
        if (isShowMore) {
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = textColor;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:returnTextStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = textColor;
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
            yyContentLab.text = line5String;
            NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
            NSString *lineString = lineArray[0];
            
            //需要填充的字符
            NSString *fillStr = [NSString stringWithFormat:@"%@%@", moreTextStr, showAllTextStr];
            //实际截取的字符
            NSString *deleteStr = [NSString stringWithFormat:@"%@", [lineString substringFromIndex:lineString.length - moreTextStr.length - showAllTextStr.length]];
//            //保留的字符
//            NSString *retainStr = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - moreTextStr.length - showAllTextStr.length]];
         
            int fillStrLength = [RRMJTool convertToInt:fillStr];
            int deleteStrLength = [RRMJTool convertToInt:deleteStr];
            int length = fillStrLength - deleteStrLength;
            if (lineString.length >= (moreTextStr.length + showAllTextStr.length + length + 1)) {
                lineString = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - (moreTextStr.length + showAllTextStr.length + length + 1)]];
            } else {
                lineString = @"";
            }
            
            //最后，完成1-5行
            showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = textColor;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:moreTextStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
                one.color = textColor;
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
//            one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = textColor;
            [text appendAttributedString:one];
        }
    }
    
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(61, contentLabTop, (KWidth - 61 - 16), size.height);
    
    //当前高度
    CGFloat currentHeight = contentLabTop - spacing;
    //文字高度
    CGFloat textViewHeight = self.yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + spacing + textViewHeight;
    }
    //    CGFloat currentHeight = contentLabTop + rect.size.height;

    self.bottomView.frame = CGRectMake(0, currentHeight, KWidth, bottomViewHeight);
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model isShowAll:(BOOL)isShowAll {
    //顶部到文字 34
    //文字到图   4
    //图到回复   8
    //底部    45
    if (!model) {
        return 0;
    }
    CGFloat contentLabTop = [self getContentLabTop];
    CGFloat spacing = [self getSpacing];
    CGFloat bottomViewHeight = [self getBottomViewHeight];
    
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
    yyContentLab.font = RR_COMMONFONT(14);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
  
    //@"剧透 "
    //@"       " 7个空格
    NSString *firstTextStr = @"      ";//@"剧透 ";//@"       "; @"剧透 ";
    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @" 查看全文 ";
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
    NSArray *array = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
    
    //颜色
    UIColor *textColor = kCOLOR_dynamicProvider_222222_E5E7EB;

    //字号
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    
    //字体间距
    CGFloat textLineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = textLineSpacing;
    text.font = textFont;
    text.color = textColor;
    
    BOOL isShowMore = isShowAll;
    if (array.count > 5) {
        if (isShowMore) {
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
//                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:returnTextStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
//                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
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
            NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
            NSString *lineString = lineArray[0];
            
            //需要填充的字符
            NSString *fillStr = [NSString stringWithFormat:@"%@%@", moreTextStr, showAllTextStr];
            //实际截取的字符
            NSString *deleteStr = [NSString stringWithFormat:@"%@", [lineString substringFromIndex:lineString.length - moreTextStr.length - showAllTextStr.length]];
//            //保留的字符
//            NSString *retainStr = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - placeholderTextStr.length - showAllTextStr.length]];
         
            int fillStrLength = [RRMJTool convertToInt:fillStr];
            int deleteStrLength = [RRMJTool convertToInt:deleteStr];
            int length = fillStrLength - deleteStrLength;
            if (lineString.length >= (moreTextStr.length + showAllTextStr.length + length + 1)) {
                lineString = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - (moreTextStr.length + showAllTextStr.length + length + 1)]];
            } else {
                lineString = @"";
            }
            
            //最后，完成1-5行
            showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//                one.lineSpacing = 2.5;
                one.font = textFont;
//                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:moreTextStr];
//                one.lineSpacing = 2.5;
                one.font = textFont;
//                one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
                [text appendAttributedString:one];
            }
            
            {
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
//            one.lineSpacing = 2.5;
            one.font = textFont;
//            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
    }
    
    CGSize yySize = CGSizeMake((KWidth - 61 - 16), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    yyContentLab.attributedText = text;
    yyContentLab.frame = CGRectMake(61, contentLabTop, (KWidth - 61 - 16), size.height);;
   
    //当前高度
    CGFloat currentHeight = contentLabTop - spacing;
    //文字高度
    CGFloat textViewHeight = yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + spacing + textViewHeight;
    }
    //    CGFloat currentHeight = contentLabTop + rect.size.height;

    return bottomViewHeight + currentHeight;
}

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

#pragma mark - 点击文字
//- (void)clickTextBtn {
//    if (self.clickText) {
//        self.clickText(self.model);
//    }
//}

#pragma mark - 长按手势
- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
     //长按开始
     if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"--> 长按手势 state :begin ");
        [self showAlertView];
    } else {
         //长按结束
        NSLog(@"--> 长按手势 state :end ");
    }
}

#pragma mark - 提示框
- (void)showAlertView {
//    WS(weakSelf);
//    RRAlertItem *item1 = [[RRAlertItem alloc] initWithTitle:@"复制" itemImg:IMAGENAME(@"ic_popbar_copy") itemStyle:RRAlertItemStyleListIconText];
//    item1.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickCopyBtn];
//    };
//
//    RRAlertItem *item2 = [[RRAlertItem alloc] initWithTitle:@"删除" itemImg:IMAGENAME(@"ic_popbar_delete") itemStyle:RRAlertItemStyleListIconText];
//    item2.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickDeleteBtn];
//    };
//
//    RRAlertItem *item3 = [[RRAlertItem alloc] initWithTitle:@"举报" itemImg:IMAGENAME(@"ic_popbar_warn") itemStyle:RRAlertItemStyleListIconText];
//    item3.actionBlock = ^(RRAlertItem *item) {
//        NSLog(@"点击了%@", item.title);
//        [weakSelf clickReportBtn];
//    };
//
//    RRAlertItem *item4 = [[RRAlertItem alloc] initWithTitle:@"不感兴趣" itemImg:IMAGENAME(@"ic_popbar_report") itemStyle:RRAlertItemStyleListIconText];
//    item4.actionBlock = ^(RRAlertItem *item) {
//        TOAST(@"操作成功，将减少此类内容推送");
//    };
//
////    BOOL isCommentUser = [UserInfoConfig sharedUserInfoConfig].userInfo.commentUser;
////    //老评论
////    if (!isCommentUser) {
////        NSArray *itemArray = @[item1, item3];
////        NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
////        RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:title itemArray:itemArray];
////        [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
////        [alert showWithAnimation:YES];
////        return;
////    }
//
//    BOOL isMy = [UserInfoConfig isLogined] && [[UserInfoConfig sharedUserInfoConfig].userInfo.Id isEqualToString:self.model.author.ID];
//    //复制,删除
//    NSArray *itemArray = @[item1, item2];
//    if (!isMy) {
//        itemArray = @[item1, item3];
//    }
//
//    if (![UserInfoConfig sharedUserInfoConfig].isMoviesOpen) {
//        itemArray = @[item1, item2, item4];
//        if (!isMy) {
//            itemArray = @[item1, item3, item4];
//        }
//    }
////    NSString *title = @"举报毒舌电影：好搞笑哦好好看撒大噶点范德萨发的撒范德萨到发疯剧啊撒地方大法大范德萨发到点点滴滴带的…";
//    NSString *title = [NSString stringWithFormat:@"%@：%@", self.model.author.nickName, self.model.content];
//    RRAlertBase *alert = [[RRAlertBase alloc] initWithTitle:title itemArray:itemArray];
//    [alert titleStyleWithText:title lines:2 textColor:kCOLOR_898A91 font:SYSTEMFONT(14) lineHeihgt:6];
//    [alert showWithAnimation:YES];
}

#pragma mark - 复制
- (void)clickCopyBtn {
    //复制文字
    UIPasteboard *pab = [UIPasteboard generalPasteboard];
    pab.string = self.model.content;
    if (pab == nil) {
//        TOAST(@"复制失败");
    } else {
//        TOAST(@"已复制");
    }
}

#pragma mark - 举报
- (void)clickReportBtn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            __block NSString * Message;
//            //408之后 都为commetType   兼容帖子为reply状态
//            ReportApi * api = [[ReportApi alloc] initWithID:self.model.ID type:KCommentType content:nil];
//            [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
//                NSDictionary * dic = request.responseJSONObject;
//                if (dic) {
//                    RRJsonModel * json = [RRJsonModel modelWithDictionary:dic];
//                    if (json.code == SUCCESSCODE) {
//                        Message = @"举报成功";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1124){
//                        Message = @"该内容您已举报过了";
//        //                    [IanAlert alertSuccess:Message];
//                        TOAST(Message);
//                    }else if (json.code == 1125){
//                        Message = @"您不能举报自己哦";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }else{
//                        Message = @"举报失败";
//        //                    [IanAlert alertError:Message];
//                        TOAST(Message);
//                    }
//                }else{
//                    Message = @"举报失败";
//        //                [IanAlert alertError:Message];
//                    TOAST(Message);
//                }
//            } failure:^(YTKBaseRequest *request) {
//                Message = @"举报失败";
//        //            [IanAlert alertError:Message];
//                TOAST(Message);
//            }];
//        }
//    }];
}
 
#pragma mark - 删除btn
- (void)clickDeleteBtn {
//    WS(weakSelf)
//    RRAlertView *alertView = [[RRAlertView alloc] initWithTitle:nil
//                                                        content:@"删除后不可恢复，是否确认删除？"
//                                                    cancelTitle:@"取消"
//                                                      sureTitle:@"确认删除"];
//    alertView.dismissBlock = ^(BOOL isClicked) {
//        if (isClicked) {
//            //确认删除
//            [weakSelf clickSureDeleteBtn];
//        } else {
//            //取消
//        }
//    };
//    [alertView showInView:kAppDelegate.window];
}

#pragma mark - 确认删除btn
- (void)clickSureDeleteBtn {
//    NSString  *typeId = self.model.ID;
//    WS(weakSelf)
//    [RRSeniorCommentsDeletetApi requestSeniorCommentsDeleteWithTypeId:typeId block:^(BOOL success, NSError * _Nonnull error) {
//        if (success) {
//            if (weakSelf.clickDelete) {
//                weakSelf.clickDelete(self.model);
//            }
//        }
//    }];
}

#pragma mark - lazy
- (UIView *)firstView {
    if (!_firstView) {
        _firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 26, 14)];
        _firstView.layer.cornerRadius = 3;
        _firstView.layer.masksToBounds = YES;
        _firstView.backgroundColor = [kCOLOR_FF4865 colorWithAlphaComponent:0.1];
    }
    return _firstView;
}

- (UILabel *)firstLab {
    if (!_firstLab) {
        _firstLab = [[UILabel alloc] init];
        _firstLab.frame = CGRectMake(0, 0, 26, 14);
        _firstLab.font = RR_COMMONFONT(10);
        _firstLab.textColor = kCOLOR_FF4865;
        _firstLab.textAlignment = NSTextAlignmentCenter;
        _firstLab.text = @"剧透";
    }
    return _firstLab;
}

- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(0, 0, KWidth - 61 - 16, 300);
        _yyContentLab.font = RR_COMMONFONT(14);
//        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr.minimumPressDuration = 1.0;
        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
}

@end
