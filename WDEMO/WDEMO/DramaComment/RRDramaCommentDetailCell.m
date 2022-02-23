//
//  RRDramaCommentDetailCell.m
//  NJVideo
//
//  Created by WDEMO on 2021/8/2.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRDramaCommentDetailCell.h"
#import "RRMJTool.h"
//#import "RRAlertBase.h"
//#import "RRAlertView.h"
//#import "ReportApi.h"
//#import "RRSeniorCommentsDeletetApi.h"

@interface RRDramaCommentDetailCell ()
//是否点击高亮字体
@property (nonatomic, assign) BOOL isClickHighlightText;
@end

@implementation RRDramaCommentDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
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
    //图片
    [self.contentView addSubview:self.imageScrollView];
    //评分
    [self.contentView addSubview:self.scoreView];
    //日期
    [self.contentView addSubview:self.dateLab];
    //文本
    [self.contentView addSubview:self.yyContentLab];
//
    [self.contentView addSubview:self.seasonView];
    [self.seasonView addSubview:self.seasonViewImgV];
    [self.seasonView addSubview:self.seasonViewTitleLab];
    [self.seasonView addSubview:self.seasonViewSubtitleLab];
    [self.seasonView addSubview:self.seasonViewBtn];
    [self.seasonView addSubview:self.noSeasonViewLab];

    [self.contentView addSubview:self.line];
    
    self.seasonView.frame = CGRectMake(16, 0 , (KWidth - 16 * 2), 70);
    [self.seasonViewImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.leading.equalTo(@8);
        make.width.equalTo(@42);
        make.height.equalTo(@54);
    }];
    [self.seasonViewTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@16);
        make.leading.equalTo(@60);
        make.trailing.equalTo(@-99);
        make.height.equalTo(@17);
    }];
    [self.seasonViewSubtitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-16);
        make.leading.equalTo(@60);
        make.trailing.equalTo(@-99);
        make.height.equalTo(@17);
    }];
    [self.seasonViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.seasonViewImgV);
        make.trailing.equalTo(@-10);
        make.width.equalTo(@56);
        make.height.equalTo(@30);
    }];
    [self.noSeasonViewLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(@60);
        make.height.equalTo(@17);
        make.center.equalTo(self.seasonView);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);
        make.height.equalTo(@(1.0f / [UIScreen mainScreen].scale));
    }];
    
    
    self.contentView.userInteractionEnabled = YES;
    //单击手势 单击回复
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapDramaCommentDetailCell:)];
    singleTapGesture.numberOfTapsRequired = 1;
    singleTapGesture.numberOfTouchesRequired = 1;
    [self.contentView addGestureRecognizer:singleTapGesture];
    //双击手势 双击点赞
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapDramaCommentDetailCell:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    doubleTapGesture.numberOfTouchesRequired = 1;
    [self.contentView addGestureRecognizer:doubleTapGesture];
    //只有当doubleTapGesture识别失败的时候(即识别出这不是双击操作)，singleTapGesture才能开始识别
    [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
}

- (void)singleTapDramaCommentDetailCell:(UIGestureRecognizer *)gesture {
    NSLog(@"单击");
    if (self.isClickHighlightText) {
        self.isClickHighlightText = NO;
        return;
    }
    if (self.singleTapCell) {
        self.singleTapCell();
    }
}

- (void)doubleTapDramaCommentDetailCell:(UIGestureRecognizer *)gesture {
    NSLog(@"双击");
    
    CGPoint point = [gesture locationInView:self.contentView];
//    //读取PAG素材文件
//    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"kuaikan_zan_bmp" ofType:@"pag"];
//    PAGFile *pagFile = [PAGFile Load:resourcePath];
//    //创建PAG播放视图PAGView
//    PAGView *pagView = [[PAGView alloc] initWithFrame:CGRectMake(point.x - 40, point.y - 40, 80, 80)];
//    [self.contentView addSubview:pagView];
//    //关联PAGView和PAGFile
//    [pagView setComposition:pagFile];
//    //设置循环播放，默认只播放一次
//    [pagView setRepeatCount:1];
//    [pagView play];
////    [pagView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerX.offset(point.x);
////        make.centerY.offset(point.y);
////        make.width.height.offset(80);
////    }];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [pagView stop];
//        [pagView removeFromSuperview];
//    });
    
    if (self.doubleTapCell) {
        self.doubleTapCell();
    }
}


