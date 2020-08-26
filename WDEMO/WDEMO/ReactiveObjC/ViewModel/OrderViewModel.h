//
//  OrderViewModel.h
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderViewModel : NSObject

@property (nonatomic, strong) RACSubject *refreshUISubject;
@property (strong, nonatomic) RACCommand *reqCommand;
@property (nonatomic, strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
