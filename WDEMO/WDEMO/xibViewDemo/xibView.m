//
//  xibView.m
//  WDEMO
//
//  Created by WDEMO on 2020/12/3.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "xibView.h"

@implementation xibView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
}

//xib
//一般是自定义类,需要提供一个遍历构造方法,方便使用
+ (instancetype)initWithXib {
    return [[[NSBundle mainBundle] loadNibNamed:@"xibView" owner:nil options:nil] lastObject];// lastObject 可改为 firstObject，该数组只有一个元素，写哪个都行，看个人习惯。
}
@end
