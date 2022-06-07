//
//  MWSAreaVC.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

//#import "MWSBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSAreaVC : UIViewController

@property (nonatomic, copy) NSArray *data;

@property (nonatomic, copy) NSString *provinceName;

@property (nonatomic, copy) NSString *cityName;
 
@property (nonatomic, copy) void (^ctiyBlock)(NSString *provinceName, NSString *cityName, NSString *areaName);
@end

NS_ASSUME_NONNULL_END
