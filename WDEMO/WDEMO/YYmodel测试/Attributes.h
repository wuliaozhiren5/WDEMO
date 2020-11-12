//
//  Attributes.h
//  WDEMO
//
//  Created by rrtv on 2020/10/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
//// JSON:

NS_ASSUME_NONNULL_BEGIN
@interface Shadow : NSObject
@end

@interface Border : NSObject
@end

@interface Attributes : NSObject
@property NSString *name;
@property NSArray *shadows; //Array<Shadow>
@property NSSet *borders; //Set<Border>
@property NSMutableDictionary *attachments; //Dict<NSString,Attachment>
@end

NS_ASSUME_NONNULL_END
