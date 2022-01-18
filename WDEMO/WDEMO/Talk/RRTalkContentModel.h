//
//  RRTalkContentModel.h
//  PPVideo
//
//  Created by rrtv on 2021/12/20.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RRTalkContentModel : NSObject

@property (nonatomic, copy) NSString *type;//comment

@property (nonatomic, strong) RRSeniorCommentsModel *contentInfo;

@end


NS_ASSUME_NONNULL_END
