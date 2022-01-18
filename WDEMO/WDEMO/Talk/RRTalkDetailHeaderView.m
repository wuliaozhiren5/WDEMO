//
//  RRTalkDetailHeaderView.m
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkDetailHeaderView.h"
#import "RRTalkDetailDramaCardCell.h"

@interface RRTalkDetailHeaderView () <RRTalkContentTextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UIView *topView;

@property (nonatomic ,strong) UIImageView *coverImgV;

@property (nonatomic, strong) YYLabel *titleLab;//富文本 #图标（20*20） + 标题 + 热图标（15*15）

@property (nonatomic, strong) UILabel *subTitleLab;//1.1万热度 · 768条讨论

//文字
@property (nonatomic, strong) RRTalkContentTextView *contentTextView;

//卡片
@property (nonatomic, strong) UIView *dramaCard;

@property (nonatomic, strong) UICollectionView *collectionView;//剧集列表

@property (nonatomic, strong) UIView *bottomView;

//渐变view
@property (nonatomic, strong) UIView *gradientLayerView;

//背景图
@property (nonatomic ,strong) UIImageView *backGroundImgV;

//背景图 高斯模糊 毛玻璃
@property (nonatomic ,strong) UIVisualEffectView *effectView;

@property (nonatomic, copy) NSArray *data;
@end

@implementation RRTalkDetailHeaderView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.clipsToBounds = YES;
    
    [self addSubview:self.container];
    [self addSubview:self.backGroundImgV];
    [self.container addSubview:self.topView];
    [self.container addSubview:self.coverImgV];
    [self.container addSubview:self.titleLab];
    [self.container addSubview:self.subTitleLab];
    
    [self.container addSubview:self.contentTextView];
    [self.container addSubview:self.dramaCard];
    [self.dramaCard addSubview:self.collectionView];
    [self.container addSubview:self.bottomView];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    
    [self.backGroundImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.height.equalTo(@(statusMarginToTop() + navMarginToTop()));
    }];
    
    [self.coverImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(5);
        make.leading.equalTo(@(16));
        make.width.equalTo(@(90));
        make.height.equalTo(@(90));
    }];
    
    [self.subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(6 + 3);
        make.leading.equalTo(@(120));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(0));
        make.trailing.equalTo(@(0));
        make.bottom.equalTo(@(0));
        make.height.equalTo(@(8));
        
    }];
}

