//
//  ChatKitConfig.m
//  ChatKit
//
//  Created by kennethmiao on 2018/11/5.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "ChatKitConfig.h"
#import "ChatHeader.h"
#import "FaceCell.h"
#import "FaceView.h"
#import "ChatImageCache.h"
#import "UIImage+ChatKit.h"
 
@interface ChatKitConfig ()

//提前加载资源（全路径）

@end

@implementation ChatKitConfig

- (id)init
{
    self = [super init];
    if(self){
        [self defaultFace];
    }
    return self;
}

+ (id)defaultConfig
{
    static dispatch_once_t onceToken;
    static ChatKitConfig *config;
    dispatch_once(&onceToken, ^{
        config = [[ChatKitConfig alloc] init];
    });
    return config;
}

/**
 *  初始化默认表情，并将配默认表情写入本地缓存，方便下一次快速加载
 */
- (void)defaultFace
{
    NSMutableArray *faceGroups = [NSMutableArray array];
    //emoji group
    NSMutableArray *emojiFaces = [NSMutableArray array];
    NSArray *emojis = [NSArray arrayWithContentsOfFile:ChatKitFace(@"emoji/emoji.plist")];
    for (NSDictionary *dic in emojis) {
        TFaceCellData *data = [[TFaceCellData alloc] init];
        NSString *name = [dic objectForKey:@"face_name"];
        NSString *path = [NSString stringWithFormat:@"emoji/%@", name];
        data.name = name;
        data.path = ChatKitFace(path);
        [self addFaceToCache:data.path];
        [emojiFaces addObject:data];
    }
    if(emojiFaces.count != 0){
        TFaceGroup *emojiGroup = [[TFaceGroup alloc] init];
        emojiGroup.groupIndex = 0;
        emojiGroup.groupPath = ChatKitFace(@"emoji/");
        emojiGroup.faces = emojiFaces;
        emojiGroup.rowCount = 3;
        emojiGroup.itemCountPerRow = 9;
        emojiGroup.needBackDelete = YES;
        emojiGroup.menuPath = ChatKitFace(@"emoji/menu");
        [self addFaceToCache:emojiGroup.menuPath];
        [faceGroups addObject:emojiGroup];
        [self addFaceToCache:ChatKitFace(@"del_normal")];
    }

//    //tt group
//    NSMutableArray *ttFaces = [NSMutableArray array];
//    for (int i = 0; i <= 16; i++) {
//        TFaceCellData *data = [[TFaceCellData alloc] init];
//        NSString *name = [NSString stringWithFormat:@"tt%02d", i];
//        NSString *path = [NSString stringWithFormat:@"tt/%@", name];
//        data.name = name;
//        data.path = ChatKitFace(path);
//        [self addFaceToCache:data.path];
//        [ttFaces addObject:data];
//    }
//    if(ttFaces.count != 0){
//        TFaceGroup *ttGroup = [[TFaceGroup alloc] init];
//        ttGroup.groupIndex = 1;
//        ttGroup.groupPath = ChatKitFace(@"tt/");
//        ttGroup.faces = ttFaces;
//        ttGroup.rowCount = 2;
//        ttGroup.itemCountPerRow = 5;
//        ttGroup.menuPath = ChatKitFace(@"tt/menu");
//        [self addFaceToCache:ttGroup.menuPath];
//        [faceGroups addObject:ttGroup];
//    }

    _faceGroups = faceGroups;
}


#pragma mark - resource

- (void)addResourceToCache:(NSString *)path
{
//    [[TUIImageCache sharedInstance] addResourceToCache:path];
}


- (void)addFaceToCache:(NSString *)path
{
    [[ChatImageCache sharedInstance] addFaceToCache:path];
}


@end
