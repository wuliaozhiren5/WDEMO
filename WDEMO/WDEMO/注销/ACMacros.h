//
//  ACMacros.h
//

#ifndef ACMacros_h
#define ACMacros_h
/** DEBUG LOG **/
#ifdef DEBUG

#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DLog( s, ... )

#endif
#define USER_LEVER_VIEW 111110

#define URL(s) ([NSURL URLWithString:(s)] ?: [NSURL URLWithString:[(s) stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]])

/**判断是否为空**/
#define canUseObj(str) (![str isKindOfClass:[NSNull class]] && (str != nil))
#define canUseArray(array) (array && array.count > 0)
#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self;

/* ****************************************************************************************************************** */
#pragma mark - Frame (宏 x, y, width, height)

#define  KHeight    [UIScreen mainScreen].bounds.size.height
#define  KWidth     [UIScreen mainScreen].bounds.size.width
#define  KHomeHeight    MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define  KHomeWidth     MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)

// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

// 系统控件默认高度
#define kBottomBarHeight        (53.f)
// 2.获得RGB颜色
#define MJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define kMinBorderWidth             (1.f / [[UIScreen mainScreen] scale])
#define KtopViewShowH 240   //topView的显示高度 200
 
#define KSettingUse3G           @"网络提示"     //设置中 是否使用3G的
#define kSettingCache3G         @"缓存提示"     //非wifi 下缓存
#define kSettingFollowingSystemDark   @"跟随系统深色模式"
#define kSettingPlayQuality     @"播放清晰度"   // AI画质 ai 原画 super 高清 high 普清 low
#define kSettingCacheQuality    @"缓存清晰度"   // AI画质 ai 原画 super 高清 high 普清 low
#define kSettingBarrage         @"弹幕开关"     //是否开启弹幕
#define kSettingSeasonPlayYES_373 @"美剧连播默认YES"     //美剧连播默认YES
#define kSettingSeasonPlay      @"美剧连播"     //是否开启美剧连播

#define  ISDisplayedNoticeView        @"isDisplayedSubscibe"// 是否展示过追剧介绍view
#define  ISDisplayedSubscibePush      @"isDisplayedSubscibePush"// 是否展示过追剧打开推送提示

#define RRUserPreferedPlayClarity   @"RRUserPreferedPlayClarity"//清晰度设置新字段
//允许流量播放开关通知
#define KRRSettingTypeAllow3GPlay @"KRRSettingTypeAllow3GPlay"

//450
#define RRUserPreferedPlayQualityCode       @"RRUserPreferedPlayQualityCode"
#define RRUserPreferedDownloadQualityCode   @"RRUserPreferedDownloadQualityCode"

#define PARSE_TYPE_ERROR_98  98  //下载中发生异常
#define PARSE_TYPE_ERROR_99  99  //视频播放错误导致的播放停止
#define PARSE_TYPE_ERROR_101 101 //服务器返回地址为空
#define PARSE_TYPE_ERROR_102 102 //解析方式匹配不到
#define PARSE_TYPE_ERROR_106 106 //原地址获取不到播放文件(点量解析)
#define PARSE_TYPE_ERROR_107 107 //播放错误(播放器报错)
#define PARSE_TYPE_ERROR_108 108 //点亮解析数据有误
#define PARSE_TYPE_ERROR_109 109 //服务器返回地址为空
#define PARSE_TYPE_ERROR_110 110 //客户端异常逻辑
#define PARSE_TYPE_ERROR_111 111 //点量未初始化
#define PARSE_TYPE_ERROR_112 112 //AES解密失败
#define PARSE_TYPE_ERROR_113 113 //http 403


#define kDownDomanPath @"/Downloads"  //下载的地址 //  /Downloads
#define kDownTargetPath @"Video"//下载的所在的文件夹
#define kDownTempPath @"Temp"//下载的所在的文件夹
#define kDownJoinStr @"{|R|}"//腾讯源的数组下载的分隔符
#define kPlayJoinStr @"RR"//腾讯源的数组下载的分隔符 -- 针对已经下载完毕的，不然组成NSUrl

//#import "HTTPStreamingServer.h"
#define KLocaPlaylUrl [NSString stringWithFormat:@"http://127.0.0.1:%lu",(unsigned long)[HTTPStreamingServer sharedInstance].port]

#define V3_Home_CellMargin (9.0)//3.0首页cell的间距


/**是否显示下载，跟缓存纪录**/
#define IsDownloadOpen @"isDownloadOpen"

#define kDefaultShareContent            @"kDefaultShareContent"
#define kDefaultShareSTKey              @"kDefaultSTKey"
#define kDefaultContantSwitchMapKey     @"kDefaultContantSwitchMapKey"
#define kDefaultLoginUserAgreementCheckMark     @"kDefaultLoginUserAgreementCheckMark"
#define kDefaultLoginUserAgreementAndProviderCheckMark     @"kDefaultLoginUserAgreementAndProviderCheckMark_4.3.5"
#define kDefaultLoginProviderOpen     @"kDefaultLoginProviderOpen_4.3.5"

#define kDefaultAmwayUnreadCount        @"kDefaultAmwayUnreadCount"
#define kDefaultLastOpenAppTimestamp    @"kDefaultLastOpenAppTimestamp"
#define kDefaultTodayAmwayNotifyCount   @"kDefaultTodayAmwayNotifyCount"

//弹幕设置显示区域通知
#define DanmuSettingDisplayAreaNotification @"DanmuPopViewCellTypeDisplayArea"

//点击使用流量播放通知
#define KVideoCanPlayIn3GNotification @"KVideoCanPlayIn3GNotification"

