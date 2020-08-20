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

- (void)fillWithData:(ListModel *)data;

@end

NS_ASSUME_NONNULL_END
