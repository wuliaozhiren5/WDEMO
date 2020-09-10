//
//  FullScreenInputController.m
//  PUClient
//
//  Created by rrtv on 2020/9/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "FullScreenInputController.h"
#import "ChatHeader.h"

@interface FullScreenInputController ()

@end

@implementation FullScreenInputController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setInputStyle {
    self.bottomBar.frame = CGRectMake(self.view.frame.size.width - FullScreenChatViewWidth, 0, FullScreenChatViewWidth, TTextView_Height);
    [self.bottomBar fullStyle];
    self.bottomBar.backgroundColor = InputBarBackgroundColor;
}
@end
