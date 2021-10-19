//
//  IMMessageCell.h
//  WDEMO
//
//  Created by WDEMO on 2020/7/23.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatHeader.h"
#import "ChatMessageDataModel.h"
#import <YYKit/YYKit.h>
#import "ChatMessageYYDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatMessageCell : UITableViewCell

@property (nonatomic, strong) UILabel *content;

@property (nonatomic, strong) YYLabel *yyContent;

@property (nonatomic, strong) UIImageView *bubbleView;

@property (nonatomic, assign) CGFloat cellWidth;

- (void)fillWithData:(ChatMessageDataModel *)data;
- (void)fillWithYYData:(ChatMessageYYDataModel *)data;
@end

NS_ASSUME_NONNULL_END
