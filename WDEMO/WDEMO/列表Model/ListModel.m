//
//  ListModel.m
//  WDEMO
//
//  Created by rrtv on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type {
    
    ListModel *model = [ListModel alloc];
    model.title = title;
    model.detail = detail;
    model.type = type;
    
//    switch (type)
//    {
//        case ListModelTypeNone:
//        {
//            
//        }
//            break;
//        case ListModelTypeTagList1:
//        {
//            
//        }
//            break;
//        case ListModelTypeTagList2:
//        {
//            
//        }
//            break;
//        default:
//        {
//            NSAssert(NO, @"PLUPersonalItemType 类型错误");
//        }
//            break;
//    }
    return model;
}

@end
