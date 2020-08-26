//
//  OrderViewModel.m
//  WDEMO
//
//  Created by rrtv on 2020/8/26.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "OrderViewModel.h"

@implementation OrderViewModel


- (instancetype)init {
    if (self = [super init]) {
        [self or_initialize];
    }
    return self;
}
- (void)or_initialize {
        [self.reqCommand.executionSignals.switchToLatest subscribeNext:^(NSDictionary *dic) {
//            NSArray *items = dic[@"items"];
//            self.dataArray = [OrderModel mj_objectArrayWithKeyValuesArray:items];
//            [self.refreshUISubject sendNext:nil];
        }];
        [[self.reqCommand.executing skip:1] subscribeNext:^(id x) {
            if ([x isEqualToNumber:@(YES)]) {
//                [MBProgressHUD showCircleHud:nil];
            }else {
//                [MBProgressHUD closeHud:nil];
            }
        }];
    
//    //监听命令是否完成
//    [self.reqCommand.executing subscribeNext:^(id x) {
//        //这里的x是一个带有数据的信号,若这个信号存在那么就说明command还在执行,否则说明没有执行或者执行完毕
//        if ([x boolValue]) {
//            NSLog(@"正在执行");
//        } else {
//            NSLog(@"执行未开始/执行完毕");
//        }
//    }];
}
#pragma mark - 懒加载
- (RACCommand *)reqCommand {
    if (!_reqCommand) {
        _reqCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            //因为要把请求的数据传出去，所以要把网络请求包装在信号里
            RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                //                        NSDictionary *dic = @{@"action":@"getProduct",@"page":@"0"};
                //                        NSString *url = @"http://10.49.3.125:8080/";
                //
                //                        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
                //                        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                //                        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
                //                        [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                //                        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //                            NSError * error;
                //                            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
                //                            [subscriber sendNext:dic];
                //                            [subscriber sendCompleted];
                //                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //                            [MBProgressHUD showMessage:@"网络连接失败" toView:nil];
                //                            [subscriber sendCompleted];
                //                        }];
                
                
                [subscriber sendNext:@"success"];
                [subscriber sendCompleted];
                return nil;
            }];
            //返回网络请求信号
            return signal;
        }];
    }
    return _reqCommand;
}
- (RACSubject *)refreshUISubject {
    if (!_refreshUISubject) {
        _refreshUISubject = [RACSubject subject];
    }
    return _refreshUISubject;
}
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}

@end

