//
//  Person.m
//  WDEMO
//
//  Created by WDEMO on 2020/11/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "Person.h"

@implementation Person
//3.根据字典返回类型
//注：这就是多态。
+ (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary {
    if (dictionary[@"sex"] != nil) {
        NSString *runClass = dictionary[@"sex"];
        return NSClassFromString(runClass);
    } else {
        return [self class];
    }
}

@end


//NSData *dataPerson = [self dataWithPath:@"person"];
//Person *person = [Person modelWithJSON:dataPerson];
//[person modelDescription];
