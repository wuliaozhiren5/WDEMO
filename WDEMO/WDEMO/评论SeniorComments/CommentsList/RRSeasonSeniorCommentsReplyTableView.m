//
//  RRSeasonSeniorCommentsReplyTableView.m
//  PUClient
//
//  Created by WDEMO on 2021/4/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsReplyTableView.h"
#import "YYKit.h"
#import "RRMJTool.h"
//#import "HXPhotoPicker.h"

@interface RRSeasonSeniorCommentsReplyTableView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIControl *footer;
@property (nonatomic, strong) UILabel *footerLab;
@end

@implementation RRSeasonSeniorCommentsReplyTableView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
    self.delegate = self;
    self.dataSource = self;
    //codecell
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self registerClass:[RRSeasonSeniorCommentsReplyTableViewCell class] forCellReuseIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTableViewCell class])];
//    设置分割线样式
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    //iOS11
    self.estimatedRowHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        //        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
//header
//    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 12)];
//footer
//    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 6)];
//    self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 27)];
    [self addHeader];
    [self addFooter];
}

- (void)addHeader {
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 12)];
}

- (void)addFooter {
    //    NSInteger count = 0;
//        NSInteger count = 10;
//        NSString *text = [NSString stringWithFormat:@"查看%zi条回复",count];

        UIControl *footer = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth, 32)];
    //    footer.backgroundColor = [UIColor redColor];
        [footer addTarget:self action:@selector(clickFooter) forControlEvents:UIControlEventTouchUpInside];
        UILabel *footerLab = [[UILabel alloc] init];
        footerLab.frame = CGRectMake(15, 0, KWidth - 15 * 2, 20);
        footerLab.font = RR_COMMONFONT(12);
        footerLab.textColor = kCOLOR_0091FF;
        [footer addSubview:footerLab];
  
//        footerLab.text = text;
//        if (count > 0) {
//            //文字
//            footer.frame = CGRectMake(0, 0, KWidth, 27);
//            footerLab.hidden  = NO;
//
//        } else {
//            footer.frame = CGRectMake(0, 0, KWidth, 6);
//            footerLab.hidden  = YES;
//        }
//
        self.tableFooterView = footer;
        _footer = footer;
        _footerLab = footerLab;
}

- (void)clickFooter {
    if (self.tableViewDelegate && [self.tableViewDelegate respondsToSelector:@selector(seasonSeniorCommentsReplyTableView:didSelectRowAtIndexPath:)]) {
        [self.tableViewDelegate seasonSeniorCommentsReplyTableView:self didSelectRowAtIndexPath:nil];
    }
}

- (void)setCount:(NSInteger)count {
    _count = count;
    NSString *text = @"";
    if (count > 2) {
        text = [NSString stringWithFormat:@"查看%zi条回复",count];
        //文字
        self.footer.frame = CGRectMake(0, 0, KWidth, 32);
        self.footerLab.hidden  = NO;
        self.footerLab.text = text;
    } else {
        self.footer.frame = CGRectMake(0, 0, KWidth, 6);
        self.footerLab.hidden  = YES;
        self.footerLab.text = text;
    }
}

- (void)setData:(NSArray *)data {
    _data = data;
    [self reloadData];
}
#pragma mark -- UITableViewDataSource
//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

//row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    return [RRSeasonSeniorCommentsReplyTableViewCell cellHeightWithModel:model];
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
//        cell.textLabel.text = [NSString stringWithFormat:@"section = %zi ,row = %zi", indexPath.section, indexPath.row];
    
    RRSeasonSeniorCommentsReplyTableViewCell *cell = (RRSeasonSeniorCommentsReplyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTableViewCell class]) forIndexPath:indexPath];
    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    cell.model= model;
    cell.isHalf = self.isHalf;
//    //WTableViewCell
//    WTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WTableViewCell class]) forIndexPath:indexPath];
//    cell.firstLabel.text = [NSString stringWithFormat:@"cell_section = %zi", indexPath.section];
//    cell.secondLabel.text = [NSString stringWithFormat:@"cell_row = %zi", indexPath.row];
//    cell.xibLabel.text = [NSString stringWithFormat:@"section = %zi ,row = %zi", indexPath.section, indexPath.row];
    
