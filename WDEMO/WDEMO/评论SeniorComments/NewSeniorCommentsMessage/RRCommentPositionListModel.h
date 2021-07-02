//
//  RRCommentPositionListModel.h
//  PUClient
//
//  Created by rrtv on 2021/6/2.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RRSeniorCommentsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RRCommentPositionListModel : NSObject
 
@property (nonatomic, strong) RRSeniorCommentsListModel *pageView;

@property (nonatomic, strong) RRSeniorCommentsModel *parentCommentView;
 
@property (nonatomic, assign) NSInteger currentPage;

@end

NS_ASSUME_NONNULL_END
