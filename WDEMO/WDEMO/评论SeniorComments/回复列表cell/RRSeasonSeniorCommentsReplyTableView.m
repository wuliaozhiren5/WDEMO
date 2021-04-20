//
//  RRSeasonSeniorCommentsReplyTableView.m
//  PUClient
//
//  Created by rrtv on 2021/4/9.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeasonSeniorCommentsReplyTableView.h"
#import "YYKit.h"

@interface RRSeasonSeniorCommentsReplyTableView ()<UITableViewDelegate,UITableViewDataSource>
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
    self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_2A2A2A;

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
//        NSInteger count = 0;
        NSInteger count = 10;
        NSString *text = [NSString stringWithFormat:@"查看%zi条回复",count];

        UIControl *footer = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, KWidth, 27)];
    //    footer.backgroundColor = [UIColor redColor];
        [footer addTarget:self action:@selector(clickFooter) forControlEvents:UIControlEventTouchUpInside];
        UILabel *footerLab = [[UILabel alloc] init];
        footerLab.frame = CGRectMake(0, 0, 100, 40);
        footerLab.font = RR_COMMONFONT(14);
        footerLab.textColor = kCOLOR_0091FF;
        [footer addSubview:footerLab];
        [footerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
    //        make.bottom.equalTo(@0);
            make.leading.equalTo(@15);
            make.trailing.equalTo(@-15);
        }];
        footerLab.text = text;
        if (count > 0) {
            //文字
            footer.frame = CGRectMake(0, 0, KWidth, 27);
            footerLab.hidden  = NO;

        } else {
            footer.frame = CGRectMake(0, 0, KWidth, 6);
            footerLab.hidden  = YES;
        }
//
        self.tableFooterView = footer;
        _footer = footer;
        _footerLab = footerLab;
}

- (void)clickFooter {
    
}
#pragma mark -- UITableViewDataSource
//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

//row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

//返回每行cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
//        cell.textLabel.text = [NSString stringWithFormat:@"section = %zi ,row = %zi", indexPath.section, indexPath.row];
    
    RRSeasonSeniorCommentsReplyTableViewCell *cell = (RRSeasonSeniorCommentsReplyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RRSeasonSeniorCommentsReplyTableViewCell class]) forIndexPath:indexPath];
    
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
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.yyContentLab];
    
//    return;
    
    
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"小姐姐：单打独斗是短发"];
//    self.yyContentLab.attributedText = text;
     
//    小姐姐：单打独斗是短发
//    北极星 回复 小姐姐：短发乾隆贼可爱笑点担当。但是人物和环境欠缺时尚…
//    查看图片
//    查看12333条回复
    NSString *realNicknameStr = @"小姐姐小姐姐小姐姐小姐姐小姐姐小姐姐小姐姐小姐姐小姐姐小姐姐";
    NSString *realReplyNicknameStr = @"北极星北极星北极星北极星北极星北极星北极星北极星";
    //text
    NSString *nicknameStr = [realNicknameStr copy];
    NSString *replyNicknameStr = [realReplyNicknameStr copy];
    
    UILabel *nicknameLab = [[UILabel alloc] init];
    nicknameLab.frame = CGRectMake(0, 0, 150, 100);
    nicknameLab.font = RR_COMMONFONT(14);
    nicknameLab.text = realNicknameStr;
    
    UILabel *replyNicknameLab = [[UILabel alloc] init];
    replyNicknameLab.frame = CGRectMake(0, 0, 150, 100);
    replyNicknameLab.font = RR_COMMONFONT(14);
    //text
    replyNicknameLab.text = realReplyNicknameStr;
 
    //昵称避免太长
    NSArray *realNicknameArray = [self getSeparatedLinesFromLabel:nicknameLab];
    if (realNicknameArray.count > 2) {
        nicknameStr = [NSString stringWithFormat:@"%@...",realNicknameArray[0]];
    }
    
    //昵称避免太长
    NSArray *realReplyNicknameArray = [self getSeparatedLinesFromLabel:replyNicknameLab];
    if (realNicknameArray.count > 2) {
        replyNicknameStr = [NSString stringWithFormat:@"%@...",realReplyNicknameArray[0]];
    }
     
    //冒号
    NSString *colonStr = @"：";
    NSString *replyStr = @" 回复 ";
    NSString *moreTextStr = @"...";
    NSString *lookImageStr = @"查看图片";
    NSString *str = @"中国古典长篇小说四大名著简称四大名著是指水浒传三国演义西游记红楼梦按照成书先后顺序这四部巨著四大古典名著是中国文学史中的经典作品是世界宝贵的文化遗产此四部巨著在中国文学史上的地位是难分高低的都有着极高的文学水平和艺术成就细致的刻画和所蕴含的深刻思想都为历代读者所称道其中的故事场景人物已经深深地影响了中国人的思想观念价值取向可谓中国文学史上的四座伟大丰碑。\n中国古典长篇小说四大名著简称四大名著是指水浒传三国演义西游记红楼梦按照成书先后顺序这四部巨著四大古典名著是中国文学史中的经典作品是世界宝贵的文化遗产此四部巨著在中国文学史上的地位是难分高低的都有着极高的文学水平和艺术成就细致的刻画和所蕴含的深刻思想都为历代读者所称道其中的故事场景人物已经深深地影响了中国人的思想观念价值取向可谓中国文学史上的四座伟大丰碑。\n";
    
    NSString *content = [str copy] ?: @"";
    NSString *textStr = [str copy] ?: @"";
    
    BOOL isHasImage = YES;
    if (!isHasImage) {
         lookImageStr = @"";
    }
