//
//  MWSBagsListModel.m
//  MoWanShang
//
//  Created by rrtv on 2022/3/31.
//

#import "MWSBagsListModel.h"

@implementation MWSBagsListModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"bags" : [MWSBagsModel class],
    };
}
@end