- (void)setModel:(RRCommunityTalkModel *)model {
    _model = model;
    
    //背景图
    [self.backGroundImgV rr_delaySetImageWithURLString:model.url placeholderImage:nil];
     
    //图片
    [self.coverImgV rr_delaySetImageWithURLString:model.url placeholderImage:[UIImage imageWithColor:kCOLOR_E6E7E8]];
    
    //标题
    {
        NSString *title = model.name ?: @"";
        CGFloat fontSize = 20.0;
        UIFont *textFont = BOLDSYSTEMFONT(fontSize);
        CGFloat textLineSpacing = 8 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        text.lineSpacing = textLineSpacing;
        //设置文本字号
        text.font = textFont;
        //    //设置字体颜色
        text.color = kCOLOR_222222;

        {
            NSMutableAttributedString *attachment = nil;
            // 嵌入 UIImage
            UIImage *image = [UIImage imageNamed:@"ic_topic_detail_jinghao_black"];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
            imageView.frame = CGRectMake(0, 0, 20, 20);
            //        imageView.backgroundColor = [UIColor redColor];
            //        imageView.layer.cornerRadius = 5;
            //        imageView.layer.masksToBounds = YES;
            //        imageView.userInteractionEnabled = YES;
            attachment = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter];
            attachment.lineSpacing = textLineSpacing;
            [text appendAttributedString: attachment];
        }
        {
            //加空格
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" "];
            one.lineSpacing = textLineSpacing;
            one.font = textFont;
            //        one.color = RGBA(84, 84, 84, 1);
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:title];
            one.lineSpacing = textLineSpacing;
            one.font = textFont;
            //        one.color = RGBA(84, 84, 84, 1);
            [text appendAttributedString:one];
        }
        
        //角标 1热 2荐
        NSString *cornerImageStr = nil;
        if (model.corner == 1) {
            cornerImageStr = @"ic_topic_huati_re";
        } else if (model.corner == 2) {
            cornerImageStr = @"ic_topic_huati_jian";
        } else {
            cornerImageStr = nil;
        }
        
        if (cornerImageStr) {
            {
                //加空格
                NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@" "];
                one.lineSpacing = textLineSpacing;
                one.font = textFont;
                //        one.color = RGBA(84, 84, 84, 1);
                [text appendAttributedString:one];
            }
            
            NSMutableAttributedString *attachment = nil;
            // 嵌入 UIImage
            UIImage *image = [UIImage imageNamed:cornerImageStr];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = image;
            imageView.frame = CGRectMake(0, 0, 15, 15);
            //        imageView.backgroundColor = [UIColor redColor];
            //        imageView.layer.cornerRadius = 5;
            //        imageView.layer.masksToBounds = YES;
            //        imageView.userInteractionEnabled = YES;
            attachment = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:imageView.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter];
            attachment.lineSpacing = textLineSpacing;
            [text appendAttributedString: attachment];
        }
        
        //    CGSize yySize = CGSizeMake((KWidth - 120 -16), CGFLOAT_MAX);
        //    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
        ////    CGRect rect = layout.textBoundingRect;
        //    CGSize size = layout.textBoundingSize;
        self.titleLab.attributedText = text;
        CGSize size = [self.titleLab sizeThatFits:CGSizeMake((KWidth - 120 - 16), CGFLOAT_MAX)];
        self.titleLab.frame = CGRectMake(120, statusMarginToTop() + navMarginToTop() + 5, (KWidth - 120 - 16), size.height);
        
    }
    
    //副标题
    self.subTitleLab.text = [NSString stringWithFormat:@"%@热度·%@条讨论",[NSString zanCountHandle:_model.hotValue].length ? [NSString zanCountHandle:_model.hotValue] : @"0",[NSString zanCountHandle:_model.contentCount].length ? [NSString zanCountHandle:_model.contentCount] : @"0"];

    CGFloat headerHeight;
    headerHeight = statusMarginToTop() + navMarginToTop() + 5 + 90;
    
    //    NSString *textStr = @"1.导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？\n2.导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？\n3.导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？";
    
    NSString *textStr = model.introduction ?: @"";
    UIFont *textFont = RR_COMMONFONT(14.0);
    self.contentTextView.maxNumberOfLines = 3;
    self.contentTextView.font = textFont;
    self.contentTextView.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    self.contentTextView.textColor = [kCOLOR_222222 colorWithAlphaComponent:0.8];
    self.contentTextView.btnTextColor = kCOLOR_1890FF;
    self.contentTextView.text = textStr;
    
    CGRect contentTextViewFrame = self.contentTextView.frame;
    contentTextViewFrame.origin.x = 16;
    contentTextViewFrame.origin.y = headerHeight + 12;
    self.contentTextView.frame = contentTextViewFrame;
    
    CGFloat contentTextViewHight = self.contentTextView.frame.size.height;
    if (contentTextViewHight > 0) {
        headerHeight = headerHeight + contentTextViewHight + 12;
    }
     
    NSMutableArray *enableSeasonArr = [NSMutableArray array];
    for (RRSeriesItemModel *season in model.seasons) {
        if (season.enable) {
            [enableSeasonArr addObject:season];
        }
    }
    self.data = [enableSeasonArr copy];
    BOOL isHasDrama = (self.data.count > 0);
    if (isHasDrama) {
        self.dramaCard.frame = CGRectMake(16, headerHeight + 12, KWidth - 16 * 2, 55);
        self.collectionView.frame = CGRectMake(0, 0, self.dramaCard.frame.size.width, self.dramaCard.frame.size.height);
    } else {
        self.dramaCard.frame = CGRectMake(16, headerHeight + 12, KWidth - 16 * 2, 0);
        self.collectionView.frame = CGRectMake(0, 0, self.dramaCard.frame.size.width, self.dramaCard.frame.size.height);
    }
    [self.collectionView reloadData];
    
    CGFloat dramaCardHight = self.dramaCard.frame.size.height;
    if (dramaCardHight > 0) {
        headerHeight = headerHeight + dramaCardHight + 12;
    }
}

