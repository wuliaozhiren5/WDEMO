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
    return @{@"ID" : @"id",
             @"reply2UseId": @[@"reply2UseId", @"reply2UserId"],
    };
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

- (NSString *)authorName {
    if (!_authorName) {
        return @"";
    }
    _authorName = [NSString filterReturn:_authorName];
    _authorName = [NSString filterNewLine:_authorName];
    return _authorName;
}

- (NSString *)reply2UserName {
    if (!_reply2UserName) {
        return @"";
    }
    _reply2UserName = [NSString filterReturn:_reply2UserName];
    _reply2UserName = [NSString filterReturn:_reply2UserName];
    return _reply2UserName;
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
- (NSString *)url {
    return _url ?: @"";
}
@end