//排期表切换cell样式时通知
#define KSchedueCellStyleChang @"KSchedueCellStyleChang"
#define KSchedueCellStyleIsWaterFlow @"KSchedueCellStyleIsWaterFlow"

//我的页面任务id
#define kMyMaxMissionId @"kMyMaxMissionId"

//热启动最短时间间隔
#define MinTimeCount @"minTimeCount"
//外贴片最小展示时长
#define RRPlayerAdSkipTime @"RRPlayerAdSkipTime"
//中插贴片最小展示时长
#define RRPlayerAdMiddleSkipTime @"RRPlayerAdMiddleSkipTime"

#define UpdateMemeryInformation  @"UpdateMemeryInformation"//下载模块更新内存展示信息
#define DownLoadingMaxCount 100 //最大缓存中列表的数量
#define KPersonHolderImg [UIImage imageNamed:@"img_personal_nohead"]
#define KDarkPersonHolderImg [UIImage imageNamed:@"dark_img_personal_nohead"]
#define KplaceholderImg  [UIImage imageWithColor:kCOLOR_dynamicProvider_E6E7E8_333333]
//[UIImage imageNamed:@"heng_default"]  //横-占位图
#define Kplaceholder_Vertical [UIImage imageWithColor:kCOLOR_dynamicProvider_E6E7E8_333333]
//#define Kplaceholder_Vertical  [UIImage imageNamed:@"shu_default"]  //竖直的 新占位图
#define Kplaceholder_Square [UIImage imageWithColor:kCOLOR_dynamicProvider_E6E7E8_333333]
//#define Kplaceholder_Square     [UIImage imageNamed:@"fang_default"]  //方的 新占位图
#define KstarHolderImg          [UIImage imageNamed:@"starHodlerImg"]   //明星头像占位图


//是否是暗黑模式
#define KDarkMode  [UILabel isDarkMode]

//轮播图的比例
#define KCycleScrollViewRatio  (230.0/375.0)

/* ****************************************************************************************************************** */
#pragma mark - Funtion Method (宏 方法)

#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define IMAGENAME(NAME)         [UIImage imageNamed:(NAME)]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    ([UIFont fontWithName:(NAME) size:(FONTSIZE)] ?: [UIFont systemFontOfSize:(FONTSIZE)])
#define MEDIUMFONT(FONTSIZE)    [UIFont fontWithName:@"Helvetica-Bold" size:(FONTSIZE)]
#define DINAlternateBold(FONTSIZE)    [UIFont fontWithName:@"DINAlternate-Bold" size:(FONTSIZE)] ?: [UIFont boldSystemFontOfSize:(FONTSIZE)]

#define BebasNeue(FONTSIZE)    [UIFont fontWithName:@"BebasNeue-Regular" size:(FONTSIZE)] ?: [UIFont systemFontOfSize:(FONTSIZE)]

#define RR_COMMONFONT(FONTSIZE) ([UIFont fontWithName:@"PingFangSC-Regular" size:(FONTSIZE)] ?: [UIFont systemFontOfSize:FONTSIZE])
#define RR_MEDIUMFONT(FONTSIZE) ([UIFont fontWithName:@"PingFangSC-Medium" size:(FONTSIZE)] ?: [UIFont fontWithName:@"Helvetica-Bold" size:(FONTSIZE)])
#define RR_BOLDFONT(FONTSIZE)   ([UIFont fontWithName:@"PingFangSC-Semibold" size:(FONTSIZE)] ?: [UIFont fontWithName:@"Helvetica-Bold" size:(FONTSIZE)])


#define FontWithSize(size) [UIFont adaptFontWithSize:size]
#define BoldFontWithSize(size) [UIFont adaptBoldFontWithSize:size]
#define MediumFontWithSize(size) [UIFont adaptMediumFontWithSize:size]

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:1]
#define RGB(r, g, b)            [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define ColorFromRGBA(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define AdaptHeightByIpad1(height)  height
//((height)/768.f * kScreenCurrentHeight)
#define AdaptWidthByIpad1(width)  width
//((width)/1024.f * kScreenCurrentWidth)

 #pragma mark ---字体颜色---

#define kCOLOR_AppBackground  kCOLOR_dynamicProvider_FFFFFF_1F2126

//字体色
#define kCOLOR_dynamicProvider_333333_DADBDC      [UIColor colorWithDynamicProviderColor:@[RGB(0x33, 0x33, 0x33),RGB(0xda, 0xdb, 0xdc)]]
#define kCOLOR_dynamicProvider_222222_E5E7EB      [UIColor colorWithDynamicProviderColor:@[RGB(0x22, 0x22, 0x22),RGB(0xe5, 0xe7, 0xeb)]]
#define kCOLOR_dynamicProvider_333333_E5E7EB      [UIColor colorWithDynamicProviderColor:@[RGB(0x33, 0x33, 0x33),RGB(0xe5, 0xe7, 0xeb)]]

#define kCOLOR_dynamicProvider_85888F_6D7380      [UIColor colorWithDynamicProviderColor:@[RGB(0x85, 0x88, 0x8F),RGB(0x6d, 0x73, 0x80)]]
//次级字体色
#define kCOLOR_919699       RGB(0x91, 0x96, 0x99)
#define kCOLOR_85888F       RGB(0x85, 0x88, 0x8F)
//全部分类新加的字体颜色
#define kCOLOR_898A91       RGB(0x89, 0x8A, 0x91)

