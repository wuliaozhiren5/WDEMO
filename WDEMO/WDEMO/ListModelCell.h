//
//  ListModelCell.h
//  WDEMO
//
//  Created by rrtv on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "WTableViewCell.h"
#import "ListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListModelCell : WTableViewCell

@property (nonatomic, assign) BOOL isUserEditState;//编辑状态
//@property (nonatomic, assign) BOOL isSelectedState;//被选中状态

//填充数据
- (void)fillWithData:(ListModel *)data;
//计算高度
+ (CGFloat)cellHeightWithModel:(ListModel *)model;
@end

NS_ASSUME_NONNULL_END
