//
//  AuthorModel.m
//  PUClient
//
//  Created by RRLhy on 15/8/13.
//  Copyright (c) 2015年 RRLhy. All rights reserved.
//

#import "AuthorModel.h"
 
@implementation AuthorModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             @"userIntro":@"description",@"des" : @"description"};
}

//+ (NSDictionary *)mj_objectClassInArray {
//    return @{@"medalList" : @"RRMedalModel"};
//}

+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
    return @{@"ID" : @"id",
             @"userIntro":@"description",
             @"des" : @"description",
             @"isFocus" : @[@"isFocus",@"focused"]
             };
}

//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{@"medalList" : [RRMedalModel class]};
//}

//- (NSString *)fansCount{
//    return [AbbreviationOfNumber AbbreviationOfNumberWithString:_fansCount];
//}

//- (UIColor*)titleColor {
//    if (_titleColor) {
//        return _titleColor;
//    }
//    BOOL isHigh = [[APPThirdPartService sharedAPPThirdPartService] ls_isOwnerPrivilege:kRRMedalPrivilegeHighLight withList:self.medalList];
//    if (isHigh) {
//        _titleColor = kCOLOR_FF6666;
//        return _titleColor;
//    }
//    _titleColor = kCOLOR_dynamicProvider_000000_DADBDC;
//    return _titleColor;
//}

//- (UIColor *)lastReplyNameColor {
//    if (_lastReplyNameColor) {
//        return _lastReplyNameColor;
//    }
//    BOOL isHigh = [[APPThirdPartService sharedAPPThirdPartService] ls_isOwnerPrivilege:kRRMedalPrivilegeNameHighLight withList:self.medalList];
//    if (isHigh) {
//        _lastReplyNameColor = kCOLOR_FF6666;
//        return _lastReplyNameColor;
//    }
//    _lastReplyNameColor = kCOLOR_dynamicProvider_333333_DADBDC;
//    return _lastReplyNameColor;
//}

//- (UIColor *)commentNameColor {
//    if (_commentNameColor) {
//        return _commentNameColor;
//    }
//    BOOL isHigh = [[APPThirdPartService sharedAPPThirdPartService] ls_isOwnerPrivilege:kRRMedalPrivilegeNameHighLight withList:self.medalList];
//    if (isHigh) {
//        _commentNameColor = kCOLOR_FF6666;
//        return _commentNameColor;
//    }
//    _commentNameColor = kCOLOR_dynamicProvider_4A4A4A;
//    return _commentNameColor;
//}

//- (UIColor *)topicDetailNameColor {
//    if (_topicDetailNameColor) {
//        return _topicDetailNameColor;
//    }
//    BOOL isHigh = [[APPThirdPartService sharedAPPThirdPartService] ls_isOwnerPrivilege:kRRMedalPrivilegeNameHighLight withList:self.medalList];
//    if (isHigh) {
//        _topicDetailNameColor = kCOLOR_FF6666;
//        return _topicDetailNameColor;
//    }
//    _topicDetailNameColor = kCOLOR_dynamicProvider_222222_DADBDC;
//    return _topicDetailNameColor;
//}

/*
- (NSArray<RRMedalModel *> *)medals {
    if (!_medals) {
        RRMedalModel *model = [[RRMedalModel alloc] init];
        model.icon = @"https://img.rr.tv/static/images/20170728/ic_big_devil@2x.png";
        model.name = @"大魔王勋章";
        _medals = [NSArray arrayWithObject:model];
    }
    return _medals;
}
 */

@end
