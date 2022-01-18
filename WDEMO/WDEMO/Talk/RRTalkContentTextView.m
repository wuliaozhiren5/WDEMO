//
//  RRTalkContentTextView.m
//  PPVideo
//
//  Created by rrtv on 2021/12/14.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkContentTextView.h"
#import "YYKit.h"

@interface RRTalkContentTextView ()

@property (nonatomic, strong) YYLabel *contentLab;//导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导语：如何评价南宫珉在黑色太阳中的表演？与囚犯医生相比，哪个更好看？导演。
@property (nonatomic, strong) UIButton *openTextBtn;//展开
@property (nonatomic, strong) UIButton *closeTextBtn;//收起 
@end

@implementation RRTalkContentTextView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        [self setupViews];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        _font = [UIFont systemFontOfSize:14.0];
        _font = RR_COMMONFONT(14.0); 
        _maxNumberOfLines = 3;
        _lineSpacing = 8;
        _textColor = [UIColor blackColor];
        _text = @"";
        _isShowMore = NO;
        _btnTextColor = [UIColor systemBlueColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.contentLab];
    [self addSubview:self.openTextBtn];
    [self addSubview:self.closeTextBtn];
    
}

- (void)setText:(NSString *)text {
    //文字长度不满足
    if (!text || text.length <= 0) {
        //设置整体大小
        self.size = CGSizeZero;
        return;
    }
    //最大行数小于1
    if (_maxNumberOfLines < 1) {
        //设置整体大小
        self.size = CGSizeZero;
        return;
    }
    _text = text;
 
    NSString  *textStr = [text copy];
    //正整宽度
    CGFloat width = self.frame.size.width;
    YYLabel *yyContentLab = [self creatLabel];
    yyContentLab.frame = CGRectMake(0, 0, width, 40);
    yyContentLab.text = textStr;
    //多少行
    NSArray *array = [RRMJTool getSeparatedLinesFromYYLabel:yyContentLab];

    NSString *moreTextStr = @"...";
    NSString *showAllTextStr = @"展开";
    NSString *returnTextStr = @"\n";
    NSString *hideAllTextStr = @"收起";

    UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    textLab.font = _font;
    //@"..."的宽
    textLab.text = moreTextStr;
    CGSize moreTextStrSize = [textLab sizeThatFits:CGSizeMake(CGFLOAT_MAX, 50)];
    CGFloat moreTextStrSizeWidth = ceil(moreTextStrSize.width);
    //@"展开"的宽
    textLab.text = showAllTextStr;
    CGSize showAllTextStrSize = [textLab sizeThatFits:CGSizeMake(CGFLOAT_MAX, 50)];
    CGFloat showAllTextStrSizeWidth = ceil(showAllTextStrSize.width);
    //@"收起"的宽
    textLab.text = hideAllTextStr;
    CGSize hideAllTextStrSize = [textLab sizeThatFits:CGSizeMake(CGFLOAT_MAX, 50)];
    CGFloat hideAllTextStrSizeWidth = ceil(hideAllTextStrSize.width);

    //最后一行的宽：正整宽度 - @"收起"的宽
    CGFloat lastLineWidth = width - hideAllTextStrSizeWidth;
    //最大行数的宽：正整宽度 - @"..."的宽 - @"展开"的宽
    CGFloat maxLineWidth = width - moreTextStrSizeWidth - showAllTextStrSizeWidth;

    //是否显示展开收起
    BOOL isShowMore = _isShowMore;
    //默认是3行
    if (array.count > _maxNumberOfLines) {
        if (isShowMore) {
            //显示收起
            self.openTextBtn.hidden = YES;
            self.closeTextBtn.hidden = NO;

            //最后一行
            NSString *lastLineString = [array lastObject];
            //过滤回车@"\r"
            lastLineString = [NSString filterReturn:lastLineString];
            //过滤换行@"\n"
            lastLineString = [NSString filterNewLine:lastLineString];

            NSString *lineString = @"";
            if (lastLineString.length > 0) {
                //最后一行的label
                YYLabel *lineLab = [self creatLabel];
                lineLab.frame = CGRectMake(0, 0, lastLineWidth, 300);
                lineLab.text = lastLineString;

                NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:lineLab];
                //注意如果lineLab.text = @"";时候lineArray.count = 0,直接去lineArray[0]，会崩溃
                lineString = lineArray.count > 0 ? [lineArray firstObject] : @"";

                //宽度减去之后，最后一行的文字有2行
                if (lineArray.count > 1) {
                    //textStr + \n
                    //注意这里多加了一个空格原因是：发现没有换行
                    textStr = [NSString stringWithFormat:@"%@%@%@", textStr, returnTextStr, @" "];
                } else {
                    //textSt 不处理
                }
            }
        } else {
            //显示展开
            self.openTextBtn.hidden = NO;
            self.closeTextBtn.hidden = YES;

            //n是 _maxNumberOfLines - 1
            NSInteger n = _maxNumberOfLines - 1;
            if (n < 0 ) {
                return;
            }
            NSString *showText = @"";
            for (NSInteger i = 0; i < n; i++) {
                NSString *arrayStr = array[i];
                showText = [NSString stringWithFormat:@"%@%@", showText, arrayStr];
            }

            //第n行：
            NSString *maxLineString = array[n];
            maxLineString = [NSString filterReturn:maxLineString];
            maxLineString = [NSString filterNewLine:maxLineString];
            //
            NSString *lineString = @"";
            if (maxLineString.length > 0) {
                //最后一行的label
                YYLabel *lineLab = [self creatLabel];
                lineLab.frame = CGRectMake(0, 0, maxLineWidth, 300);
                lineLab.text = maxLineString;

                NSArray *lineArray = [RRMJTool getSeparatedLinesFromYYLabel:lineLab];
                //注意如果lineLab.text = @"";时候lineArray.count = 0,直接去lineArray[0]，会崩溃
                lineString = lineArray.count > 0 ? [lineArray firstObject] : @"";

            }
            //lineString + @"..."
            lineString = [NSString stringWithFormat:@"%@%@", lineString, moreTextStr];

            textStr = [NSString stringWithFormat:@"%@%@", showText, lineString];

        }

    } else {
        //不显示收起
        //不显示展开
        self.openTextBtn.hidden = YES;
        self.closeTextBtn.hidden = YES;

    }

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
    attributedText.lineSpacing = _lineSpacing;
    attributedText.font = _font;
    attributedText.color = _textColor;

    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:textStr];
        one.lineSpacing = _lineSpacing;
        one.font = _font;
        one.color = _textColor;
        [attributedText appendAttributedString:one];
    }