- (void)setModel:(RRSeniorCommentsModel *)model {
    _model = model;
    
    //当前高度
    CGFloat currentHeight = 0;
    CGFloat imageWidth = KWidth;//固定宽度
    CGFloat imageHeight = KHeight * 3 / 5;//固定高度
    
    //    //封面图model
    //    RRSeniorCommentsImageModel *coverImage = [[RRSeniorCommentsImageModel alloc] init];
    //    coverImage.url = model.drama.coverUrl;
    //    coverImage.width = imageWidth;
    //    coverImage.height = imageWidth * 1.65;
    //
    //    NSArray *imagesArr = @[coverImage];
    //    if (model.images.count > 0) {
    //        imagesArr = model.images;
    //    }
    //不需要封面图
    NSArray *imagesArr = @[];
    if (model.images.count > 0) {
        imagesArr = model.images;
    }
    
    //逻辑：找到图片中最的大的高度currentImageHeight，如果大于固定高度imageHeight，使用固定高度imageHeight，反之用currentImageHeight
    for (RRSeniorCommentsImageModel *imageModel in imagesArr) {
        NSInteger modelImageWidth = imageModel.width;
        NSInteger modelImageHeight = imageModel.height;
        NSInteger showImageWidth = imageWidth;
        NSInteger showImageHeight = imageWidth;
        //图片尺寸转变，图片的宽width = 屏幕点宽，计算出图片的高height
        showImageHeight = showImageWidth * modelImageHeight / modelImageWidth;

        if (showImageHeight > currentHeight) {
            currentHeight = showImageHeight;
        }
    }
    
    if (imageHeight > currentHeight) {
        imageHeight = currentHeight;
    }
    
    self.imageScrollView.frame = CGRectMake(0, 0, KWidth, imageHeight);
    self.imageScrollView.hidden = (imagesArr > 0) ? NO : YES;
//    self.imageScrollView.imageArr = [model.images valueForKeyPath:@"url"];
    self.imageScrollView.imageArr = imagesArr;
 
    if (imageHeight > 0) {
        currentHeight = imageHeight;
    }
     
    self.scoreView.frame = CGRectMake(16, currentHeight + 12, 200, 30);
    self.scoreView.score = model.score;
     
//    self.dateLab.text = @"04-12";
    NSString *dateStr = @"";
    if (model.updateTime > model.createTime) {
        dateStr = [NSString stringWithFormat:@"编辑于%@", [RRMJTool getFormatterDateStringWithTimeInterval:model.updateTime / 1000.0]];
    } else { 
        dateStr = [RRMJTool getFormatterDateStringWithTimeInterval:model.createTime / 1000.0];
    }
    self.dateLab.text = dateStr;

    self.dateLab.textAlignment = NSTextAlignmentRight;
    self.dateLab.frame = CGRectMake(16, currentHeight + 12, KWidth - 16 * 2, 30);
     
    CGFloat scoreViewHeight = self.scoreView.frame.size.height;
    currentHeight = currentHeight + 12 + scoreViewHeight;
 
    //文字
    NSString *textStr = model.content ?: @"";
    //需要显示的所有文字
    NSString *allShowTextStr = @"";
    //是否有话题
    RRTalkModel *talkModel = [model.talkList firstObject];
    if (talkModel) {
        NSString *talkStr = talkModel.name ? [NSString stringWithFormat:@"#%@", talkModel.name]: @"";
        if (talkStr.length > 0) {
            allShowTextStr = [allShowTextStr stringByAppendingString:talkStr];
            allShowTextStr = [allShowTextStr stringByAppendingString:@" "];
        }
    }
//    else {
//        isHasTalk = NO;
//        isTalkEnable = NO;
//    }
    textStr = [allShowTextStr stringByAppendingString:textStr];
    
    CGFloat fontSize = 15;
    UIFont *textFont = SYSTEMFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        one.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
        [text appendAttributedString:one];
        
        {
            //真实显示的文字：textStr
            NSString *realDisplayStr = [NSString stringWithFormat:@"%@", textStr];
            if (talkModel && talkModel.enable) {
                NSString *talkStr = talkModel.name ? [NSString stringWithFormat:@"#%@", talkModel.name]: @"";
                if (talkStr.length > 0) {
                    
                    NSRange talkRange = [realDisplayStr rangeOfString:talkStr];
                    if(talkRange.location != NSNotFound) {
                        WS(weakSelf)
                        NSLog(@"这个字符串中存在");
                        [text setTextHighlightRange:talkRange
                                              color:kCOLOR_0091FF
                                    backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                                          tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                            //自定义代码，此处根据需要调整
                            NSLog(@"点击了话题%@",talkStr);
                            weakSelf.isClickHighlightText = YES;
//                            [[RRAppLinkManager sharedManager] goTalkDetail:talkModel.ID toRoot:NO];
                        }];
                    }
                }
            }
        }
    }
    
    CGSize yySize = CGSizeMake((KWidth - 16 * 2), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(16, currentHeight + 16 , (KWidth - 16 * 2), size.height);
   
    //文字高度
    CGFloat textViewHeight = self.yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + 16 + textViewHeight;
    }
   
    self.seasonView.frame = CGRectMake(16, currentHeight + 20 , (KWidth - 16 * 2), 70);

    CGFloat seasonViewHeight = 0;
    if (model.drama) {
        //    self.seasonViewImgV.backgroundColor = [UIColor grayColor];
//        [self.seasonViewImgV rr_delaySetImageWithURLString:model.drama.coverUrl placeholderImage:Kplaceholder_Vertical];
        self.seasonViewTitleLab.text = model.drama.title;
        //    self.seasonViewSubtitleLab.text = @"7.8/2021/韩国/剧情/悬疑/犯罪";
//        self.seasonViewBtn.backgroundColor = [UIColor grayColor];
        
        /* 剧集角标 搜索 */
        NSMutableArray *array = [NSMutableArray array];
        if (model.drama.scoreStr.length > 0 && model.drama.scoreStr.floatValue > 0) {
//            [array addObject:model.drama.score];
            [array addObject:[NSString stringWithFormat:@"%@分", model.drama.scoreStr]];
        }
        if (model.drama.year.length > 0) {
//            [array addObject:model.drama.year];
            [array addObject:[NSString stringWithFormat:@"%@年", model.drama.year]];
        }
        if (model.drama.areaList.count > 0) {
            [array addObjectsFromArray:model.drama.areaList];
        }
        if (model.drama.plotTypeList.count > 0) {
            [array addObjectsFromArray:model.drama.plotTypeList];
        }
        NSString *tempString = [array componentsJoinedByString:@"/"];//分隔符逗号
        tempString = [tempString stringByReplacingOccurrencesOfString:@" " withString:@""];
        self.seasonViewSubtitleLab.text = tempString;
        
//        self.seasonView.hidden = NO;
        
        BOOL enable = model.drama.enable;
        if (enable) {
            self.seasonViewImgV.hidden = NO;
            self.seasonViewTitleLab.hidden = NO;
            self.seasonViewSubtitleLab.hidden = NO;
            self.seasonViewBtn.hidden = NO;
            self.noSeasonViewLab.hidden = YES;
        } else {
            self.seasonViewImgV.hidden = YES;
            self.seasonViewTitleLab.hidden = YES;
            self.seasonViewSubtitleLab.hidden = YES;
            self.seasonViewBtn.hidden = YES;
            self.noSeasonViewLab.hidden = NO;
        }
   
        seasonViewHeight = self.seasonView.frame.size.height;
        currentHeight = currentHeight + 20 + seasonViewHeight;

    } else {
        
        self.seasonViewImgV.hidden = YES;
        self.seasonViewTitleLab.hidden = YES;
        self.seasonViewSubtitleLab.hidden = YES;
        self.seasonViewBtn.hidden = YES;
        self.noSeasonViewLab.hidden = NO;
    }
 
    currentHeight = currentHeight + 20;
    //可能没图片
    //一定有分数
    //可能没文字
    //可能没剧集信息
}

