//
//  Book.m
//  WDEMO
//
//  Created by WDEMO on 2020/10/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "Book.h"

@implementation Book
//1.自定义属性映射
//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id", @"ID", @"book_id"]};
}
@end


//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{
//        @"seasonId" : @[@"sId", @"id"],
//        @"classify" : @[@"type", @"classify"],
//    };
//}
