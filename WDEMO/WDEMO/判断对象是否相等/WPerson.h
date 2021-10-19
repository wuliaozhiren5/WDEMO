//
//  WPerson.h
//  WDEMO
//
//  Created by WDEMO on 2020/11/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface WPerson : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *birthday;
@end

NS_ASSUME_NONNULL_END

//iOS开发 之 不要告诉我你真的懂isEqual与hash!
//https://www.jianshu.com/p/915356e280fc
