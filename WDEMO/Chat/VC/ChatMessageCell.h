//
//  IMMessageCell.h
//  WDEMO
//
//  Created by rrtv on 2020/7/23.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessageDataModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChatMessageCell : UITableViewCell

- (void)fillWithData:(ChatMessageDataModel *)data;

@end

NS_ASSUME_NONNULL_END