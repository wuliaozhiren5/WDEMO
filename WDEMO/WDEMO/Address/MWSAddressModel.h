//
//  MWSAddressModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSAddressModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *accountId;
//收货人名名字
@property (nonatomic, copy) NSString *name;
//收货人手机
@property (nonatomic, copy) NSString *phone;
//区域-省市区
@property (nonatomic, copy) NSString *area;
//详细地址
@property (nonatomic, copy) NSString *address;
//邮政编码
@property (nonatomic, copy) NSString *zipCode;

@property (nonatomic, assign) BOOL deleted;

@end

NS_ASSUME_NONNULL_END
