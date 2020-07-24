#import "ChatKit.h"


//@import ImSDK;

@interface ChatKit ()
 
@end

@implementation ChatKit
{
    UInt32    _sdkAppid;
    NSString  *_userID;
    NSString  *_userSig;
}

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
