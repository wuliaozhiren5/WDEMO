//
//  ListModelCell.m
//  WDEMO
//
//  Created by rrtv on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ListModelCell.h"

@implementation ListModelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)fillWithData:(ListModel *)data {
    self.firstLabel.text = data.title;
    self.secondLabel.text = data.detail; 
}

@end
