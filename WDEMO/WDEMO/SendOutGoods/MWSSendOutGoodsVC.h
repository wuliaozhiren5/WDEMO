//
//  MWSSendOutGoodsVC.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/16.
//

//#import "MWSBaseViewController.h"
#import <Foundation/Foundation.h>
#import "MWSStoreModel.h"

NS_ASSUME_NONNULL_BEGIN
//发货页
@interface MWSSendOutGoodsVC : UIViewController

//选中的数组
@property(nonatomic, strong) NSMutableArray *mArr;
 
//仓库
@property(nonatomic, strong) MWSStoreModel *storeModel;

@end

NS_ASSUME_NONNULL_END

