//
//  TUIImageCache.m
//  TXIMSDK_TUIKit_iOS
//
//  Created by annidyfeng on 2019/5/15.
//

#import "ChatImageCache.h"
#import "ChatHelper.h"
#import "UIImage+ChatKit.h"
 

@interface ChatImageCache()
@property (nonatomic, strong) NSMutableDictionary *resourceCache;
@property (nonatomic, strong) NSMutableDictionary *faceCache;
@end

@implementation ChatImageCache

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static ChatImageCache *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ChatImageCache alloc] init];
//        [UIImage d_fixResizableImage];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        _resourceCache = [NSMutableDictionary dictionary];
        _faceCache = [NSMutableDictionary dictionary];
    }
    return self;
}

 

- (void)addFaceToCache:(NSString *)path
{
    __weak __typeof(self) ws = self;;
    [ChatHelper asyncDecodeImage:path complete:^(NSString *key, UIImage *image) {
        __strong __typeof(ws) strongSelf = ws;
        [strongSelf.faceCache setValue:image forKey:key];
    }];
}

- (UIImage *)getFaceFromCache:(NSString *)path
{
    if(path.length == 0){
        return nil;
    }
    UIImage *image = [_faceCache objectForKey:path];
    if(!image){
        image = [UIImage imageNamed:path];
    }
    return image;
}
@end
