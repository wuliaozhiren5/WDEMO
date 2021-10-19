//
//  Person.h
//  WDEMO
//
//  Created by WDEMO on 2020/11/12.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
//// JSON:
//{
//    "name":"Jeff",
//    "age":"26",
//    "sex":"Man",
//    "wifeName":"ZQY"
//}
NS_ASSUME_NONNULL_BEGIN
@interface Person : NSObject
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, assign)   NSUInteger      age;
@end

@interface Man : Person
@property (nonatomic, copy)     NSString        *wifeName;
@end

@interface Woman : Person
@property (nonatomic, copy)     NSString        *husbandName;
@end

NS_ASSUME_NONNULL_END