//    //ListModelCell
//    ListModelCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ListModelCell class]) forIndexPath:indexPath];
//    //    ListModel *listModel = self.data[indexPath.row];
//    ListModel *listModel = [self.data objectOrNilAtIndex:indexPath.row];
//    [cell fillWithData:listModel];

     
//    //cell的右边有一个小箭头，距离右边有十几像素；
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    //设置cell分割线的edge可以设置去除指定cell的分割线
//    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    //tableviewCell点击取消选中变灰效果
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

/*
 //header高度
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 {
 return 40;
 }
 
 //footer高度
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 return 40;
 }
 
 //返回每组头标题名称
 -(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
 return @"头";
 }
 
 //返回每组尾部名称
 -(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
 {
 return @"脚";
 }
 
 //自定义头
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
 }
 
 //自定义脚
 - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
 }
 */

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //iOS 中获取当前点击的cell
    //非自定义cell
//    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    //自定义cell
    //NewsTableViewCell * cell = (NewsTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"%@",cell);
    
//    RRSeniorCommentsModel *model = [self.data objectOrNilAtIndex:indexPath.row];
    if (self.tableViewDelegate && [self.tableViewDelegate respondsToSelector:@selector(seasonSeniorCommentsReplyTableView:didSelectRowAtIndexPath:)]) {
        [self.tableViewDelegate seasonSeniorCommentsReplyTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

@end

//------------------------------------------------
@interface RRSeasonSeniorCommentsReplyTableViewCell ()
@property (nonatomic, strong) YYLabel *yyContentLab;//内容

@end

@implementation RRSeasonSeniorCommentsReplyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.yyContentLab];
}