#define kCOLOR_0091FF      RGB(0x00, 0x91, 0xff)
#define kCOLOR_979797      RGB(0x97, 0x97, 0x97)
#define kCOLOR_A8A8A8      RGB(0xA8, 0xA8, 0xA8)
#define kCOLOR_108F80      RGB(0x10, 0x8F, 0x80)
#define kCOLOR_BCBCBC      RGB(0xBC, 0xBC, 0xBC)
#define kCOLOR_2CD35B      RGB(0x2C, 0xD3, 0x5B)

//辅助字体色 或者按钮线
#define kCOLOR_dynamicProvider_CACBCC_616466       [UIColor colorWithDynamicProviderColor:@[RGB(0xCA, 0xCB, 0xCC),RGB(0x61, 0x64, 0x66)]]
//不可点击态
#define kCOLOR_dynamicProvider_DADBDC_515152 [UIColor colorWithDynamicProviderColor:@[RGB(0xDA, 0xDB, 0xDC),RGB(0x51, 0x51, 0x52)]]

#pragma mark ---线的颜色---
//分割线颜色或者占位图颜色
#define kCOLOR_dynamicProvider_E6E7E8_333333       [UIColor colorWithDynamicProviderColor:@[RGB(0xE6, 0xE7, 0xE8),RGB(0x33, 0x33, 0x33)]]
//评论用户等级背景色
#define kCOLOR_dynamicProvider_F0F1F2_333333       [UIColor colorWithDynamicProviderColor:@[RGB(0xF0, 0xF1, 0xF2),RGB(0x33, 0x33, 0x33)]]

//空态页面按钮颜色
#define kCOLOR_1890FFAlpha011  [RGB(0x18, 0x90, 0xFF) colorWithAlphaComponent:0.11]




#pragma mark ---背景色---
#define kCOLOR_F7F8FA RGB(0xF7, 0xF8, 0xFA)

//模块背景色  二级回复,帖子里的转发内容
#define kCOLOR_dynamicProvider_F6F7F8_2A2A2A [UIColor colorWithDynamicProviderColor:@[RGB(0xF6, 0xF7, 0xF8),RGB(0x2a, 0x2a, 0x2a)]]
#define kCOLOR_dynamicProvider_F7F8FA_2A2A2A [UIColor colorWithDynamicProviderColor:@[RGB(0xF7, 0xF8, 0xFA),RGB(0x2a, 0x2a, 0x2a)]]
//评论回复view背景色
#define kCOLOR_dynamicProvider_F7F8FA_292B31 [UIColor colorWithDynamicProviderColor:@[RGB(0xF7, 0xF8, 0xFA),RGB(0x29, 0x2B, 0x31)]]

//输入框背景色 搜索讨论弹幕
#define kCOLOR_dynamicProvider_F2F4F5_2E2E2E       [UIColor colorWithDynamicProviderColor:@[RGB(0xF2, 0xF4, 0xF5),RGB(0x2E, 0x2E, 0x2E)]]

//
#define kCOLOR_dynamicProvider_F2F4F7_2D2E33       [UIColor colorWithDynamicProviderColor:@[RGB(0xF2, 0xF4, 0xF7),RGB(0x2D, 0x2E, 0x33)]]

//输入框背景色 搜索结果页面
#define kCOLOR_dynamicProvider_F2F4F5_2D2E33       [UIColor colorWithDynamicProviderColor:@[RGB(0xF2, 0xF4, 0xF5),RGB(0x2D, 0x2E, 0x33)]]
#define kCOLOR_dynamicProvider_F2F4F5_2F3137       [UIColor colorWithDynamicProviderColor:@[RGB(0xF2, 0xF4, 0xF5),RGB(0x2F, 0x31, 0x37)]]

 #pragma mark ---卡片背景色---
#define kCOLOR_dynamicProvider_FFFFFF_2C2C2C       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0x2c, 0x2c, 0x2c)]]

#pragma mark ---按钮颜色---
//渐变色按钮一级 可点击

//按钮二级可点击
#define kCOLOR_00D5FF  RGB(0x00, 0xD5, 0xFF)
#define kCOLOR_00BBFF  RGB(0x00, 0xBB, 0xFF)
#define kCOLOR_2C2C2C  RGB(0x2c, 0x2c, 0x2c)

//渐变色按钮一级 不可点击
#define kCOLOR_dynamicProvider_DADBDC [UIColor colorWithDynamicProviderColor:@[RGB(0xDA, 0xDB, 0xDC),RGB(0x41, 0x41, 0x41)]]

#define kCOLOR_dynamicProvider_DADBDC_353535       [UIColor colorWithDynamicProviderColor:@[RGB(0xDA, 0xDB, 0xDC),RGB(0x35, 0x35, 0x35)]]
 
//按钮
#define kCOLOR_EDCEFF  RGB(0xed, 0xce, 0xff)
#define kCOLOR_CACBCC  RGB(0xca, 0xcb, 0xcc)
#define kCOLOR_CBCDD4  RGB(0xcb, 0xcd, 0xd4)
//按钮二级 不可点击
#define kCOLOR_DBB258       RGB(0xDB, 0xB2, 0x58)

//三级按钮
#define kCOLOR_F2F4F5 RGB(0xF2, 0xF4, 0xF5)
#define kCOLOR_F2F4F7 RGB(0xF2, 0xF4, 0xF7)

//毛玻璃
#define kCOLOR_effectView_000000_Alpha04 [RGB(0x00, 0x00, 0x00) colorWithAlphaComponent:0.4];

//阴影
#define kCOLOR_Shadow_000000 [RGB(0x00, 0x00, 0x00) colorWithAlphaComponent:0.08]

#define kCOLOR_Shadow_000000Alpha03 [RGB(0x00, 0x00, 0x00) colorWithAlphaComponent:0.3]



