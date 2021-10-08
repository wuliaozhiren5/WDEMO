//
//  RRSeniorCommentsModel.m
//  PUClient
//
//  Created by rrtv on 2021/4/13.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRSeniorCommentsModel.h"

#pragma mark - RRSeniorCommentsModel 评论Model
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
    _reply2UserName = [NSString filterNewLine:_reply2UserName];
    return _reply2UserName;
}
@end

#pragma mark - RRSeniorCommentsListModel 评论List
@implementation RRSeniorCommentsListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : [RRSeniorCommentsModel class],
             @"images"  : [RRSeniorCommentsImageModel class],
    };
}
@end

#pragma mark - RRSeniorCommentsReplyModel 回复List
@implementation RRSeniorCommentsReplyListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : [RRSeniorCommentsModel class]};
}
@end

//#pragma mark - RRDramaCommentsListModel 影评Model
//@implementation RRDramaCommentsModel
//
//@end
//
//#pragma mark - RRDramaCommentsListModel 影评List
//@implementation RRDramaCommentsListModel
//
//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    return @{@"content" : [RRSeniorCommentsModel class]};
//}
//@end

#pragma mark - RRSeniorCommentsImageModel 图片
@implementation RRSeniorCommentsImageModel
- (NSString *)url {
    return _url ?: @"";
}

//请勿删除，删除会崩溃
- (NSInteger)width {
    return _width > 0 ? _width : 200;
}

//请勿删除，删除会崩溃
- (NSInteger)height {
    return _height > 0 ? _height : 200;
}
@end


