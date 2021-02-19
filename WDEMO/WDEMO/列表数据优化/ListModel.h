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
    ListModelType3DTouch,//3DTouch
    ListModelTypeSystemAlter,//SystemAlter
    ListModelTypeTableView,
    ListModelTypeVerticalCollectionView,//垂直网格
    ListModelTypeHorizontalCollectionView,//水平网格
    ListModelTypePassValue,//传值
    ListModelTypeLanguage,//语言切换
    ListModelTypeFont,//字体
    ListModelTypeTwoCollectionList,//上下一对一联动的Collection 
    ListModelTypeCrash,//点击直接崩溃  appdelegat中打开方法，抓取崩溃信息 
    ListModelTypeChat,//直播聊天页面
    ListModelTypeYYText,//YYText富文本
    ListModelTypeMask,//遮罩
    ListModelTypeAttributedText,//系统富文本
    ListModelTypeIsEqual,//判断对象是否相等
    ListModelTypeDestroyAccount,//用户注销
    ListModelTypeReactiveObjC,//RAC
    ListModelTypeReactiveObjCLogin,//RAC Login
    ListModelTypeScore,//评分只是展示
    ListModelTypeListEdit,//列表编辑
    ListModelTypeSearch,//搜索
    ListModelTypeWebView,//网页
    ListModelTypeArchiver,//归档解档
    
    ListModelTypePageController,//app首页
    ListModelTypePersonalHomepage,//个人主页
    
//    ListModelTypeLoadingView,
//    ListModelTypeBanner,
 
    ListModelTypeTest,//测试页面
};

NS_ASSUME_NONNULL_BEGIN

@interface ListModel : NSObject
@property (nonatomic, copy) NSString *ids;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) ListModelType type;
@property (nonatomic, assign) BOOL isSelected;//被选中状态

+ (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type ids:(NSString *)ids;
+ (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail type:(ListModelType)type;
@end

NS_ASSUME_NONNULL_END