#define kCOLOR_dynamicProvider_Shadow_bar_000000Alpha008_000000Alpha14  [UIColor colorWithDynamicProviderColor:@[[RGB(0x00, 0x00, 0x00) colorWithAlphaComponent:0.08],[RGB(0x00, 0x00, 0x00) colorWithAlphaComponent:0.14]]]

//卡片背景颜色
#define kCOLOR_dynamicProvider_FFFFFF_2C2C2C       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0x2c, 0x2c, 0x2c)]]

#define kCOLOR_dynamicProvider_FFFFFF_292B31       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0x29, 0x2b, 0x31)]]

//#define kCOLOR_dynamicProvider_000000_212121       [UIColor colorWithDynamicProviderColor:@[RGB(0x00, 0x00, 0x00),RGB(0x21, 0x21, 0x21)]]


#define kCOLOR_dynamicProvider_FFFFFF_919699       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0x91, 0x96, 0x99)]]

#define kCOLOR_dynamicProvider_FAFAFA_242424       [UIColor colorWithDynamicProviderColor:@[RGB(0xfa, 0xfa, 0xfa),RGB(0x24, 0x24, 0x24)]]

//搜索结果页面背景色
#define kCOLOR_dynamicProvider_FFFFFF_1F2126       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0x1f, 0x21, 0x26)]]
//我的页面背景色
#define kCOLOR_dynamicProvider_F6F8FA_1F2126       [UIColor colorWithDynamicProviderColor:@[RGB(0xf6, 0xf8, 0xfa),RGB(0x1f, 0x21, 0x26)]]
#define kCOLOR_dynamicProvider_CED0D2_4D5056      [UIColor colorWithDynamicProviderColor:@[RGB(0xce, 0xd0, 0xd2),RGB(0x4d, 0x50, 0x56)]]
#define kCOLOR_dynamicProvider_E6E7E8A100_E6E7E8A008      [UIColor colorWithDynamicProviderColor:@[RGBACOLOR(0xE6, 0xE7, 0xE8 ,1),RGBACOLOR(0xE6, 0xE7, 0xE8 ,0.08)]]
#define kCOLOR_dynamicProvider_E6E7E8_373940  [UIColor colorWithDynamicProviderColor:@[RGB(0xE6, 0xE7, 0xE8),RGB(0x37, 0x39, 0x40)]]
#define kCOLOR_C8C8C8       RGB(0xc8, 0xc8, 0xc8)
#define kCOLOR_dynamicProvider_C8C8C8_414141 [UIColor colorWithDynamicProviderColor:@[RGB(0xc8, 0xc8, 0xc8),RGB(0x41, 0x41, 0x41)]]

#define kCOLOR_dynamicProvider_C8C8C8_616466 [UIColor colorWithDynamicProviderColor:@[RGB(0xc8, 0xc8, 0xc8),RGB(0x61, 0x64, 0x66)]]

#define kCOLOR_4A4A4A RGB(0x4a, 0x4a, 0x4a)

#define kCOLOR_dynamicProvider_4A4A4A [UIColor colorWithDynamicProviderColor:@[RGB(0x4a, 0x4a, 0x4a),RGB(0x91, 0x96, 0x99)]]

#define kCOLOR_9B9B9B RGB(0x9B, 0x9B, 0x9B)

#define kCOLOR_dynamicProvider_9B9B9B_919699 [UIColor colorWithDynamicProviderColor:@[RGB(0x9B, 0x9B, 0x9B),RGB(0x91, 0x96, 0x99)]]



#define kCOLOR_AAAAAA RGB(0xaa, 0xaa, 0xaa)
#define kCOLOR_dynamicProvider_AAAAAA_616466     [UIColor colorWithDynamicProviderColor:@[RGB(0xaa, 0xaa, 0xaa),RGB(0x61, 0x64, 0x66)]]

#define kCOLOR_222222 RGB(0x22, 0x22, 0x22)
#define kCOLOR_dynamicProvider_222222_DADBDC      [UIColor colorWithDynamicProviderColor:@[RGB(0x22, 0x22, 0x22),RGB(0xda, 0xdb, 0xdc)]]
#define kCOLOR_dynamicProvider_525252_DADBDC      [UIColor colorWithDynamicProviderColor:@[RGB(0x52, 0x52, 0x52),RGB(0xda, 0xdb, 0xdc)]]

#define kCOLOR_dynamicProvider_AmwayPage_222222      [UIColor colorWithDynamicProviderColor:@[RGB(0x22, 0x22, 0x22),RGB(0x34, 0x34, 0x34)]]

#define kCOLOR_000000 RGB(0x00, 0x00, 0x00)
//
#define kCOLOR_dynamicProvider_000000_DADBDC       [UIColor colorWithDynamicProviderColor:@[RGB(0x00, 0x00, 0x00),RGB(0xda, 0xdb, 0xdc)]]

#define kCOLOR_EEEEEE  RGB(0xee, 0xee, 0xee)
#define kCOLOR_dynamicProvider_EEEEEE       [UIColor colorWithDynamicProviderColor:@[RGB(0xee, 0xee, 0xee),RGB(0x33, 0x33, 0x33)]]

#define kCOLOR_dynamicProvider_FFFAED      [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xfa, 0xed),RGB(0x34, 0x2e, 0x1e) ]]

#define kCOLOR_dynamicProvider_FFFFFF_DADBDC       [UIColor colorWithDynamicProviderColor:@[RGB(0xff, 0xff, 0xff),RGB(0xda, 0xdb, 0xdc)]]
 
