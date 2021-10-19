//
//  FullScreenMessageController.m
//  PUClient
//
//  Created by WDEMO on 2020/9/7.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import "FullScreenMessageController.h"

@interface FullScreenMessageController ()

@end

@implementation FullScreenMessageController
 
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupViews {
    self.isFull = YES;
    self.messageListCellWidth = FullScreenChatViewWidth;
    [super setupViews]; 
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
