//
//  MWSMyAddressVC.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/18.
//

//#import "MWSBaseViewController.h"
#import "MWSAddressModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSMyAddressVC : UIViewController

@property (nonatomic, copy) void (^selectAddressBlock)(MWSAddressModel *addressModel);

@end

NS_ASSUME_NONNULL_END

