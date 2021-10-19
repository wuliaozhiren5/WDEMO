//
//  WPerson.m
//  WDEMO
//
//  Created by WDEMO on 2020/11/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "WPerson.h"

@implementation WPerson

//- (NSUInteger)hash {
//    return [super hash];
//}

- (NSUInteger)hash {
    return [self.name hash] ^ [self.birthday hash];
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[WPerson class]]) {
        return NO;
    }
    
    return [self isEqualToPerson:(WPerson *)object];
}

- (BOOL)isEqualToPerson:(WPerson *)person {
    if (!person) {
        return NO;
    }
    
    BOOL haveEqualNames = (!self.name && !person.name) || [self.name isEqualToString:person.name];
    BOOL haveEqualBirthdays = (!self.birthday && !person.birthday) || [self.birthday isEqualToDate:person.birthday];
    
    return haveEqualNames && haveEqualBirthdays;
}
@end