#define kCOLOR_dynamicProvider_222222_E5E7E8      [UIColor colorWithDynamicProviderColor:@[RGB(0x22, 0x22, 0x22),RGB(0xe5, 0xe7, 0xe8)]]

#define kCOLOR_C13030 RGB(0xC1, 0x30, 0x30)
#define kCOLOR_1D1D1D RGB(0x1D, 0x1D, 0x1D)
#define kCOLOR_292929 RGB(0x29, 0x29, 0x29)
#define kCOLOR_0F0F0F RGB(0x0F, 0x0F, 0x0F)
#define kCOLOR_282828 RGB(0x28, 0x28, 0x28)


#define kCOLOR_FFFFFF RGB(0xff, 0xff, 0xff)
#define kCOLOR_333333  RGB(0x33, 0x33, 0x33)
#define kCOLOR_FFFFFFAlpha03 [RGB(0xff, 0xff, 0xff) colorWithAlphaComponent:0.3]
#define kCOLOR_FFD541 RGB(0xFF, 0xD5, 0x41)
#define kCOLOR_A08873 RGB(0xA0, 0x88, 0x73)


#define kCOLOR_dynamicProvider_777777_919699      [UIColor colorWithDynamicProviderColor:@[RGB(0x77, 0x77, 0x77),RGB(0x91, 0x96, 0x99)]]

//一键登录里面的其他手机号登录
#define kCOLOR_dynamicProvider_otherMobileLogin_333333       [UIColor colorWithDynamicProviderColor:@[RGB(0x33, 0x33, 0x33),RGB(0x22, 0x2e, 0x2e)]]

#define kCOLOR_E6E7E8   RGB(0xE6, 0xE7, 0xE8)

#define kCOLOR_dynamicProvider_placeholder_CACBCC       [UIColor colorWithDynamicProviderColor:@[RGB(0xCA, 0xCB, 0xCC),RGB(0xda, 0xdb, 0xdc)]]

#define kCOLOR_dynamicProvider_CACBCC_414141       [UIColor colorWithDynamicProviderColor:@[RGB(0xCA, 0xCB, 0xCC),RGB(0x41, 0x41, 0x41)]]

#define kCOLOR_dynamicProvider_otherMobileLogin_CACBCC       [UIColor colorWithDynamicProviderColor:@[RGB(0xCA, 0xCB, 0xCC),RGB(0x2e, 0x2e, 0x2e)]]


#define kCOLOR_DADBDC  RGB(0xDA, 0xDB, 0xDC)


#define  kCOLOR_dynamicProvider_comment_CACBCC [UIColor colorWithDynamicProviderColor:@[RGB(0xCA, 0xCB, 0xCC),RGB(0xff, 0x61, 0x7b)]]


#define kCOLOR_777777       RGB(0x77, 0x77, 0x77)


#define kCOLOR_dynamicProvider_00BBFF_414141 [UIColor colorWithDynamicProviderColor:@[RGB(0x00, 0xBB, 0xFF),RGB(0x41, 0x41, 0x41)]]
#define kCOLOR_dynamicProvider_download_00BBFF [UIColor colorWithDynamicProviderColor:@[RGB(0x00, 0xBB, 0xFF),RGB(0x91, 0x96, 0x99)]]

#define kCOLOR_dynamicProvider_00BBFF_DADBDC       [UIColor colorWithDynamicProviderColor:@[RGB(0x00, 0x00, 0x00),RGB(0xda, 0xdb, 0xdc)]]

//线的颜色
#define kCOLOR_DDDDDD       RGB(0xDD, 0xDD, 0xDD)
#define kCOLOR_dynamicProvider_DDDDDD_333333  [UIColor colorWithDynamicProviderColor:@[RGB(0xDD, 0xDD, 0xDD),RGB(0x33, 0x33, 0x33)]]
//线的颜色
#define kCOLOR_E8E8E8       RGB(0xE8, 0xE8, 0xE8)
#define kCOLOR_dynamicProvider_E8E8E8_333333 [UIColor colorWithDynamicProviderColor:@[RGB(0xE8, 0xE8, 0xE8),RGB(0x33, 0x33, 0x33)]]

#define kCOLOR_E5EAF0       RGB(0xE5, 0xEA, 0xF0)
#define kCOLOR_dynamicProvider_E5EAF0_000000  [UIColor colorWithDynamicProviderColor:@[ RGB(0xE5, 0xEA, 0xF0),RGB(0x00, 0x00, 0x00)]]

#define kCOLOR_757482       RGB(0x75, 0x74, 0x82)
#define kCOLOR_dynamicProvider_757482_E6E7E8  [UIColor colorWithDynamicProviderColor:@[RGB(0x75, 0x74, 0x82),RGB(0xE6, 0xE7, 0xE8)]]

#define kCOLOR_3C3B4D       RGB(0x3C, 0x3B, 0x4D)
#define kCOLOR_dynamicProvider_3C3B4D_E6E7E8  [UIColor colorWithDynamicProviderColor:@[RGB(0x3C, 0x3B, 0x4D),RGB(0xE6, 0xE7, 0xE8)]]

#define kCOLOR_151515       RGB(0x15, 0x15, 0x15)

#define kCOLOR_dynamicProvider_151515_DADBDC  [UIColor colorWithDynamicProviderColor:@[  RGB(0x15, 0x15, 0x15),RGB(0xda, 0xdb, 0xdc)]]


#define kCOLOR_DADBDC       RGB(0xDA, 0xDB, 0xDC)

#define kCOLOR_dynamicProvider_DADBDC_616466      [UIColor colorWithDynamicProviderColor:@[  RGB(0xDA, 0xDB, 0xDC),RGB(0x61, 0x64, 0x66)]]