//+ (RRSeriesItemModel *)dramaModel:(RRSeniorCommentsModel *)dramaModel {
//    return dramaModel.drama;
//}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    
    //当前高度
    CGFloat currentHeight = 0;
    CGFloat imageWidth = KWidth;//固定宽度
    CGFloat imageHeight = KHeight * 3 / 5;//固定高度
    
    //    //封面图model
    //    RRSeniorCommentsImageModel *coverImage = [[RRSeniorCommentsImageModel alloc] init];
    //    coverImage.url = model.drama.coverUrl;
    //    coverImage.width = imageWidth;
    //    coverImage.height = imageWidth * 1.65;
    //
    //    NSArray *imagesArr = @[coverImage];
    //    if (model.images.count > 0) {
    //        imagesArr = model.images;
    //    }
    //不需要封面图
    NSArray *imagesArr = @[];
    if (model.images.count > 0) {
        imagesArr = model.images;
    }
    
    //逻辑：找到图片中最的大的高度currentImageHeight，如果大于固定高度imageHeight，使用固定高度imageHeight，反之用currentImageHeight
    for (RRSeniorCommentsImageModel *imageModel in imagesArr) {
        NSInteger modelImageWidth = imageModel.width;
        NSInteger modelImageHeight = imageModel.height;
        NSInteger showImageWidth = imageWidth;
        NSInteger showImageHeight = imageWidth;
        //图片尺寸转变，图片的宽width = 屏幕点宽，计算出图片的高height
        showImageHeight = showImageWidth * modelImageHeight / modelImageWidth;

        if (showImageHeight > currentHeight) {
            currentHeight = showImageHeight;
        }
    }
    
    if (imageHeight > currentHeight) {
        imageHeight = currentHeight;
    }
  
    if (imageHeight > 0) {
        currentHeight = imageHeight;
    }
    
    CGFloat scoreViewHeight = 30;
    currentHeight = currentHeight + 12 + scoreViewHeight;
    
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(0, 0, KWidth - 16 * 2, 300);
    yyContentLab.font = SYSTEMFONT(15);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
    
    NSString *textStr = model.content ?: @"";
    CGFloat fontSize = 15;
    UIFont *textFont = SYSTEMFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_dynamicProvider_222222_E5E7EB;
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        one.lineSpacing = 9 - (textFont.lineHeight - textFont.pointSize);
        one.font = textFont;
        one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
        [text appendAttributedString:one];
    }
    
    CGSize yySize = CGSizeMake((KWidth - 16 * 2), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    yyContentLab.attributedText = text;
    yyContentLab.frame = CGRectMake(16, currentHeight + 16 , (KWidth - 16 * 2), size.height);
    
    //文字高度
    CGFloat textViewHeight = yyContentLab.frame.size.height;
    if (textViewHeight > 0) {
        currentHeight = currentHeight + 16 + textViewHeight;
    }
     
    CGFloat seasonViewHeight = 0;
    RRSeriesItemModel *dramaModel = model.drama;
    if (dramaModel) {
        seasonViewHeight = 70;
    } else {
        seasonViewHeight = 0;
    }
     
    if (seasonViewHeight > 0) {
        currentHeight = currentHeight + 20 + seasonViewHeight;
    }
    
    currentHeight = currentHeight + 20;
 
    return currentHeight;
}

