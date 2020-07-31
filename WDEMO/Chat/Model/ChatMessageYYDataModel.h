//
//  ChatMessageYYDataModel.h
//  WDEMO
//
//  Created by rrtv on 2020/7/31.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ChatMessageDataModel.h"
#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatMessageYYDataModel : ChatMessageDataModel

@property (nonatomic, strong) NSAttributedString *yyAttributedString;

@property (nonatomic, strong) YYTextLayout *layout;

@property (nonatomic, strong) NSMutableAttributedString *yyNameStr;

@end

NS_ASSUME_NONNULL_END