- (void)addGradientLayer {
    
    if (self.gradientLayerView) {
        [self.gradientLayerView removeFromSuperview];
    }
    UIView *view = [[UIView alloc] init];
    view.frame = self.bounds;
    [self addSubview:view];
    //置底
    [self sendSubviewToBack:view];

    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = self.bounds;
    gl.startPoint = CGPointMake(0.69, 0.31);
    gl.endPoint = CGPointMake(0.31, 0.69);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:202.93750405311584/255.0 green:229.98296320438385/255.0 blue:255/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:236.93750202655792/255.0 green:237.65999525785446/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [view.layer addSublayer:gl];
    view.alpha = 0.9;
    self.gradientLayerView = view;
    
    
    if (self.effectView) {
        [self.effectView removeFromSuperview];
    }
    //实现模糊效果
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    //毛玻璃视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectView.contentView.backgroundColor = RGBA(0, 0, 0, 0.4);
//    effectView.alpha = 0.3;
    effectView.alpha = 0.7;
    effectView.frame = self.bounds;
    [self.backGroundImgV addSubview:effectView];
    //置底
    [self sendSubviewToBack:self.backGroundImgV];
    self.effectView = effectView;

}

- (CGFloat)headerHeight {
    CGFloat headerHeight = statusMarginToTop() + navMarginToTop() + 5 + 90;
    CGFloat contentTextViewHight = self.contentTextView.frame.size.height;
    CGFloat dramaCardHight = self.dramaCard.frame.size.height;
    
    if (contentTextViewHight <= 0 && dramaCardHight <= 0) {
        //情况1：无导语，无剧集
        headerHeight = headerHeight + 12 + 4;
        
    } else if (contentTextViewHight > 0 && dramaCardHight <= 0) {
        //情况2：有导语，无剧集
        headerHeight = headerHeight + 12 + contentTextViewHight;
        
    } else if (contentTextViewHight <= 0 && dramaCardHight > 0) {
        //情况3：无导语，有剧集
        headerHeight = headerHeight + 12 + dramaCardHight;
        
    } else if (contentTextViewHight > 0 && dramaCardHight > 0) {
        //情况2：有导语，有剧集
        headerHeight = headerHeight + 12 + contentTextViewHight + 12 + dramaCardHight;
    }
    
    return headerHeight + 12 + 8; //8是最热最新圆角
}

#pragma mark - RRTalkContentTextViewDelegate
- (void)clickOpen {
    CGRect dramaCardFrame = self.dramaCard.frame;
    dramaCardFrame.origin.x = 16;
    dramaCardFrame.origin.y = self.contentTextView.origin.y + self.contentTextView.frame.size.height + 12;
    self.dramaCard.frame = dramaCardFrame;
    
    if (self.delegate || [self.delegate respondsToSelector:@selector(talkDetailHeaderViewFrameChange)]) {
        [self.delegate talkDetailHeaderViewFrameChange];
    }
}

- (void)clickClose {
    CGRect dramaCardFrame = self.dramaCard.frame;
    dramaCardFrame.origin.x = 16;
    dramaCardFrame.origin.y = self.contentTextView.origin.y + self.contentTextView.frame.size.height + 12;
    self.dramaCard.frame = dramaCardFrame;
    
    if (self.delegate || [self.delegate respondsToSelector:@selector(talkDetailHeaderViewFrameChange)]) {
        [self.delegate talkDetailHeaderViewFrameChange];
    }
}

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    

    RRTalkDetailDramaCardCell *cell = (RRTalkDetailDramaCardCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([RRTalkDetailDramaCardCell class]) forIndexPath:indexPath];
    //    cell.contentView.backgroundColor = [UIColor grayColor];
    RRSeriesItemModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    cell.model = model;
    
    if (!model.rr_contentContext) {
        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
        //        context.contentName = model.title;
        context.contentID = model.dramaId;
        context.contentName = model.title;
        context.contentType = kRRUmengEventVideoTypeValueLongVideo;
        context.page = [RRUMengLogger currentViewControllerPageName:self];;
        context.location = @(indexPath.row).stringValue;
//        context.seasonId = self.seasonId;
        model.rr_contentContext = context;
    }
    cell.rr_statisticsExposureModel = model;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data.count == 1) {
        RRSeriesItemModel *model = [self.data firstObject];

        CGFloat leading = 46;
        CGFloat trailing = 12;
        CGFloat minWidth = 84;
        CGFloat maxWidth = KWidth - 16 * 2;
    //    NSString *text = @"大家看法大家看法大家看法大家看法大家看法大家看法大家看法大家看法大家看法大家看法";
    //    NSString *text = @"大家";
//        NSString *text = @"大家看法大家看法大家看法";
        NSString *text = model.title;

        UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        textLab.font = BOLDSYSTEMFONT(14);
        textLab.numberOfLines = 1;
        textLab.text = text ?: @"";
        CGSize textSize = [textLab sizeThatFits:CGSizeZero];
    
        CGFloat width = leading + textSize.width + trailing;
        CGFloat height = 55;
        if (width < minWidth) {
            width = minWidth;
        } else if (width > maxWidth) {
            width = maxWidth;
        } else {
        }
        return CGSizeMake(width, height);
    
    } else {
        CGFloat width = (KWidth - 16 * 2 - 8) / 2;
        CGFloat height = 55;
        return CGSizeMake(width, height);
        
    }
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //iOS 中获取当前点击的cell 
    RRSeriesItemModel *model = [self.data objectOrNilAtIndex:indexPath.item];
    NSString *dramaId = model.dramaId;
    [[RRAppLinkManager sharedManager] goSeasonDetail:dramaId title:nil isMovie:NO toRoot:NO];
    
}
#pragma mark - lazy
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    }
    return _container;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    }
    return _topView;
}