- (void)setModel:(RRSeniorCommentsModel *)model {
    _model = model;
    
    NSString *realNicknameStr = model.authorName ?: @"";
    NSString *realReplyNicknameStr = model.reply2UserName ?: @"";
     
    //text
    NSString *nicknameStr = [realNicknameStr copy];
    NSString *replyNicknameStr = [realReplyNicknameStr copy];
    
    UILabel *nicknameLab = [[UILabel alloc] init];
    nicknameLab.frame = CGRectMake(0, 0, 100, 100);
    nicknameLab.font = RR_COMMONFONT(14);
    nicknameLab.text = realNicknameStr;
    
    UILabel *replyNicknameLab = [[UILabel alloc] init];
    replyNicknameLab.frame = CGRectMake(0, 0, 100, 100);
    replyNicknameLab.font = RR_COMMONFONT(14);
    //text
    replyNicknameLab.text = realReplyNicknameStr;
 
    //昵称避免太长
    NSArray *realNicknameArray = [RRMJTool getSeparatedLinesFromLabel:nicknameLab];
    if (realNicknameArray.count > 1) {
        nicknameStr = [NSString stringWithFormat:@"%@...",realNicknameArray[0]];
    }
    
    //昵称避免太长
    NSArray *realReplyNicknameArray = [RRMJTool getSeparatedLinesFromLabel:replyNicknameLab];
    if (realReplyNicknameArray.count > 1) {
        replyNicknameStr = [NSString stringWithFormat:@"%@...",realReplyNicknameArray[0]];
    }
      
    //冒号
    NSString *colonStr = @"：";
    NSString *replyStr = @" 回复 ";
    NSString *moreTextStr = @"...";
    NSString *lookImageStr = @" 查看图片 ";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";
    
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (!isHasImage) {
         lookImageStr = @"";
    }
    BOOL isReply = (model.reply2UserName.length > 0 && model.reply2UseId > 0);
    if (!isReply) {
       replyStr = @"";
       replyNicknameStr = @"";
    }
    
    textStr = [NSString stringWithFormat:@"%@%@%@%@%@%@", nicknameStr, replyStr, replyNicknameStr, colonStr, textStr, lookImageStr];
    //    self.contentLab.text = textStr;
    self.yyContentLab.text = textStr;
    
    //    ...查看全文
    //    ...查看图片
    //恢复View
    NSArray *array = [RRMJTool getSeparatedLinesFromYYLabel:self.yyContentLab];
    
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
    
    if (array.count > 2 ) {
        //1行
        NSString *showText = [NSString stringWithFormat:@"%@", array[0]];
        //第2行：
        NSString *line2String = array[1];
        //第2行：过滤回车和空行
        line2String = [NSString filterReturn:line2String];
        line2String = [NSString filterNewLine:line2String];
        //第2行：拼接...查看全文
        line2String = [NSString stringWithFormat:@"%@%@%@", line2String, moreTextStr, lookImageStr];//...查看全文
        //第2行：拼接后有去出第一行（因为之前拼接了@“...查看全文”，所以substringToIndex:,是安全的）
        self.yyContentLab.text = line2String;
        NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:self.yyContentLab];
        NSString *lineString = lineArray[0];
        
        //需要填充的字符
        NSString *fillStr = [NSString stringWithFormat:@"%@%@", moreTextStr, lookImageStr];
        //实际截取的字符
        NSString *deleteStr = [NSString stringWithFormat:@"%@", [lineString substringFromIndex:lineString.length - moreTextStr.length - lookImageStr.length]];
//            //保留的字符
//            NSString *retainStr = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - placeholderTextStr.length - showAllTextStr.length]];
     
        int fillStrLength = [RRMJTool convertToInt:fillStr];
        int deleteStrLength = [RRMJTool convertToInt:deleteStr];
        int length = fillStrLength - deleteStrLength;
        if (lineString.length >= (moreTextStr.length + lookImageStr.length + length + 1)) {
            lineString = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - (moreTextStr.length + lookImageStr.length + length + 1)]];
        } else {
            lineString = @"";
        }
        
        //最后，完成1-2行
        showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
        
        //真正可以显示的文本
        NSString *showContentText = @"";
        if (showText.length >= (nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length)) {
            showContentText = [showText substringFromIndex:(nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length)];
        }
  
        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_88898F; //kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_88898F //kCOLOR_0091FF;
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"nicknameStr");
//                [[RRAppLinkManager sharedManager] goUpuserDetail:model.authorId toRoot:NO];

            }];
            [text appendAttributedString:one];
        }
        
        {
            // 回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
//            one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = textColor;
            [text appendAttributedString:one];
        }

        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_88898F; //kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_88898F //kCOLOR_0091FF;
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"replyNicknameStr");
//                [[RRAppLinkManager sharedManager] goUpuserDetail:model.reply2UseId toRoot:NO];

            }];
            [text appendAttributedString:one];
        }

        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }

        {
             NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showContentText];
//            one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = textColor;
            [text appendAttributedString:one];
        }
//
        {
            //...
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:moreTextStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }

        {
            WS(weakSelf)
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"查看图片");
                [weakSelf previewClick];
            }];
            [text appendAttributedString:one];
        }
    } else {

        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_88898F; //kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_88898F //kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"nicknameStr");
//                [[RRAppLinkManager sharedManager] goUpuserDetail:model.authorId toRoot:NO];

            }];
            [text appendAttributedString:one];
        }
        
        {
            // 回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
//            one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = textColor;
            [text appendAttributedString:one];
        }
        
        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_88898F; //kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_88898F //kCOLOR_0091FF;
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"replyNicknameStr");
//                [[RRAppLinkManager sharedManager] goUpuserDetail:model.reply2UseId toRoot:NO];

            }];
            [text appendAttributedString:one];
        }
        
        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:content];