#define kCOLOR_D8D8D8       RGB(0xd8, 0xd8, 0xd8)
#define kCOLOR_dynamicProvider_D8D8D8_505255   [UIColor colorWithDynamicProviderColor:@[RGB(0xd8, 0xd8, 0xd8),RGB(0x50, 0x52, 0x55)]]

#define KCOLOR_1FCC9E       RGB(0x1F, 0xCC, 0x9E)
#define kCOLOR_dynamicProvider_1FCC9E_1FAC86   [UIColor colorWithDynamicProviderColor:@[RGB(0x1F, 0xCC, 0x9E), RGB(0x1F, 0xAC, 0x86)]]

#define kCOLOR_dynamicProvider_BABBBC_515152   [UIColor colorWithDynamicProviderColor:@[RGB(0xBA, 0xBB, 0xBC), RGB(0x51, 0x51, 0x52)]]

#define kCOLOR_505A6A       RGB(0x50, 0x5A, 0x6A)

#define kCOLOR_BABBBC       RGB(0xBA, 0xBB, 0xBC)

#define kCOLOR_008FFA       RGB(0x00, 0x8F, 0xFA)

#define kCOLOR_999999       RGB(0x99, 0x99, 0x99)
#define kCOLOR_101010       RGB(0x10, 0x10, 0x10)
#define kCOLOR_F0F0F0       RGB(0xf0, 0xf0, 0xf0)
#define kCOLOR_888888       RGB(0x88, 0x88, 0x88)
#define kCOLOR_00D6E2       RGB(0x00, 0xD6, 0xE2)
#define kCOLOR_575757       RGB(0x57, 0x57, 0x57)
#define kCOLOR_F5F5F5       RGB(0xf5, 0xf5, 0xf5)
#define kCOLOR_F5F6F7       RGB(0xf5, 0xf6, 0xf7)
#define kCOLOR_26F3FF       RGB(0x26, 0xF3, 0xFF)
#define kCOLOR_272727       RGB(0x27, 0x27, 0x27)
#define kCOLOR_F9001E       RGB(0xf9, 0x00, 0x1e)
#define kCOLOR_030303       RGB(0x03, 0x03, 0x03)
#define kCOLOR_88898F       RGB(0x88, 0x89, 0x8F)
#define kCOLOR_DCB350       RGB(0xDC, 0xB3, 0x50)
#define kCOLOR_F0F1F2       RGB(0xf0, 0xf1, 0xf2)
#define kCOLOR_B4B4B4       RGB(0xB4, 0xB4, 0xB4)



#define kCOLOR_666666       RGB(0x66, 0x66, 0x66)
#define kCOLOR_FFED00       RGB(0xFF, 0xED, 0x00)
#define kCOLOR_85FFF0       RGB(0x85, 0xFF, 0xF0)
#define kCOLOR_85888F       RGB(0x85, 0x88, 0x8F)
#define kCOLOR_FFC3E2       RGB(0xFF, 0xC3, 0xE2)
#define kCOLOR_FF6666       RGB(0xFF, 0x66, 0x66)
#define kCOLOR_FCFCFC       RGB(0xFC, 0xFC, 0xFC)
#define kCOLOR_F34B00       RGB(0xF3, 0x4B, 0x00)

#define kCOLOR_7ED321       RGB(0x7E, 0xD3, 0x21)
#define kCOLOR_F2F2F2       RGB(0xF2, 0xF2, 0xF2)
#define kCOLOR_FFC565       RGB(0xFF, 0xC5, 0x65)
#define kCOLOR_FFC565       RGB(0xFF, 0xC5, 0x65)
#define kCOLOR_7FC8FF       RGB(0x7F, 0xC8, 0xFF)
#define kCOLOR_F6F6F6       RGB(0xf6, 0xf6, 0xf6)
#define kCOLOR_1890FF       RGB(0x18, 0x90, 0xff)
#define kCOLOR_9CA5B5       RGB(0x9c, 0xa5, 0xb5)
#define kCOLOR_E0233D       RGB(0xe0, 0x23, 0x3d)
#define kCOLOR_FF5B0E       RGB(0xff, 0x5b, 0x0e)
#define kCOLOR_0059DD       RGB(0x00, 0x59, 0xdd)
#define kCOLOR_0086ED       RGB(0x00, 0x86, 0xed)
#define kCOLOR_4A90E2       RGB(0x4A, 0x90, 0xE2)
#define kCOLOR_FD5043       RGB(0xFD, 0x50, 0x43)
#define kCOLOR_FF8B00       RGB(0xFF, 0x8B, 0x00)
#define kCOLOR_B85A35       RGB(0xB8, 0x5A, 0x35)
#define kCOLOR_FF7A28       RGB(0xFF, 0x7A, 0x28)
#define kCOLOR_6B6B6B       RGB(0x6B, 0x6B, 0x6B)
#define kCOLOR_489CFF       RGB(0x48, 0x9C, 0xFF)
#define kCOLOR_1892F8       RGB(0x18, 0x92, 0xF8)
#define kCOLOR_919191       RGB(0x91, 0x91, 0x91)
#define kCOLOR_D0021B       RGB(0xD0, 0x02, 0x1B)
#define kCOLOR_F1F1F1       RGB(0xF1, 0xF1, 0xF1)
#define kCOLOR_F24B00       RGB(0xF2, 0x4B, 0x00)
#define kCOLOR_F58E23       RGB(0xF5, 0x8E, 0x23)

