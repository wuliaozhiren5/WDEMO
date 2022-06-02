//
//  MWSStoreModel.h
//  MoWanShang
//
//  Created by rrtv on 2022/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//仓库
@interface MWSStoreModel : NSObject
 
@property (nonatomic, assign) NSInteger store;

@property (nonatomic, copy) NSString *storeName;

//手动添加的属性，用来记录选中状态
@property (nonatomic, assign) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
