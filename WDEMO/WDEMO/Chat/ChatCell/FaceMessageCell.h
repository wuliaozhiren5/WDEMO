//
//  FaceMessageCell.h
//  WDEMO
//
//  Created by WDEMO on 2020/7/28.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageCell.h"
#import "ChatMessageYYDataModel.h"
//#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceMessageCell : ChatMessageCell

- (void)fillWithData:(ChatMessageDataModel *)data;

- (void)fillWithYYData:(ChatMessageYYDataModel *)data;

@end

NS_ASSUME_NONNULL_END
