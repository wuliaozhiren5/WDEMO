//
//  MYPerson.h
//  WDEMO
//
//  Created by rrtv on 2020/8/11.
//  Copyright © 2020 wwc. All rights reserved.
//

//判断对象是否相等的方法,==与 isEqual
//https://www.jianshu.com/p/ba07b644cfba

#import <Foundation/Foundation.h>
@class MYCar;

NS_ASSUME_NONNULL_BEGIN

@interface MYPerson : NSObject
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger no;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) MYCar *car;

- (BOOL)isEqualToPerson:(MYPerson *)person;
@end

NS_ASSUME_NONNULL_END