//            one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = textColor;
            [text appendAttributedString:one];
        }
      
        {
            WS(weakSelf)
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"查看图片");
                [weakSelf previewClick];
            }];
            [text appendAttributedString:one];
        }
    }
 
    CGSize yySize = CGSizeMake((KWidth - 61 - 16 - 15 * 2), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(15, 0, (KWidth - 61 - 16 - 15 * 2), size.height);
    
    NSLog(@"%zi", [layout lineIndexForRow:1]);
    NSLog(@"%zi", [layout lineCountForRow:1]);
    NSLog(@"%zi", layout.rowCount);
    
}

+ (CGFloat)cellHeightWithModel:(RRSeniorCommentsModel *)model {
    if (!model) {
        return 0;
    }
    YYLabel *yyContentLab = [YYLabel new];
    yyContentLab.frame = CGRectMake(15, 6, KWidth - 61 - 16 - 15 * 2, 60);
    yyContentLab.font = RR_COMMONFONT(14);
//    yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
    yyContentLab.numberOfLines = 0;
     
    
    NSString *realNicknameStr = model.authorName ?: @"";
    NSString *realReplyNicknameStr = model.reply2UserName ?: @"";
     
    //text
    NSString *nicknameStr = [realNicknameStr copy];
    NSString *replyNicknameStr = [realReplyNicknameStr copy];
    
    UILabel *nicknameLab = [[UILabel alloc] init];
    nicknameLab.frame = CGRectMake(0, 0, 100, 100);
    nicknameLab.font = RR_COMMONFONT(14);
    nicknameLab.text = realNicknameStr;
    
    UILabel *replyNicknameLab = [[UILabel alloc] init];
    replyNicknameLab.frame = CGRectMake(0, 0, 100, 100);
    replyNicknameLab.font = RR_COMMONFONT(14);
    //text
    replyNicknameLab.text = realReplyNicknameStr;
 
    //昵称避免太长
    NSArray *realNicknameArray = [RRMJTool getSeparatedLinesFromLabel:nicknameLab];
    if (realNicknameArray.count > 1) {
        nicknameStr = [NSString stringWithFormat:@"%@...",realNicknameArray[0]];
    }
    
    //昵称避免太长
    NSArray *realReplyNicknameArray = [RRMJTool getSeparatedLinesFromLabel:replyNicknameLab];
    if (realReplyNicknameArray.count > 1) {
        replyNicknameStr = [NSString stringWithFormat:@"%@...",realReplyNicknameArray[0]];
    }
     
    //冒号
    NSString *colonStr = @"：";
    NSString *replyStr = @" 回复 ";
    NSString *moreTextStr = @"...";
    NSString *lookImageStr = @" 查看图片 ";
    NSString *content = [model.content copy] ?: @"";
    NSString *textStr = [model.content copy] ?: @"";
 
    BOOL isHasImage = model.images.count > 0 ? YES : NO;
    if (!isHasImage) {
         lookImageStr = @"";
    }
    BOOL isReply = (model.reply2UserName.length > 0 && model.reply2UseId > 0);
    if (!isReply) {
       replyStr = @"";
       replyNicknameStr = @"";
    }
    
    textStr = [NSString stringWithFormat:@"%@%@%@%@%@%@", nicknameStr, replyStr, replyNicknameStr, colonStr, textStr, lookImageStr];
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
    text.color = textColor;;

    if (array.count > 2 ) {
        //1行
        NSString *showText = [NSString stringWithFormat:@"%@", array[0]];
        //第2行：
        NSString *line2String = array[1];
        //第2行：过滤回车和空行
        line2String = [NSString filterReturn:line2String];
        line2String = [NSString filterNewLine:line2String];
        //第2行：拼接...查看全文
        line2String = [NSString stringWithFormat:@"%@%@%@", line2String, moreTextStr, lookImageStr];//...查看全文
        //第2行：拼接后有去出第一行（因为之前拼接了@“...查看全文”，所以substringToIndex:,是安全的）
        yyContentLab.text = line2String;
        NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];
        NSString *lineString = lineArray[0];
        
        //需要填充的字符
        NSString *fillStr = [NSString stringWithFormat:@"%@%@", moreTextStr, lookImageStr];
        //实际截取的字符
        NSString *deleteStr = [NSString stringWithFormat:@"%@", [lineString substringFromIndex:lineString.length - moreTextStr.length - lookImageStr.length]];
//            //保留的字符
//            NSString *retainStr = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - placeholderTextStr.length - showAllTextStr.length]];
     
        int fillStrLength = [RRMJTool convertToInt:fillStr];
        int deleteStrLength = [RRMJTool convertToInt:deleteStr];
        int length = fillStrLength - deleteStrLength;
        if (lineString.length >= (moreTextStr.length + lookImageStr.length + length + 1)) {
            lineString = [NSString stringWithFormat:@"%@", [lineString substringToIndex:lineString.length - (moreTextStr.length + lookImageStr.length + length + 1)]];
        } else {
            lineString = @"";
        }
        
        //最后，完成1-2行
        showText = [NSString stringWithFormat:@"%@%@", showText, lineString];
         
        //真正可以显示的文本
        NSString *showContentText = @"";
        if (showText.length >= (nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length)) {
            showContentText = [showText substringFromIndex:(nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length)];
        }
  
        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
        
        {
            // 回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        
        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
        
        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        
        {
             NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showContentText];
//            one.lineSpacing = 2.5;
            one.font = textFont;
//            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
        
        {
            //...
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:moreTextStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
    } else {

        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
        
        {
            // 回复
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }
        
        {
            //replyNicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:replyNicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
        
        {
            //冒号
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:colonStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
            [text appendAttributedString:one];
        }

        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:content];
//            one.lineSpacing = 2.5;
            one.font = textFont;
//            one.color = kCOLOR_dynamicProvider_222222_E5E7EB;
            [text appendAttributedString:one];
        }
      
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            [text appendAttributedString:one];
        }
    }
 
    CGSize yySize = CGSizeMake((KWidth - 61 - 16 - 15 * 2), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    CGFloat currentHeight = size.height;
//    yyContentLab.attributedText = text;
//    yyContentLab.frame = CGRectMake(15, 6, (KWidth - 61 - 16 - 15 * 2), rect.size.height);
//
//    NSLog(@"%zi", [layout lineIndexForRow:1]);
//    NSLog(@"%zi", [layout lineCountForRow:1]);
//    NSLog(@"%zi", layout.rowCount);
    
    return currentHeight + 6; //文字高度 + 6
}

