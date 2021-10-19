//
//  OrderCell.m
//  
//
//  Created by WDEMO on 2020/8/26.
//

#import "OrderCell.h"

@implementation OrderCell

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
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
         
        self.imgV.frame = CGRectMake(10, 10, 40, 40);
        self.nameLab.frame = CGRectMake(60, 10, 200, 20);
        self.descLab.frame = CGRectMake(60, 30, 200, 20);
        self.typeLab.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 10, 80, 20);
//        self.typeLab.frame = CGRectMake(60, 50, 200, 20);

//        self.nameLab.text = @"nameLab";
//        self.descLab.text = @"descLab";
//        self.typeLab.text = @"typeLab";
        
    } else {}
    return self;
}

- (void)setModel:(OrderModel *)model {
//    [_imgV sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    _nameLab.text = model.name;
    _typeLab.text = model.type;
    _descLab.text = model.desc;
}
 
-(UIImageView *)imgV {
    
    if (!_imgV) {
        (_imgV) = [[UIImageView alloc]init];
        (_imgV).frame = CGRectMake(0, 0, 40, 40);
        (_imgV).backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:(_imgV)];
    }
    return (_imgV);
}
 
-(UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_nameLab];
        
    }
    return _nameLab;
    
}

-(UILabel *)descLab {
    if (!_descLab) {
        _descLab = [[UILabel alloc] init];
        _descLab.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_descLab];
        
    }
    return _descLab;
    
}


-(UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [[UILabel alloc] init];
        _typeLab.frame = CGRectMake(0, 0, 40, 40);
        [self.contentView addSubview:_typeLab];
    }
    return _typeLab;
    
}

@end