- (UIImageView *)coverImgV {
    if (!_coverImgV) {
        _coverImgV = [[UIImageView alloc] init];
        _coverImgV.frame = CGRectMake(16, 16, 90, 90);
        _coverImgV.contentMode = UIViewContentModeScaleAspectFill;
        //        _avatarImageView.backgroundColor = [UIColor grayColor];
        //        _coverImageView.hidden = YES;
        _coverImgV.layer.cornerRadius = 8;
        _coverImgV.layer.masksToBounds = YES;
        _coverImgV.layer.borderWidth = 2;
        _coverImgV.layer.borderColor = [kCOLOR_FFFFFF colorWithAlphaComponent:0.24].CGColor;
//        _coverImgV.layer.borderColor = [UIColor redColor].CGColor;
//        _coverImgV.userInteractionEnabled = YES;
        _coverImgV.image = IMAGENAME(@"ranking_cover");
    }
    return _coverImgV;
}

- (YYLabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [YYLabel new];
        _titleLab.frame = CGRectMake(0, 0, 40, 40);
        //        _titleLab.font = RR_COMMONFONT(14);
        _titleLab.font = BOLDSYSTEMFONT(20);
        _titleLab.textColor = kCOLOR_dynamicProvider_222222_DADBDC;
        _titleLab.numberOfLines = 2;
        //        _titleLab.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _titleLab;
}

- (UILabel *)subTitleLab {
    if (!_subTitleLab) {
        _subTitleLab = [[UILabel alloc] init];
        _subTitleLab.frame = CGRectMake(0, 0, 40, 40);
        _subTitleLab.font = RR_COMMONFONT(12);
        _subTitleLab.textColor = [kCOLOR_222222 colorWithAlphaComponent:0.6];
    }
    return _subTitleLab;
}

- (RRTalkContentTextView *)contentTextView {
    if (!_contentTextView) {
        _contentTextView = [[RRTalkContentTextView alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 0)];
        _contentTextView.delegate = self;
    }
    return _contentTextView;
}

- (UIView *)dramaCard {
    if (!_dramaCard) {
        _dramaCard = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth - 16 * 2, 55)];
        _dramaCard.backgroundColor = [UIColor clearColor];
        
    }
    return _dramaCard;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 20)];
//        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.backgroundColor = kCOLOR_dynamicProvider_FFFFFF_1F2126;
        [_bottomView setCornerOnTop:8];
    }
    return _bottomView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //水平
        flowLayout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //    Math中的round/ceil/floorf方法总结
        flowLayout.itemSize = CGSizeMake(100, 100);
        //    设置同一列中间隔的cell最小间距
        flowLayout.minimumInteritemSpacing = 8.0;
        //     设置最小行间距
        flowLayout.minimumLineSpacing = 8.0;
        
        //初始化collectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
        [self.collectionView registerClass:[RRTalkDetailDramaCardCell class] forCellWithReuseIdentifier:NSStringFromClass([RRTalkDetailDramaCardCell class])];
    }
    return _collectionView;
}

- (UIImageView *)backGroundImgV {
    if (!_backGroundImgV) {
        _backGroundImgV = [[UIImageView alloc] init];
        _backGroundImgV.frame = CGRectMake(0, 0, 320, 320);
        _backGroundImgV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backGroundImgV;
}
@end
