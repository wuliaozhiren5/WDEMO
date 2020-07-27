

#import <UIKit/UIKit.h>
#import "ChatKitConfig.h"

@interface ChatKit : NSObject

/**
 *  共享实例
 *  ChatKit为单例
 */
+ (instancetype)sharedInstance;

 
/**
 *  ChatKit配置类，包含默认表情、默认图标资源等
 */
@property ChatKitConfig *config;

 
@end



