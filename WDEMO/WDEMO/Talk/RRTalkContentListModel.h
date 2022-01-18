//
//  RRTalkContentListModel.h
//  PPVideo
//
//  Created by rrtv on 2021/12/20.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRTalkContentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkContentListModel : NSObject

@property (nonatomic, assign) BOOL isEnd;

@property (nonatomic, assign) BOOL end;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, copy) NSArray <RRTalkContentModel *> *content;
 
@end
                  
NS_ASSUME_NONNULL_END

