//
//  RRTalkContentListModel.m
//  PPVideo
//
//  Created by rrtv on 2021/12/20.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRTalkContentListModel.h"

@implementation RRTalkContentListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : [RRTalkContentModel class],
    };
}
@end
