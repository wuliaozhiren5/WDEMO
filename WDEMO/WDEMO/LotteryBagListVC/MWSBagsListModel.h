//
//  MWSBagsListModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/31.
//

#import <Foundation/Foundation.h>
#import "MWSBagsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSBagsListModel : NSObject

@property (nonatomic, copy) NSArray<MWSBagsModel *> *bags;
@property (nonatomic, assign) NSInteger active_total;

@end

NS_ASSUME_NONNULL_END
