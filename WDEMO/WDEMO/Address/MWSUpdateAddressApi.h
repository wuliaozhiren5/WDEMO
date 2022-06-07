//
//  MWSUpdateAddressApi.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import <Foundation/Foundation.h>
//#import "YTKRequest.h"

NS_ASSUME_NONNULL_BEGIN
@interface MWSUpdateAddressApi : NSObject

//@interface MWSUpdateAddressApi : YTKRequest

////收货人名名字
//@property (nonatomic, copy) NSString *name;
////收货人手机
//@property (nonatomic, copy) NSString *phone;
////区域-省市区
//@property (nonatomic, copy) NSString *area;
////详细地址
//@property (nonatomic, copy) NSString *address;
////邮政编码
//@property (nonatomic, copy) NSString *zipCode;
//
////删除地址 传  id 和 deleted=1
//@property (nonatomic, assign) NSString *ID;
//
//@property (nonatomic, assign) NSInteger deleted;
//
//+ (void)requestDeleteAddressWithID:(NSString *)ID
//                             block:(void(^)(BOOL success, NSError *error))block;
@end

NS_ASSUME_NONNULL_END