#define kCOLOR_F9F9F9       RGB(0xF9, 0xF9, 0xF9)
#define kCOLOR_FFD332       RGB(0xFF, 0xD3, 0x32)
#define kCOLOR_498800       RGB(0x49, 0x88, 0x00)
#define kCOLOR_BBBBBB       RGB(0xBB, 0xBB, 0xBB)
#define kCOLOR_CCCCCC       RGB(0xCC, 0xCC, 0xCC)
#define kCOLOR_11ABFC       RGB(0x11, 0xab, 0xfc)
#define kCOLOR_4B83DA       RGB(0x4B, 0x83, 0xDA)
#define kCOLOR_955AD4       RGB(0x95, 0x5A, 0xD4)
#define kCOLOR_2FCBF4       RGB(0x2F, 0xCB, 0xF4)
#define kCOLOR_212121       RGB(0x21, 0x21, 0x21)
#define kCOLOR_EBEBEB       RGB(0xEB, 0xEB, 0xEB)
#define kCOLOR_4D9FFF       RGB(0x4D, 0x9F, 0xFF)

#define kCOLOR_FFBB00       RGB(0xFF, 0xBB, 0x00)
#define kCOLOR_1FCC39       RGB(0x1F, 0xCC, 0x39)
#define kCOLOR_131F2F       RGB(0x13, 0x1F, 0x2F)

#define kCOLOR_FAF4EA       RGB(0xfa, 0xf4, 0xea)
#define kCOLOR_87530C       RGB(0x87, 0x53, 0x0c)
#define kCOLOR_B68540       RGB(0xb6, 0x85, 0x40)
#define kCOLOR_F7E2C3       RGB(0xf7, 0xe2, 0xc3)
#define kCOLOR_FBF5EB       RGB(0xfb, 0xf5, 0xeb)

#define kCOLOR_FF667F       RGB(0xFF, 0x66, 0x7F)


#define kCOLOR_F8F8F8       RGB(0xf8, 0xf8, 0xf8)


#define kCOLOR_252427       RGB(0x25, 0x24, 0x27)
#define kCOLOR_1B1B1B       RGB(0x1B, 0x1B, 0x1B)
#define kCOLOR_FACB00       RGB(0xFA, 0xCB, 0x00)
#define kCOLOR_4B4B4B       RGB(0x4B, 0x4B, 0x4B)
#define kCOLOR_DADBDC       RGB(0xDA, 0xDB, 0xDC)
#define kCOLOR_414141       RGB(0x41, 0x41, 0x41)
#define kCOLOR_212121       RGB(0x21, 0x21, 0x21)
#define kCOLOR_F6F7F8       RGB(0xF6, 0xF7, 0xF8)
#define kCOLOR_2E2E2E       RGB(0x2E, 0x2E, 0x2E)
#define kCOLOR_616466       RGB(0x61, 0x64, 0x66)
#define kCOLOR_2A2A2A       RGB(0x2A, 0x2A, 0x2A)
#define kCOLOR_FF5E79       RGB(0xFF, 0x5E, 0x79)

#define kCOLOR_202020       RGB(0x20, 0x20, 0x20)
#define kCOLOR_2E2E2E       RGB(0x2E, 0x2E, 0x2E)
#define kCOLOR_FFEFC5       RGB(0xFF, 0xEF, 0xC5)
#define kCOLOR_FAF0DD       RGB(0xFA, 0xF0, 0xDD)
#define kCOLOR_E5E7EB       RGB(0xe5, 0xE7, 0xE8)
#define kCOLOR_292B31       RGB(0x29, 0x2b, 0x31)
#define kCOLOR_6D7380       RGB(0x6d, 0x73, 0x80)
#define kCOLOR_1F2126       RGB(0x1f, 0x21, 0x26)
#define kCOLOR_E5E7E8       RGB(0xE5, 0xE7, 0xE8)
#define kCOLOR_6D4A1A       RGB(0x6D, 0x4A, 0x1A)
#define kCOLOR_B17BFF       RGB(0xB1, 0x7B, 0xFF)
#define kCOLOR_FF4865       RGB(0xFF, 0x48, 0x65)
#define kCOLOR_EEC379       RGB(0xee, 0xc3, 0x79)
#define kCOLOR_D4AE6C       RGB(0xd4, 0xae, 0x6c)
#define kCOLOR_969696       RGB(0x96, 0x96, 0x96)



#define Proportion [UIScreen mainScreen].bounds.size.width / 375


#define  kNavigationBottom    (statusMarginToTop() + )


static inline CGFloat windowFloorf(CGFloat value) {
    return floorf(value * [[UIScreen mainScreen] scale]) / [[UIScreen mainScreen] scale];
}
#define kCOLOR_00BFFF       RGB(0x00, 0xBF, 0xFF)
#define kCOLOR_FF617B       RGB(0xFF, 0x61, 0x7B)

#define kCOLOR_dynamicProvider_EBEDF0_DADBDC      [UIColor colorWithDynamicProviderColor:@[RGB(0xEB, 0xED, 0xF0),RGB(0x37, 0x39, 0x40)]]



#define REDCOLOR         [UIColor colorWithRed:(0.925) green:(0.212) blue:(0.506) alpha:1]
#define WHITECOLOR       [UIColor colorWithRed:(0.855) green:(0.855) blue:(0.855) alpha:1]
#define WHITECOLOR_WITH_ALPHA(ALPHA)    [UIColor colorWithRed:1 green:1 blue:1 alpha:ALPHA]

//导航条背景颜色
#define NavColor         kCOLOR_dynamicProvider_FFFFFF_1F2126
//页面背景色
#define BLACKCOLOR       [UIColor colorWithRed:241/ 255.0 green:241/ 255.0 blue:241/255.0 alpha:1]
//Cell背景色
#define BackSpaceColor  kCOLOR_dynamicProvider_FFFFFF_2C2C2C
//导航栏title颜色
#define NavightTitleColor      kCOLOR_dynamicProvider_000000_DADBDC

