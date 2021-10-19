//
//  MYPerson.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/11.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "MYPerson.h"
#import "MYCar.h"

/*
 一旦重写了isEqual:方法，最好重写hash方法，而且要遵守以下原则：
 1.isEqual:返回YES的2个对象，hash值一定要一样
 2.hash值一样的2个对象，isEqual:返回不一定是YES
 */

@implementation MYPerson

- (NSUInteger)hash
{
    return self.age + self.no + self.name.hash + self.car.hash;
}

- (BOOL)isEqual:(MYPerson *)object
{
    return [self isEqualToPerson:object];
}

- (BOOL)isEqualToPerson:(MYPerson *)person
{
    // 如果是完全相同的对象，就省去后面的判断
    if (self == person) return YES;
    
    // 如果object的类型不对，就不需要比较
    if (![person isKindOfClass:self.class]) return NO;
    
    // 基本数据类型
    BOOL result = (self.age == person.age && self.no == person.no);
    if (result == NO) return result;
    
    // 对象类型,两个对象为nil时isEqual:的结果为0(NO),所以需要专门处理
    if (self.name || person.name) {
        if (![self.name isEqual:person.name]) return NO;
    }
    
    if (self.car || person.car) {
        if (![self.car isEqual:person.car]) return NO;
    }
    
    return YES;
}

////重写类的isEqual:方法
////自己项目代码中的写法
//- (BOOL)isEqual:(MYPerson *)other {
//    if (other == self) {
//        return YES;
//    }
//    if (![other isKindOfClass:[self class]]) {
//        return NO;
//    }
//    MYPerson *model = other;
////    return [self.userId isEqualToString:model.userId];
//    return  self.no == model.no;
//}
@end
 
