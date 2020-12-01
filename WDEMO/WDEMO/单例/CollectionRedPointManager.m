//
//  CollectionRedPointManager.m
//  WDEMO
//
//  Created by rrtv on 2020/11/30.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "CollectionRedPointManager.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation CollectionRedPointManager

+ (instancetype)sharedInstance {
    static CollectionRedPointManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[CollectionRedPointManager alloc] init];
    });
      
    return sharedManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _isShowRedPoint = NO;
    }
    return self;
}


//请求小红点接口
- (void)reuqestUserSubscriptionRedPointDisplay {
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        BOOL isShow;
        isShow = NO;
        isShow = YES; 
        self.isShowRedPoint = isShow;
        
    });
}
@end