//    self.contentLab.attributedText = attributedText;
//    CGSize size = [self.contentLab sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
//    self.contentLab.frame = CGRectMake(0, 0, width, size.height);
//    self.contentLab.backgroundColor = [UIColor orangeColor];
     
    CGSize yySize = CGSizeMake(width, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:yySize text:attributedText];
//    CGRect rect = layout.textBoundingRect;
    CGSize size = layout.textBoundingSize;
    self.contentLab.attributedText = attributedText;
    self.contentLab.frame = CGRectMake(0, 0, width, size.height);
    
    //按钮的位置
    CGRect openTextBtnFrame = CGRectZero;
    openTextBtnFrame.origin.x = self.contentLab.frame.size.width - showAllTextStrSize.width;
    openTextBtnFrame.origin.y = self.contentLab.frame.size.height - showAllTextStrSize.height;
    openTextBtnFrame.size = showAllTextStrSize;
    self.openTextBtn.frame = openTextBtnFrame;
    self.openTextBtn.titleLabel.font = _font;

    CGRect closeTextBtnFrame = CGRectZero;
    closeTextBtnFrame.origin.x = self.contentLab.frame.size.width - hideAllTextStrSize.width;
    closeTextBtnFrame.origin.y = self.contentLab.frame.size.height - hideAllTextStrSize.height;
    closeTextBtnFrame.size = hideAllTextStrSize;
    self.closeTextBtn.frame = closeTextBtnFrame;
    self.closeTextBtn.titleLabel.font = _font;
    
    //设置整体大小
    self.size = CGSizeMake(self.contentLab.frame.size.width, self.contentLab.frame.size.height);
}

- (void)setIsShowMore:(BOOL)isShowMore {
    _isShowMore = isShowMore;
}

- (void)clickOpenTexBtn:(UIButton *)btn {
    _isShowMore = YES;
    self.text = _text;
    if (self.delegate || [self.delegate respondsToSelector:@selector(clickOpen)]) {
        [self.delegate clickOpen];
    }
}

- (void)clickCloseTextBtn:(UIButton *)btn {
    _isShowMore = NO;
    self.text = _text;
    if (self.delegate || [self.delegate respondsToSelector:@selector(clickClose)]) {
        [self.delegate clickClose];
    }
}

- (YYLabel *)creatLabel {
    YYLabel *yyLabel = [YYLabel new];
    yyLabel.frame = CGRectMake(0, 0, 40, 40);
    yyLabel.font = _font;
    yyLabel.textColor = _textColor;
    yyLabel.numberOfLines = 0;
    //        yyLabel.lineBreakMode = NSLineBreakByCharWrapping;
    return yyLabel;
}

//lazy
- (YYLabel *)contentLab {
    if (!_contentLab) {
//        _contentLab = [YYLabel new];
//        _contentLab.frame = CGRectMake(0, 0, 40, 40);
//        _contentLab.font = _font;
//        _contentLab.textColor = _textColor;
//        _contentLab.numberOfLines = 0;
//        //        _titleLab.lineBreakMode = NSLineBreakByCharWrapping;
        _contentLab = [self creatLabel];
    }
    return _contentLab;
}

- (UIButton *)openTextBtn {
    if (!_openTextBtn) {
//        _openTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _openTextBtn.frame = CGRectMake(0, 150, 50, 50);
        _openTextBtn = [[UIButton alloc] init];
        //        _openTextBtn.backgroundColor = kCOLOR_1890FF;
        _openTextBtn.titleLabel.font = _font;
        [_openTextBtn setTitleColor:_btnTextColor forState:UIControlStateNormal];
        [_openTextBtn setTitle:@"展开" forState:UIControlStateNormal];
        [_openTextBtn addTarget:self action:@selector(clickOpenTexBtn:) forControlEvents:UIControlEventTouchUpInside];
        _openTextBtn.hidden = YES;
    }
    return _openTextBtn;
}

- (UIButton *)closeTextBtn {
    if (!_closeTextBtn) {
//        _closeTextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _closeTextBtn.frame = CGRectMake(0, 150, 50, 50);
        _closeTextBtn = [[UIButton alloc] init];
        //        _closeTextBtn.backgroundColor = kCOLOR_1890FF;
        _closeTextBtn.titleLabel.font = _font;
        [_closeTextBtn setTitleColor:_btnTextColor forState:UIControlStateNormal];
        [_closeTextBtn setTitle:@"收起" forState:UIControlStateNormal]; 
        [_closeTextBtn addTarget:self action:@selector(clickCloseTextBtn:) forControlEvents:UIControlEventTouchUpInside];
        _closeTextBtn.hidden = YES;
    }
    return _closeTextBtn;
}
@end
