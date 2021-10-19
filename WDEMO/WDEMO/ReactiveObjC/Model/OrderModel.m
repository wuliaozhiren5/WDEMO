//
//  OrderModel.m
//  WDEMO
//
//  Created by WDEMO on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

+(instancetype)initWithName:(NSString *)name desc:(NSString *)desc type:(NSString *)type imageUrl:(NSString *)imageUrl {
    OrderModel *model = [[OrderModel alloc]init];
    model.name = name;
    model.desc = desc;
    model.type = type;
    model.imageUrl = imageUrl;
    return model;
}
@end