+ (CGFloat)cellContentLabTopWithModel:(RRSeniorCommentsModel *)model {
    
    //当前高度
    CGFloat currentHeight = 0;
    CGFloat imageWidth = KWidth;//固定宽度
    CGFloat imageHeight = KHeight * 3 / 5;//固定高度
    
    //    //封面图model
    //    RRSeniorCommentsImageModel *coverImage = [[RRSeniorCommentsImageModel alloc] init];
    //    coverImage.url = model.drama.coverUrl;
    //    coverImage.width = imageWidth;
    //    coverImage.height = imageWidth * 1.65;
    //
    //    NSArray *imagesArr = @[coverImage];
    //    if (model.images.count > 0) {
    //        imagesArr = model.images;
    //    }
    //不需要封面图
    NSArray *imagesArr = @[];
    if (model.images.count > 0) {
        imagesArr = model.images;
    }
    
    //逻辑：找到图片中最的大的高度currentImageHeight，如果大于固定高度imageHeight，使用固定高度imageHeight，反之用currentImageHeight
    for (RRSeniorCommentsImageModel *imageModel in imagesArr) {
        NSInteger modelImageWidth = imageModel.width;
        NSInteger modelImageHeight = imageModel.height;
        NSInteger showImageWidth = imageWidth;
        NSInteger showImageHeight = imageWidth;
        //图片尺寸转变，图片的宽width = 屏幕点宽，计算出图片的高height
        showImageHeight = showImageWidth * modelImageHeight / modelImageWidth;

        if (showImageHeight > currentHeight) {
            currentHeight = showImageHeight;
        }
    }
    
    if (imageHeight > currentHeight) {
        imageHeight = currentHeight;
    }
  
    if (imageHeight > 0) {
        currentHeight = imageHeight;
    }
    
    CGFloat scoreViewHeight = 30;
    currentHeight = currentHeight + 12 + scoreViewHeight;
    
    //文字头部
    currentHeight = currentHeight + 16;
 
    return currentHeight;
}

#pragma mark - 长按手势
- (void)longPressToDo:(UILongPressGestureRecognizer *)gesture {
//     //长按开始
//     if (gesture.state == UIGestureRecognizerStateBegan) {
//        NSLog(@"--> 长按手势 state :begin ");
//         [self showAlertView];
//    } else {
//         //长按结束
//        NSLog(@"--> 长按手势 state :end ");
//    }
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
//    if (pab == nil) {
//        TOAST(@"复制失败");
//    } else {
//        TOAST(@"已复制");
//    }
}

