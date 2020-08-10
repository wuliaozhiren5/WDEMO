//
//  ListModel.h
//  WDEMO
//
//  Created by rrtv on 2020/8/10.
//  Copyright © 2020 wwc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ListModelType) {
    ListModelTypeNone = 0,
    ListModelTypeTagList1,
    ListModelTypeTagList2,
    ListModelType3DTouch,
    ListModelTypeSystemAlter,
    ListModelTypeTableView,
    ListModelTypeCollectionView,
    ListModelTypePassValue,
    ListModelTypeLanguage,//语言切换
    ListModelTypeFont,//字体
    ListModelTypeTwoCollectionList,//上下一对一联动的Collection 
    ListModelTypeCrash,//点击直接崩溃  appdelegat中打开方法，抓取崩溃信息 
    ListModelTypeChat,//直播聊天页面
    ListModelTypeYYText,//YYText富文本
    ListModelTypeMask,//遮罩
    
};

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) ListModelType type;

+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type;

@end

NS_ASSUME_NONNULL_END
