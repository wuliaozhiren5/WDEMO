//
//  MWSProvinceModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/23.
//

#import <Foundation/Foundation.h>
#import "MWSCityModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MWSProvinceModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;
 
@property (nonatomic, copy) NSArray *city;

@end

NS_ASSUME_NONNULL_END