//    BOOL isReply = YES;
    BOOL isReply = (replyNicknameStr.length > 0);
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
    NSArray *array = [self getSeparatedLinesFromYYLabel:self.yyContentLab];
    CGFloat fontSize = 14;
    UIFont *textFont = RR_COMMONFONT(fontSize);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
    text.lineSpacing = 6 - (textFont.lineHeight - textFont.pointSize);
    text.font = textFont;
    text.color = kCOLOR_85888F;

    if (array.count > 2 ) {
  
        NSString *line2String = array[1];
        NSString *showText = [NSString stringWithFormat:@"%@%@", array[0], [line2String substringToIndex:line2String.length - 7]];
        //真正可以显示的文本
        NSString *showContentText = [showText substringFromIndex:(nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length)];
         
        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"nicknameStr");
            }];
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
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"replyNicknameStr");
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
        
//        {
//            NSString *lineString = array[0];
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:[lineString substringFromIndex:nicknameStr.length + replyStr.length + replyNicknameStr.length + colonStr.length]];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_85888F;
//
//            [text appendAttributedString:one];
//        }
//
//        {
//            NSString *lineString = array[1];
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:[lineString substringToIndex:lineString.length - moreTextStr.length - lookImageStr.length]];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_85888F;
//
//            [text appendAttributedString:one];
//        }
        
        {
             NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showContentText];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_85888F;
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
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"查看图片");
            }];
            [text appendAttributedString:one];
        }
         
//        //1-4行
//        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", nicknameStr, replyStr, replyNicknameStr, colonStr, array[0], [line5String substringToIndex:line5String.length - moreTextStr.length - lookImageStr.length], moreTextStr];
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_85888F;
////            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
////            [one setTextHighlightRange:one.rangeOfAll
////                                 color:kCOLOR_85888F
////                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
////                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
////                //自定义代码，此处根据需要调整
////                NSLog(@"点击了文字 + ...");
////            }];
//            [text appendAttributedString:one];
//        }
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_0091FF;
//            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//            [one setTextHighlightRange:one.rangeOfAll
//                                 color:kCOLOR_0091FF
//                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"查看图片");
//            }];
//            [text appendAttributedString:one];
//        }

    } else {
        
        {
            //nicknameStr
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:nicknameStr];
            //              one.lineSpacing = 2.5;
            one.font = textFont;
            one.color = kCOLOR_0091FF;
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"nicknameStr");
            }];
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
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"replyNicknameStr");
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
            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
            [one setTextHighlightRange:one.rangeOfAll
                                 color:kCOLOR_0091FF
                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                //自定义代码，此处根据需要调整
                NSLog(@"查看图片");
            }];
            [text appendAttributedString:one];
        }
         
