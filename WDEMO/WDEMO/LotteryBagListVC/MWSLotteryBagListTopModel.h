//
//  MWSLotteryBagListTopModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MWSLotteryBagListTopModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

//sort    DESC   ASC
//用 DESC 表示按倒序排序(即：从大到小排序) ---降序排列
//用 ACS   表示按正序排序(即：从小到大排序)---升序排列
@property (nonatomic, copy) NSString *sort;
@end

NS_ASSUME_NONNULL_END
