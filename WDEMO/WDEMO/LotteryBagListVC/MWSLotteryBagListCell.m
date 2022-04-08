//
//  MWSLotteryBagListCell.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import "MWSLotteryBagListCell.h"
#import "MWSBagListGoodsInfoCell.h"

@interface MWSLotteryBagListCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MWSLotteryBagListCell

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
        //        self.backgroundColor = kCOLOR_dynamicProvider_F7F8FA_292B31;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    } else {}
    return self;
}

- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    self.container.backgroundColor = [UIColor orangeColor];
    
    [self.contentView addSubview:self.container];
    [self.container addSubview:self.iconImgV];
    [self.iconImgV addSubview:self.bagNoLab];
    [self.iconImgV addSubview:self.countLab];
    
    [self createCollectionView];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.bottom.equalTo(@-8);
        make.leading.equalTo(@12);
        make.trailing.equalTo(@-12);
    }];
    
    [self.iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@8);
        make.centerY.equalTo(self.container);
        make.width.equalTo(@60);
        make.height.equalTo(@50);
    }];
    
    [self.bagNoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.centerX.equalTo(self.iconImgV);
        //        make.leading.equalTo(@36);
        //        make.trailing.equalTo(@36);
    }];
    
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@-4.5);
        make.centerX.equalTo(self.iconImgV);
        //        make.leading.equalTo(@36);
        //        make.trailing.equalTo(@36);
    }];
    
    
    NSString *boxNoStr = @"9999";
    {
        UIFont *textFont = [UIFont systemFontOfSize:14];
        CGFloat lineSpacing = 0 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        //        text.lineSpacing = 2.5;
        text.lineSpacing = lineSpacing;
        //设置文本字号
        text.font = textFont;
        //设置字体颜色
        text.color = [UIColor redColor];
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:boxNoStr];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"箱"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        
        self.bagNoLab.attributedText = text;
        
    }
    
//    self.bagNoLab.text = @"9999箱";
//    self.countLab.text = @"剩80张";
    
    NSString *countStr = @"99";
    {
        UIFont *textFont = [UIFont systemFontOfSize:14];
        CGFloat lineSpacing = 0 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        //        text.lineSpacing = 2.5;
        text.lineSpacing = lineSpacing;
        //设置文本字号
        text.font = textFont;
        //设置字体颜色
        text.color = [UIColor redColor];
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"剩"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:countStr];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"张"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        
        self.countLab.attributedText = text;
        
    }
}

- (void)setModel:(MWSBagsModel *)model {
    _model = model;
    
//    NSString *boxNoStr =  @"99999";
    NSString *boxNoStr = [NSString stringWithFormat:@"%zi", model.bag_no];
    {
        UIFont *textFont = [UIFont systemFontOfSize:14];
        CGFloat lineSpacing = 0 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        //        text.lineSpacing = 2.5;
        text.lineSpacing = lineSpacing;
        //设置文本字号
        text.font = textFont;
        //设置字体颜色
        text.color = [UIColor redColor];
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:boxNoStr];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"箱"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        
        self.bagNoLab.attributedText = text;
        
    }
    
//    self.bagNoLab.text = @"9999箱";
//    self.countLab.text = @"剩80张";
    
//    NSString *countStr = @"99";
    NSString *countStr = [NSString stringWithFormat:@"%zi", model.bag_left];

    {
        UIFont *textFont = [UIFont systemFontOfSize:14];
        CGFloat lineSpacing = 0 - (textFont.lineHeight - textFont.pointSize);
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
        //设置行间距
        //        text.lineSpacing = 2.5;
        text.lineSpacing = lineSpacing;
        //设置文本字号
        text.font = textFont;
        //设置字体颜色
        text.color = [UIColor redColor];
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"剩"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:countStr];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        {
            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"张"];
            one.lineSpacing = lineSpacing;
            one.font = textFont;
//            one.color = [UIColor redColor];
            text.lineBreakMode = NSLineBreakByTruncatingTail;
            
            [text appendAttributedString:one];
        }
        
        self.countLab.attributedText = text;
        
    }
    
    CGFloat height = 0;
    NSArray *arr = model.good_info;
    NSInteger count = arr.count / 4;
    if (count % 4 > 0) {
        count = count + 1;
    }
    height = (26 * count);
    
    CGFloat y = (self.frame.size.height - 16 - height) / 2.0;
    self.collectionView.frame = CGRectMake(80, y, KWidth - 80 - 12 * 2,  height);
    
    [self.collectionView reloadData];
}

