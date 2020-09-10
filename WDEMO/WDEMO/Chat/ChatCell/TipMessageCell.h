//
//  TipMessageCell.h
//  WDEMO
//
//  Created by rrtv on 2020/7/28.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TipMessageCell : ChatMessageCell

- (void)fillWithData:(ChatMessageDataModel *)data;
- (void)fillWithYYData:(ChatMessageYYDataModel *)data;
@end

NS_ASSUME_NONNULL_END
