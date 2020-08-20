#import "ChatKit.h"

@interface ChatKit ()
 
@end

@implementation ChatKit

+ (instancetype)sharedInstance
{
    static ChatKit *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ChatKit alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _config = [ChatKitConfig defaultConfig];
//        [self createCachePath];
    }
    return self;
}
 


@end