#pragma mark - 举报
- (void)clickReportBtn {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            __block NSString * Message;
//            //408之后 都为commetType   兼容帖子为reply状态
//            ReportApi * api = [[ReportApi alloc] initWithID:self.model.ID type:KDramaCommentType content:nil];
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
//注视
//没有把请求写在cell中，是因为在VC中也有删除的事件，不然就要写2边代码。
- (void)clickDeleteBtn { 
    if (self.clickDelete) {
        self.clickDelete(self.model);
    }
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

- (void)clickSeasonView:(UIControl *)control {
    if (self.clickDrama) {
        self.clickDrama(self.model);
    }
}

- (void)clickSeasonViewBtn:(UIButton *)btn {
    if (self.clickDrama) {
        self.clickDrama(self.model);
    }
}

#pragma - mark lazy
- (RRDramaCommentDetailImageScrollView *)imageScrollView {
    if (!_imageScrollView) {
        _imageScrollView = [[RRDramaCommentDetailImageScrollView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight * 3 / 5)];
    }
    return _imageScrollView;
}
 
- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(0, 0, KWidth - 16 * 2, 300);
        _yyContentLab.font = SYSTEMFONT(15);
//        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
        longPressGr.minimumPressDuration = 1.0;
        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
}

- (RRDramaCommentDetailScoreView *)scoreView {
    if (!_scoreView) {
//        _scoreView = [[RRDramaCommentScoreView alloc] initWithFrame:CGRectMake(61, 66, 320, 12)];
        _scoreView = [[RRDramaCommentDetailScoreView alloc] initWithFrame:CGRectMake(61, 56, 200, 30)];

    }
    return _scoreView;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [[UILabel alloc] init];
        _dateLab.frame = CGRectMake(0, 0, 40, 30);
        _dateLab.font = SYSTEMFONT(12);
        _dateLab.textColor = kCOLOR_85888F;
    }
    return _dateLab;
}

- (UIControl *)seasonView {
    if (!_seasonView) {
        _seasonView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 70)];
        _seasonView.userInteractionEnabled = YES;
        _seasonView.layer.cornerRadius = 8;
        _seasonView.layer.masksToBounds = YES;
        _seasonView.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
        [_seasonView addTarget:self action:@selector(clickSeasonView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _seasonView;
}

- (UIImageView *)seasonViewImgV {
    if (!_seasonViewImgV) {
        _seasonViewImgV = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 42, 54)];
        _seasonViewImgV.layer.cornerRadius = 6;
        _seasonViewImgV.layer.masksToBounds = YES;
    }
    return _seasonViewImgV;
}

- (UILabel *)seasonViewTitleLab {
    if (!_seasonViewTitleLab) {
        _seasonViewTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 42, 54)];
        _seasonViewTitleLab.font = BOLDSYSTEMFONT(14);
        _seasonViewTitleLab.textColor = kCOLOR_dynamicProvider_000000_DADBDC;

    }
    return _seasonViewTitleLab;
}

- (UILabel *)seasonViewSubtitleLab {
    if (!_seasonViewSubtitleLab) {
        _seasonViewSubtitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 42, 54)];
        _seasonViewSubtitleLab.font = SYSTEMFONT(12);
        _seasonViewSubtitleLab.textColor = kCOLOR_85888F;
    }
    return _seasonViewSubtitleLab;
}

- (UILabel *)noSeasonViewLab {
    if (!_noSeasonViewLab) {
        _noSeasonViewLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 54)];
        _noSeasonViewLab.font = BOLDSYSTEMFONT(14);
        _noSeasonViewLab.textColor = kCOLOR_dynamicProvider_000000_DADBDC;
        _noSeasonViewLab.text = @"内容已下架";
    }
    return _noSeasonViewLab;
}
 
- (UIButton *)seasonViewBtn {
    if (!_seasonViewBtn) {
        _seasonViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 30)];
        _seasonViewBtn.backgroundColor = [kCOLOR_1890FF colorWithAlphaComponent:0.12];
        _seasonViewBtn.layer.cornerRadius = 15;
        _seasonViewBtn.layer.masksToBounds = YES;
        [_seasonViewBtn setTitle:@"去看" forState:UIControlStateNormal];
        [_seasonViewBtn setTitleColor:kCOLOR_1890FF forState:UIControlStateNormal];
        _seasonViewBtn.titleLabel.font = SYSTEMFONT(12);
//        [_seasonViewBtn addTarget:self action:@selector(clickSeasonViewBtn:) forControlEvents:UIControlEventTouchUpInside];
        _seasonViewBtn.userInteractionEnabled = NO;
    }
    return _seasonViewBtn;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1.0f / [UIScreen mainScreen].scale)];
        _line.backgroundColor = kCOLOR_dynamicProvider_E6E7E8_333333;
    }
    return _line;
}
@end
