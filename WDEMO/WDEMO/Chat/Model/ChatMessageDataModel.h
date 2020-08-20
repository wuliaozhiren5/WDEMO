//
//  ChatMessageData.h
//  WDEMO
//
//  Created by rrtv on 2020/7/24.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FaceAttachment.h"
#import "FaceCell.h"
#import "FaceView.h"
#import "ChatKit.h"
#import "ChatKit.h"
#import "ChatHeader.h"
#import "UIImage+ChatKit.h"

typedef NS_ENUM(NSInteger, ChatMessageType) {
    ChatMessageTypeUnknown,
    ChatMessageTypeTextFace,
    ChatMessageTypeTip,
    ChatMessageTypeEnter,
};

NS_ASSUME_NONNULL_BEGIN

@interface ChatMessageDataModel : NSObject

/**
*  消息的文本内容
*/
@property (nonatomic, copy) NSString *content;

/**
 *  可变字符串
 *  文本消息接收到 content 字符串后，需要将字符串中可能存在的字符串表情（比如[微笑]），转为图片表情。
 *  本字符串则负责存储上述过程转换后的结果。
 */
@property (nonatomic, strong) NSAttributedString *attributedString;

@property (nonatomic, assign)ChatMessageType type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign)CGSize contentSize;

@property (nonatomic, assign)CGPoint textOrigin;

@property (nonatomic, assign)CGPoint bubbleOrigin;

@property (nonatomic, assign)CGSize textSize;

@property (nonatomic, assign)CGSize bubbleSize;


@end

NS_ASSUME_NONNULL_END
