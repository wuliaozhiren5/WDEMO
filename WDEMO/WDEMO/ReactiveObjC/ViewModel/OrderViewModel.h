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

//【iOS开发】MVVM中使用RACCommand做网络请求
//https://cloud.tencent.com/developer/article/1328768
//ReactiveCocoa(五) 之RACCommand使用
//https://www.jianshu.com/p/59557fedfb3c
//iOS开发RAC学习笔记(三)RACCommand
//https://www.jianshu.com/p/dc472c644e7b
//iOS开发之RAC+MVVM实战
//https://www.jianshu.com/p/f71f8a17152f
