//
//  OrderModel.h
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;

+(instancetype)initWithName:(NSString *)name desc:(NSString *)desc type:(NSString *)type imageUrl:(NSString *)imageUrl;

@end

NS_ASSUME_NONNULL_END
