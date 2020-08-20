//
//  FGLanguageTool.h
//  WDEMO
//
//  Created by longzhu on 2019/11/29.
//  Copyright © 2019年 wwc. All rights reserved.
//
#define FGGetStringWithKeyFromTable(key, tbl) [[FGLanguageTool sharedInstance] getStringForKey:key withTable:tbl]

#import <Foundation/Foundation.h>

@interface FGLanguageTool : NSObject

+(id)sharedInstance;

/**
 *  返回table中指定的key的值
 *
 *  @param key   key
 *  @param table table
 *
 *  @return 返回table中指定的key的值
 */
-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table;

/**
 *  改变当前语言
 */
-(void)changeNowLanguage;

/**
 *  设置新的语言
 *
 *  @param language 新语言
 */
-(void)setNewLanguage:(NSString*)language;

@end
