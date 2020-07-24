//
//  IMMessageCell.h
//  WDEMO
//
//  Created by rrtv on 2020/7/23.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessageData.h"


NS_ASSUME_NONNULL_BEGIN

@interface IMMessageCell : UITableViewCell

- (void)fillWithData:(ChatMessageData *)data;

@end

NS_ASSUME_NONNULL_END