//二级浅颜色
#define SHALLOWGRAYCOLOR        [UIColor colorWithRed:(74/255.0f) green:(74/255.0f) blue:(74/255.0f) alpha:1]
//选中栏目颜色
#define BlueColor        [UIColor colorWithRed:(53/255.0) green:(188/255.0) blue:(254/255.0) alpha:1]
//分割线颜色
#define LineColor      kCOLOR_dynamicProvider_EEEEEE

#define kDevice_Is_iPhoneX  ([RRAppConfig config].isiPhoneX)
#define iPhone5_5s_5c ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//static inline CGFloat statusMarginToTop() {
//    if (kDevice_Is_iPhoneX) {
//        return 44;
//    } else {
//        return 20;
//    }
//}

//iphone的安全边距，其中右和下是负值，是为了方便填写约束
static inline UIEdgeInsets appMargin() {
    CGFloat top = 0;
    CGFloat bottom = 0;
    CGFloat left = 0;
    CGFloat right = 0;
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets insets = [UIApplication sharedApplication].keyWindow.safeAreaInsets;
        //iphonex系列为44，使用安全区域，其他的忽略statusbar的非q安全区域，直接取0
        top = insets.top > 40 ? insets.top : 0;
        bottom = -insets.bottom;
        left = insets.left;
        right = -insets.right;
    }
    return UIEdgeInsetsMake(top, left, bottom, right);
}

//播放器高度
static inline CGFloat playerViewHeight() {
    return appMargin().top + KHomeWidth / 750 * 421;
}

//快看短视频播放器高度
static inline CGFloat amwayPlayerHeight() {
    return (KHeight + appMargin().bottom - kBottomBarHeight);
}

static inline CGFloat navMarginToTop() {
    return 60;
}

static inline CGFloat bottomMarginToBottom() {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom;
    }
    return 0;
}

static inline CGFloat dealValue(CGFloat value) {
    return ceilf(value * [[UIScreen mainScreen] scale]) / [[UIScreen mainScreen] scale];
}

static inline CGFloat floorValue(CGFloat value) {
    return floorf(value * [[UIScreen mainScreen] scale]) / [[UIScreen mainScreen] scale];
}

// View 圆角
static inline void ViewRadius(UIView *view, CGFloat radius) {
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = radius;
}

// View 圆角并描边
static inline void ViewBorderRadius(UIView *view, CGFloat radius, CGFloat borderWidth, UIColor *borderColor) {
    ViewRadius(view, radius);
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor.CGColor;
}

static inline id nib2Obj(NSString *name, id owner){
    NSArray *result = [[NSBundle mainBundle] loadNibNamed:name owner:owner options:nil];
    return result.count > 0 ? result[0] : nil;
}

//剧集卡片一行个数
static inline NSInteger rr_recommendSeasonLineItemCount() {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return 3;
    }
    if (KHomeWidth >= 1024) {
        return 6;
    }
    return 5;
}

static inline NSInteger rr_recommendSeasonPageSize() {
    switch (rr_recommendSeasonLineItemCount()) {
        case 5:
            return 25;
        case 6:
            return 24;
        default:
            return 15;
    }
}

#define seasonVideoCategoryForm(seasonModel) (seasonModel.classify.length ? seasonModel.classify : (seasonModel.isMovie ? kRRUmengEventVideoCategory1Movie : kRRUmengEventVideoCategory1Series))

#define seasonVideoForm(item)   (item.dramaType.length ? item.dramaType : ([item.dramaType isEqualToString:@"MOVIE"])? kRRUmengEventVideoCategory1Movie : kRRUmengEventVideoCategory1Series)

// 是否iPhone5
#define isiPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
                                CGSizeEqualToSize(CGSizeMake(640, 1136), \
                                                  [[UIScreen mainScreen] currentMode].size) : \
                                NO)
// 是否iPhone4
#define isiPhone4               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
                                CGSizeEqualToSize(CGSizeMake(640, 960), \
                                [[UIScreen mainScreen] currentMode].size) : \
                                NO)
#define IsIOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)
#define IsIOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)
#define IsIOS14 ([[UIDevice currentDevice].systemVersion doubleValue] >= 14.0)

// 是否IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)

// 是否iPad
#define isApplePad              (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define KIphoneSEWith              375


// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)\
                                \
                                [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                                 blue:((float)(rgbValue & 0xFF))/255.0 \
                                                alpha:1.0]

/* ****************************************************************************************************************** */

#define RRSafeEndOfCollectionViewCell   \
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"errorCell"];\
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"errorCell" forIndexPath:indexPath];

#define kRRShowPIP @"kRRShowPIP"


#define RRSafeEndOfCollectionReusableView   \
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:kind withReuseIdentifier:@"errorHeader"]; \
    return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"errorHeader" forIndexPath:indexPath];

#define RRSafeEndOfTableViewCell   \
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"errorCell"];\
    return [tableView dequeueReusableCellWithIdentifier:@"errorCell" forIndexPath:indexPath];

#if !defined __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_5_0
# define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
# define TextAlignmentLeft UITextAlignmentLeft
# define TextAlignmentCenter UITextAlignmentCenter
# define TextAlignmentRight UITextAlignmentRight

#else
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
# define TextAlignmentLeft NSTextAlignmentLeft
# define TextAlignmentCenter NSTextAlignmentCenter
# define TextAlignmentRight NSTextAlignmentRight

#endif

#endif