//        //1-4行
//        NSString *showText = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", nicknameStr, replyStr, replyNicknameStr, colonStr, array[0], [line5String substringToIndex:line5String.length - moreTextStr.length - lookImageStr.length], moreTextStr];
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:showText];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_85888F;
////            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
////            [one setTextHighlightRange:one.rangeOfAll
////                                 color:kCOLOR_85888F
////                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
////                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
////                //自定义代码，此处根据需要调整
////                NSLog(@"点击了文字 + ...");
////            }];
//            [text appendAttributedString:one];
//        }
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:lookImageStr];
//            //              one.lineSpacing = 2.5;
//            one.font = textFont;
//            one.color = kCOLOR_0091FF;
//            //设置点击范围以及点击事件（必须先设置好然后再将富文本设置给YYLabel才可以生效）
//            [one setTextHighlightRange:one.rangeOfAll
//                                 color:kCOLOR_0091FF
//                       backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.1]
//                             tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
//                //自定义代码，此处根据需要调整
//                NSLog(@"查看图片");
//            }];
//            [text appendAttributedString:one];
//        }
    }
//
 
    CGSize yySize = CGSizeMake((KWidth - 61 - 16 - 15 * 2), CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:text];
    CGRect rect = layout.textBoundingRect;
    //        CGSize size = layout.textBoundingSize;
    self.yyContentLab.attributedText = text;
    self.yyContentLab.frame = CGRectMake(15, 6, (KWidth - 61 - 16 - 15 * 2), rect.size.height + 1);

    NSLog(@"%zi", [layout lineIndexForRow:1]);
    NSLog(@"%zi", [layout lineCountForRow:1]);
    NSLog(@"%zi", layout.rowCount);
}

- (YYLabel *)yyContentLab {
    if (!_yyContentLab) {
        _yyContentLab = [YYLabel new];
        _yyContentLab.frame = CGRectMake(15, 0, KWidth - 61 - 16 - 15 * 2, 60);
        _yyContentLab.font = RR_COMMONFONT(14);
        _yyContentLab.lineBreakMode = NSLineBreakByCharWrapping;
        _yyContentLab.numberOfLines = 0;
        //        _yyContentLab.userInteractionEnabled = YES;
        
//        UILongPressGestureRecognizer* longPressGr = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressToDo:)];
//        longPressGr.minimumPressDuration = 1.0;
//        [_yyContentLab addGestureRecognizer:longPressGr];
    }
    return _yyContentLab;
}

- (NSArray *)getSeparatedLinesFromYYLabel:(YYLabel *)yyLabel {
    UILabel *label= [[UILabel alloc] init];
    label.text = [yyLabel text];
    label.font = [yyLabel font];
    label.frame = [yyLabel frame];
    return [self getSeparatedLinesFromLabel:label];
}

- (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label {
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef)line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return linesArray;
}
@end

////------------------------------------------------
//@interface RRSeasonSeniorCommentsReplyMoreTableViewCell ()
//@property (nonatomic, strong) UILabel *contentLab;//内容
//@end
//
//@implementation RRSeasonSeniorCommentsReplyMoreTableViewCell
//
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//}
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self setupViews];
//    } else {}
//    return self;
//}
//
//- (void)setupViews {
//    [self.contentView addSubview:self.contentLab];
////    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"小姐姐：单打独斗是短发"];
////    self.yyContentLab.attributedText = text;
//     
////    小姐姐：单打独斗是短发
////    北极星 回复 小姐姐：短发乾隆贼可爱笑点担当。但是人物和环境欠缺时尚…
////    查看图片
////    查看12333条回
//    NSInteger count = 100;
//    NSString *text = [NSString stringWithFormat:@"查看%zi条回复",count];
//    self.contentLab.text = text;
//    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@0);
//        make.bottom.equalTo(@0);
//        make.leading.equalTo(@15);
//        make.trailing.equalTo(@-15);
//    }];
//}
//
//- (UILabel *)contentLab {
//    if (!_contentLab) {
//        _contentLab = [[UILabel alloc] init];
//        _contentLab.frame = CGRectMake(0, 0, 100, 40);
//        _contentLab.font = RR_COMMONFONT(14);
//        _contentLab.textColor = kCOLOR_0091FF;
//        _contentLab.numberOfLines = 0;
//
//    }
//    return _contentLab;
//}
//@end
