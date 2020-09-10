//
//  FullScreenChatController.h
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullScreenMessageController.h"
#import "ChatController.h"
#import "FullScreenInputController.h"


NS_ASSUME_NONNULL_BEGIN

@interface FullScreenChatController : UIViewController

@property(nonatomic, strong) FullScreenMessageController *messageController;

@property(nonatomic, strong) FullScreenInputController *inputController;

@property (nonatomic, weak) id<ChatControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
