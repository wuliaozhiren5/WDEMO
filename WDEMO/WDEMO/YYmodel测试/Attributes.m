//
//  Attributes.m
//  WDEMO
//
//  Created by WDEMO on 2020/10/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "Attributes.h"

@implementation Shadow
@end

@implementation Border
@end

@implementation Attributes
//2.自定义容器映射
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"shadows" : [Shadow class],
             @"borders" : Border.class,
             @"attachments" : @"Attachment" };
}

@end
 
////数组取值
//[self.array objectOrNilAtIndex:10];
//
//
//json 转 Model
//+ (nullable instancetype)modelWithJSON:(id)json;
//+ (nullable instancetype)modelWithDictionary:(NSDictionary *)dictionary;
//
//
//json 转 Array
//+ (nullable NSArray *)modelArrayWithClass:(Class)cls json:(id)json;
//
//
//model 转 JSONString
//- (nullable NSString *)modelToJSONString;
//
//
//model 转 json
//- (nullable NSData *)modelToJSONData;
//
//
//demo
//NSArray *array = [NSArray modelArrayWithClass:[AllSeasonCategorySectionModel class] json:result.data];
//
//xxx *response = [xxx modelWithDictionary:result.data];
//
//
//int main() {
//    // create model from json
//    YYBook *book = [YYBook modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];
//
//    // convert model to json
//    NSString *json = [book modelToJSONString];
//    // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
//}