//lazy
- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(15, 6, KWidth - 61 - 16 - 15 * 2, 60);
        _yyContentLab.font = RR_COMMONFONT(14);
//        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        
//        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
//        longPressGr.minimumPressDuration = 1.0;
//        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
}

- (void)previewClick {
//    NSMutableArray *assetArray = [NSMutableArray array];
//    for (RRSeniorCommentsImageModel *object in self.model.images) {
//        HXCustomAssetModel *assetModel = [HXCustomAssetModel assetWithNetworkImageURL:[NSURL URLWithString:object.url] selected:YES];
//        [assetArray addObject:assetModel];
//
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
//        return self;
//    };
//    // 跳转预览界面时展现动画的image
//    photoManager.configuration.customPreviewFromImage = ^UIImage *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell.imageView.image;
//        return nil;
//    };
////    // 退出预览界面时终点view
////    photoManager.configuration.customPreviewToView = ^UIView *(NSInteger currentIndex) {
////        HXPhotoSubViewCell *viewCell = [weakSelf.photoView collectionViewCellWithIndex:currentIndex];
////        return viewCell;
////    };
//    
//    [photoManager addCustomAssetModel:assetArray];
//    UIViewController *topVC = [UIViewController topViewController];
// 
//    if (!self.isHalf) {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                              currentIndex:0
//                                                 photoView:nil];
//    } else {
//        [topVC hx_presentPreviewPhotoControllerWithManager:photoManager
//                                              previewStyle:HXPhotoViewPreViewShowStyleDark
//                                     showBottomPageControl:YES
//                                              currentIndex:0
//                                                 photoView:nil
//                                                    height:playerViewHeight()];
//    }
}
@end
 
