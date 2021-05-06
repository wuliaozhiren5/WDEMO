//
//  RRSeniorCommentsModel.m
//  PUClient
//
//  Created by rrtv on 2021/4/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeniorCommentsModel.h"
#pragma mark - RRSeniorCommentsModel 评论
//评论
@implementation RRSeniorCommentsModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"images" : [RRSeniorCommentsImageModel class],
        @"replies" : [RRSeniorCommentsModel class],
    };
}

- (NSString *)content {
    _content = [NSString filterReturn:_content];
    return _content;
}

@end

@implementation RRSeniorCommentsListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : [RRSeniorCommentsModel class],
             @"images"  : [RRSeniorCommentsImageModel class],
    };
}
@end

#pragma mark - RRSeniorCommentsReplyModel 回复
////回复
//@implementation RRSeniorCommentsReplyModel
//
//@end

@implementation RRSeniorCommentsReplyListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : [RRSeniorCommentsModel class]};
}
@end

@implementation RRSeniorCommentsImageModel
@end

