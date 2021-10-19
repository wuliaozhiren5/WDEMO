//
//  Book.h
//  WDEMO
//
//  Created by WDEMO on 2020/10/19.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//// JSON:
//{
//    "n":"Harry Pottery",
//    "p": 256,
//    "ext" : {
//        "desc" : "A book written by J.K.Rowing."
//    },
//    "ID" : 100010
//}

@interface Book : NSObject
@property NSString *name;
@property NSInteger page;
@property NSString *desc;
@property NSString *bookID;
@end

NS_ASSUME_NONNULL_END