//- (void)setModel:(MWSWinningRecordModel *)model {
//    _model = model;
//    
//    [self.avatarImgV rr_delaySetImageWithURLString:model.trade_user_image placeholderImage:nil];
//
//    self.nicknameLab.text = model.trade_user_name;
//    self.timeLab.text = model.trade_created_time;
//    self.bagNoLab.text = [NSString stringWithFormat:@"%@箱",model.trade_bag_no];
//    self.goodsLevelLab.text = [NSString stringWithFormat:@"%@赏",model.trade_goods_level];
//    NSString *goodsNameStr = model.trade_goods_name ?: @"";
//    {
//        UIFont *textFont = [UIFont systemFontOfSize:14];
//        CGFloat lineSpacing = 0 - (textFont.lineHeight - textFont.pointSize);
//        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@""];
//        //设置行间距
////        text.lineSpacing = 2.5;
//        text.lineSpacing = lineSpacing;
//        //设置文本字号
//        text.font = textFont;
//        //设置字体颜色
//        text.color = [UIColor redColor];
//        {
//            NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:goodsNameStr];
//            one.lineSpacing = lineSpacing;
//            one.font = textFont;
//            one.color = [UIColor redColor];
//            text.lineBreakMode = NSLineBreakByTruncatingTail;
//
//            [text appendAttributedString:one];
//        }
//         
//        self.goodsNameLab.attributedText = text;
//        self.goodsNameLab.lineBreakMode = NSLineBreakByTruncatingTail;
//
//    }
//}
 
- (void)createCollectionView {
//    [self.contentView addSubview:self.yyContentLab];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //水平
    flowLayout.scrollDirection= UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

//    CGFloat spacing = 6;
    CGFloat width = floor((KWidth - 80 - 24) / 4.0);
    CGFloat height = 26;

    //    Math中的round/ceil/floorf方法总结
    flowLayout.itemSize = CGSizeMake(width, height);
    //    设置同一列中间隔的cell最小间距
    flowLayout.minimumInteritemSpacing = 0.0;
    //     设置最小行间距
    flowLayout.minimumLineSpacing = 0.0;
    
    //初始化collectionView
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.userInteractionEnabled = NO;
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    [self.collectionView registerClass:[MWSBagListGoodsInfoCell class] forCellWithReuseIdentifier:NSStringFromClass([MWSBagListGoodsInfoCell class])];
    
    [self.container addSubview:self.collectionView];
    
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.equalTo(@80);
//        make.trailing.equalTo(@0);
//        make.top.equalTo(self.container).offset(3);
//        make.bottom.equalTo(self.container).offset(-3);
//
//    }];
    
    {    CGFloat height = 0;
        //    NSArray *arr = model.good_info;
        //    NSInteger count = arr.count / 4;
        //    if (count % 4 > 0) {
        //        count = count + 1;
        //    }
            NSInteger count = 3;
            height = (26 * count);
            
            CGFloat y = 3;
            self.collectionView.frame = CGRectMake(80, y, KWidth - 80 - 12 * 2,  height);
        
    }

 
    
}

#pragma mark --UICollectionViewDataSource
//有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

///每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio
{
    return 10;
    return self.model.good_info.count;
}

//定义并返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MWSBagListGoodsInfoCell *cell = (MWSBagListGoodsInfoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MWSBagListGoodsInfoCell class]) forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//    cell.level = self.level;
//    cell.model = [self.model.good_info objectOrNilAtIndex:indexPath.item];
    return cell;
}
 
//UICollectionView被选中时调用的方法
#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //todo
    NSLog(@" cell");

}

//- (void)setModel:(MWSLotteryDetailBagModel *)model {
//    _model = model;
//    [self.collectionView reloadData];
//}
//

//lazy
- (UIView *)container {
    if (!_container) {
        _container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth)];
        _container.layer.cornerRadius = 2;
        _container.layer.masksToBounds = YES;
        _container.clipsToBounds = NO;
    }
    return _container;
}

- (UIImageView *)iconImgV {
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        _iconImgV.contentMode = UIViewContentModeScaleAspectFill;
        _iconImgV.image = [UIImage imageNamed:@"ic_box"];
        //        _iconImgV.layer.cornerRadius = 18;
        //        _iconImgV.layer.masksToBounds = YES;
    }
    return _iconImgV;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [[UILabel alloc] init];
        _countLab.font = [UIFont systemFontOfSize:14];
        //        _countLab.textAlignment = NSTextAlignmentLeft;
    }
    return _countLab;
}

- (UILabel *)bagNoLab {
    if (!_bagNoLab) {
        _bagNoLab = [[UILabel alloc] init];
        _bagNoLab.font = [UIFont systemFontOfSize:14];
        //        _bagNoLab.textAlignment = NSTextAlignmentLeft;
    }
    return _bagNoLab;
}

//- (UILabel *)goodsLevelLab {
//    if (!_goodsLevelLab) {
//        _goodsLevelLab = [[UILabel alloc] init];
//        _goodsLevelLab.font = [UIFont systemFontOfSize:14];
////        _goodsLevelLab.textAlignment = NSTextAlignmentLeft;
//    }
//    return _goodsLevelLab;
//}
//
//- (UILabel *)goodsNameLab {
//    if (!_goodsNameLab) {
//        _goodsNameLab = [[UILabel alloc] init];
//        _goodsNameLab.font = [UIFont systemFontOfSize:14];
////        _goodsNameLab.textAlignment = NSTextAlignmentLeft;
//        _goodsNameLab.numberOfLines = 2;
//        _goodsNameLab.textColor = [UIColor redColor];
//    }
//    return _goodsNameLab;
//}


@end
