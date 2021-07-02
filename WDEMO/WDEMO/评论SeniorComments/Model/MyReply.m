//
//  MyReply.m
//  PUClient
//
//  Created by RRLhy on 15/9/18.
//  Copyright © 2015年 RRLhy. All rights reserved.
//

#import "MyReply.h"
#import "RRSeniorCommentsModel.h"

@implementation MyReply

+ (NSDictionary*)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}
+ (NSDictionary*)objectClassInArray{
    return @{@"results":@"MyReply"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"results" : [MyReply class],
             @"commentImages" : [RRSeniorCommentsImageModel class]};
}
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    _createTime =[dic longLongValueForKey:@"createTime" default:0] / 1000.0;
    return YES;
}

@end

@implementation targetModel

+ (NSDictionary*)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}
@end

@implementation MyReplyListModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"results" : [MyReply class]};
}
@end
