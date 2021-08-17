//
//  RRHomeChannelModel.m
//  NJVideo
//
//  Created by LZR on 2021/1/11.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRHomeChannelModel.h"
//#import "RRChannelHeadView.h"
//#import "RRHomeRankListCell.h"
//#import "RRHomeSheetListCell.h"
//#import "RRHomeSheetScrollItemCell.h"
//#import "RRChannelSectionReusableView.h"
//#import "RRVideoSliderCollectionViewCell.h"
//#import "RRHomeBannerTopCell.h"
//#import "RRSeasonCommonCell.h"
//#import "RRMagicCubeCell.h"
//#import "RRVipBannerTopCell.h"
//#import "RRMultiImageSlideCell.h"
//#import "RRMultiImageScrollCell.h"
//#import "RRMyMagicCubeCell.h"
//#import "RRChannelSectionReusableFootView.h"
//#import "RRHomeAdvertisementListCell.h"
//#import "RRSingleImageCell.h"
//#import "RRHomeAdvertisementCell.h"
//#import "NewRingModel.h"
//#import "RRSingleImageListCell.h"
//#import "RRDramaIdAndAmwayCollectionViewCell.h"
//#import "RRLookVideoCollectionViewCell.h"
/*
 VIDEO              影视组件（支持平铺与横滑）
 VIDEO_AUTO         影视数据自动（支持平铺与横滑）
 MAGIC_CUBE         魔方组件（支持平铺）
 SHEET              片单组件（支持平铺与横滑）
 TOP                榜单组件（支持横滑）
 SINGLE_IMAGE       单图组件（支持平铺）
 MULTI_IMAGE        多图组件（支持平铺与横滑）
 BEAN               小豆干 （仅首页，和banner一起展示）
 AD                 广告      仅平铺
*/

//NSString *const kRRSectionTypeVideo                     = @"VIDEO";
//NSString *const kRRSectionTypeVideoAuto                 = @"VIDEO_AUTO";
//NSString *const kRRSectionTypeMagicCube                 = @"MAGIC_CUBE";
//NSString *const kRRSectionTypeSheet                     = @"SHEET";
//NSString *const kRRSectionTypeMutiImage                 = @"MULTI_IMAGE";
//NSString *const kRRSectionTypeSingleImage               = @"SINGLE_IMAGE";
//NSString *const kRRSectionTypeRankList                  = @"TOP";
//NSString *const kRRSectionTypeAD                        = @"AD";
//NSString *const kRRSectionTypeINFO_FLOW                 = @"INFO_FLOW";
//
////横滑
//NSString *const kRRSectionDisplayTypePlain              = @"SCROLL";
////平铺
//NSString *const kRRSectionDisplayTypeSlide              = @"SLIDE";
//
//@implementation RRPlotTypeListItemModel
//
//@end
//
//@implementation RRImageModel
//
//@end
//
//@implementation RRRecommendSeasonModel
//
//@end
//
//@implementation RRRecommendLookVideoModel
//
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"ID":@"id"};
//}
//@end
//
//@implementation RRRecommendFeedListModel
//
//- (Class)cellClass {
//    if ([self.type isEqualToString:@"LOOK_VIDEO"]) {
//        return [RRLookVideoCollectionViewCell class];
//    }
//    //SEASON 剧集或者电影   LOOK_VIDEO 快看
//    return [RRDramaIdAndAmwayCollectionViewCell class];
//}
//
//- (CGSize)cellSize {
//    return [[self cellClass] sizeWithData:self withDict:nil];
//}
//#pragma mark - 埋点数据准备
//
//- (NSString *)rr_contentSection {
//    return [NSString stringWithFormat:@"%@#@#%@", [self rr_CellID], [self rr_CellName]];
//}
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = [self rr_CellName];
//        context.contentID = [self rr_CellID];
//        context.contentType = [self.type isEqualToString:@"LOOK_VIDEO"] ? kRRUmengEventVideoTypeValueShortVideo : kRRUmengEventVideoTypeValueLongVideo;
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        self.rr_contentContext = context;
//    }
//}
//
//- (NSString *)rr_CellID {
//    NSString *ID = @"";
//    if ([self.type isEqualToString:@"LOOK_VIDEO"] && self.lookVideo) {
//        ID = self.lookVideo.ID ?: @"";
//    }
//    if ([self.type isEqualToString:@"SEASON"] && self.season) {
//        ID = self.season.dramaId ?: @"";
//    }
//    return ID;
//}
//
//- (NSString *)rr_CellName {
//    NSString *name = @"";
//    if ([self.type isEqualToString:@"LOOK_VIDEO"] && self.lookVideo) {
//        name = self.lookVideo.title ?: @"";
//    }
//    if ([self.type isEqualToString:@"SEASON"] && self.season) {
//        name = self.season.title ?: @"";
//    }
//    return name;
//}
//@end
//
//@implementation RRRecommendFeedSectionModel
//
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    _moreText = @"";
//    _targetId = @"";
//    _targetType = @"";
//    return YES;
//}
//
//+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
//    return @{@"ID": @"id"};
//}
//
//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{ @"sectionContents" : [RRRecommendFeedListModel class]};
//}
//
//- (Class)headerClass{
//    if (self.sectionContents.count == 0) {
//        return NULL;
//    }
//    return [RRChannelSectionReusableView class];
//}
//
//- (NSInteger)columnCount {
//    if (isApplePad) {
//        return 3;
//    }
//    return 2;
//}
//
//- (CGFloat)minimumInteritemSpacing {
//    return 8;
//}
//- (CGFloat)minimumLineSpacing {
//    return 8;
//}
//
//- (UIEdgeInsets)sectionInsets {
//    return UIEdgeInsetsMake(0, 16, 0, 16);
//}
//- (CGSize)headerSize {
//    return [[self headerClass] sizeWithData:self withDict:nil];
//}
//- (CGSize)footerSize {
//    return [[self footerClass] sizeWithData:self withDict:nil];
//}
//- (Class)footerClass {
//    return NULL;
//}
//
//- (NSInteger)cellCount {
//    return self.sectionContents.count;
//}
//
//- (NSArray<id<RRViewBindingCellModel>> *)cellModels {
//    return self.sectionContents;
//}
//
//- (Class)cellClass {
//    if ([self.cellType isEqualToString:@"LOOK_VIDEO"]) {
//        return [RRLookVideoCollectionViewCell class];
//    }
//    //SEASON 剧集或者电影   LOOK_VIDEO 快看
//    return [RRDramaIdAndAmwayCollectionViewCell class];
//}
//
//#pragma mark - 埋点数据准备
//
//- (NSString *)rr_contentSection {
//    return [NSString stringWithFormat:@"%@#@#%@", self.ID, self.name];
//}
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = self.name;
//        context.contentID = self.ID;
//        context.contentType = kRRUmengEventContnetTypeINOF_FLOW;
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        self.rr_contentContext = context;
//    }
//}
//
//@end
//
//@implementation RRSeriesItemModel
//
//+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
//    return @[@"scoreStr"];
//}
//
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    if (self.score && self.score.floatValue > 0.0) {
//        if (self.score.floatValue >= 10.0) {
//            self.scoreStr = @"10";
//        } else {
//            self.scoreStr = [NSString stringWithFormat:@"%.01f", self.score.floatValue];
//        }
//    } else {
//        self.scoreStr = @"";
//    }
//    return YES;
//}
//
//
//- (Class)cellClass {
//    return [RRSeasonCommonCell class];
//}
//
//- (CGSize)cellSize {
//    return [[self cellClass] sizeWithData:self withDict:nil] ;
//}
//
//- (UIEdgeInsets)sectionInsets {
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
//
//#pragma mark - 埋点数据准备
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = self.title;
//        context.contentID = self.dramaId;
//        context.contentType = kRRUmengEventVideoTypeValueLongVideo;
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        context.recSource = [RRUMengLogger recSourceFrom:self];
//        context.videoCategory1 = self.dramaType;
//        self.rr_contentContext = context;
//    }
//}
//
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"coverUrl" : @[@"coverUrl", @"cover", @"picUrl"],
//             @"title" : @[@"title", @"name"],
//    };
//}
//
//@end
//
//@implementation RRVideoSectionModel
//
//+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
//    return @{@"ID": @"id"};
//}
//
//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{ @"sectionContents" : [RRSeriesItemModel class]};
//}
//
//+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
//    return @[@"cursor",@"isChanging"];
//}
//
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    if (![self.sectionType isEqualToString:kRRSectionTypeVideo] && ![self.sectionType isEqualToString:kRRSectionTypeVideoAuto]) {
//        return YES;
//    }
//    if ([self displayBySingleCell]) {
//        //横滑
//        if (self.sectionContents.count > 10) {
//            self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 10)];
//        }
//    } else {
//        //平铺
//        if (self.sectionContents.count < 6) {
//            //平铺 + 换一换样式  如果元素小余6个不展示
//            return NO;
//        }
//    }
//    if ([self.targetId isEqualToString:@"rrspjump://empty"]) {
//        self.targetId = @"";
//    }
//    if (isApplePad) {
//        self.display = kRRSectionDisplayTypeSlide;
//    }
//    [self.sectionContents enumerateObjectsUsingBlock:^(RRSeriesItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.display = self.display;
//    }];
//    return YES;
//}
//
//- (Class)headerClass{
//    if (self.sectionContents.count == 0) {
//        return NULL;
//    }
//    return [RRChannelSectionReusableView class] ;
//}
//
//- (Class)footerClass {
//    if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        return  [RRChannelSectionReusableFootView class];
//    }
//    return NULL;
//}
//
//- (NSInteger)columnCount {
//    if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        return 3;
//    }
//    return 0;
//}
//
//- (CGFloat)minimumInteritemSpacing {
//    if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        return 8;
//    }
//    return 0;
//}
//
//- (CGSize)headerSize {
//    return [[self headerClass] sizeWithData:self withDict:nil];
//}
//
//- (CGSize)footerSize {
//    return [[self footerClass] sizeWithData:self withDict:nil];
//}
//
//- (NSInteger)cellCount {
//    if ([self displayBySingleCell]) {
//        return 1;
//    }
//    return self.sectionContents.count;
//}
//
//- (NSArray<id<RRViewBindingCellModel>> *)cellModels {
//    if ([self displayBySingleCell]) {
//        return @[self];
//    }
//    return self.sectionContents;
//}
//
//- (void)setCursor:(NSUInteger)cursor {
//    if (_cursor == cursor) {
//        return;
//    }
//    _cursor = cursor;
//}
//
//- (BOOL)displayBySingleCell {
//    return ![self.display isEqualToString:kRRSectionDisplayTypePlain];
//}
//
//- (Class)cellClass {
//    return [RRVideoSliderCollectionViewCell class];
//}
//
//- (CGSize)cellSize {
//    return [[self cellClass] sizeWithData:self withDict:nil];
//}
//
//- (UIEdgeInsets)sectionInsets {
//    if ([self displayBySingleCell]) {
//        return UIEdgeInsetsZero;
//    }
//    return UIEdgeInsetsMake(0, 16, 0, 16);
//}
//
//#pragma mark - 埋点数据准备
//
//- (NSString *)rr_contentSection {
//    return [NSString stringWithFormat:@"%@#@#%@", self.ID, self.name];
//}
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = self.name;
//        context.contentID = self.ID;
//        context.contentType = kRRUmengEventContentTypeSectionStruct;
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        self.rr_contentContext = context;
//    }
//}
//
//@end
//
//@implementation RRSectionContextsItemModel
//
//+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
//    return @{@"ID": @"id"};
//}
//
//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{
//        @"series" : [RRSeriesItemModel class],
//    };
//}
//
//- (Class)cellClass {
//    if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//        return [RRHomeRankListCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//        return [RRMagicCubeCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//        return [RRSingleImageCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            return [RRHomeSheetScrollItemCell class];
//        }
//        return [RRHomeSheetListCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            return [RRMultiImageScrollCell class];
//        }
//        return [RRMultiImageSlideCell class];
//    } else if([self.sectionType isEqualToString:kRRSectionTypeAD]) {
//        return [RRHomeAdvertisementCell class];
//    }
////     VIDEO  影视组建
////     MAGIC_CUBE 魔方组建
////     SHEET  片单组建
////     TOP 榜单组建
////     SINGLE_IMAGE 单图组建
////     MULTI_IMAGE 多图组建
////     BEAN 小豆干
//    return [RRHomeRankListCell class];
//}
//
//- (CGSize)cellSize {
//    return [[self cellClass] sizeWithData:self withDict:nil] ;
//}
//
//- (NSUInteger)hash {
//    return self.title.hash ^ self.icon.hash ^ self.targetId.hash;
//}
//
//- (BOOL)isEqual:(RRSectionContextsItemModel *)object {
//    return self.hash == object.hash;
//}
//
//#pragma mark - 埋点数据准备
//
//- (NSString *)rr_contentSection {
//    return [NSString stringWithFormat:@"%@#@#%@", self.ID, self.title];
//}
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = self.title;
//        context.contentID = self.ID;
//        if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//            context.contentType = kRRUmengEventContnetTypeRankList;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//            context.contentType = kRRUmengEventContnetTypeMagicCube;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//            context.contentType = kRRUmengEventContnetTypeSingleImageUnit;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//            context.contentType = kRRUmengEventContnetTypeFilmList;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//            context.contentType = kRRUmengEventContnetTypeMutiImageUnit;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeAD]) {
//            context.contentType = kRRUmengEventContnetTypeAD;
//        } else {
//            //未知内容类型，不上报
//            context.contentType = kRRUmengEventContentTypeSectionStruct;
//        }
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        self.rr_contentContext = context;
//    }
//}
//
//@end
//
//@implementation RRHomeChannelSectionModel
//
//+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
//    return @{@"ID": @"id"};
//}
//
//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{ @"sectionContents" : [RRSectionContextsItemModel class]};
//}
//
//+ (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary {
//    NSString *sectionType = [[dictionary stringValueForKey:@"sectionType" default:nil] uppercaseString];
//    if ([sectionType isEqualToString:kRRSectionTypeVideo] || [sectionType isEqualToString:kRRSectionTypeVideoAuto]) {
//        return [RRVideoSectionModel class];
//    } else if ([sectionType isEqualToString:kRRSectionTypeINFO_FLOW]) {
//        return [RRRecommendFeedSectionModel class];
//    }
//    return self;
//}
//
//- (NSInteger)columnCount {
//    /* 5.0 在 ipad 下 除了多图组件 其他平铺组件都强制变成横滑 多图组件则保持平铺并且一行4个展示 */
//    if (isApplePad) {
//        if (![self.position isEqualToString:@"23"] && [self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//            return 4;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//            if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//                return 4;
//            } else {
//                return 1;
//            }
//        }  else {
//            return 1;
//        }
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeAD]) {
//        //广告样式一组只有一个，配置多个会被横滑。。
//        return 1;
//    }
//    if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        if ([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//            return 2;
//        }  else if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//            if ([self.position isEqualToString:@"23"]) {
//                return 1;
//            }
//            return 4;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//            return 2;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//            return 1;
//        } else if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//            return 1;
//        }
//        return 3;
//    }
//    return 0;
//}
//
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    if (self.sectionContents.count == 0) {
//        return NO;
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//        //片单
//        [self checkSeriesOverCount:3];
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            //平铺
//            if (self.sectionContents.count < 2) {
//                return NO;
//            }
//            if (self.sectionContents.count > 6) {
//                self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 6)];
//            }
//        } else {
//            //横滑
//            if (self.sectionContents.count < 3) {
//                return NO;
//            }
//            if (self.sectionContents.count > 10) {
//                self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 10)];
//            }
//        }
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//        //榜单
//        [self checkSeriesOverCount:3];
//        if (self.sectionContents.count < 2) {
//            return NO;
//        }
//        if (self.sectionContents.count > 10) {
//            self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 10)];
//        }
//    }  else if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//        //魔方
//        if (self.sectionContents.count < 2) {
//            return NO;
//        }
//        if (self.sectionContents.count > 8) {
//            self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 8)];
//        }
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//        //多图
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            //平铺
//            if (self.sectionContents.count < 2) {
//                return NO;
//            }
//            if (self.sectionContents.count > 12) {
//                self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 12)];
//            }
//        } else {
//            //横滑
//            if (self.sectionContents.count < 2) {
//                return NO;
//            }
//            if (self.sectionContents.count > 10) {
//                self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 10)];
//            }
//        }
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//        //单图 只有平铺
//        if (self.sectionContents.count > 5) {
//            self.sectionContents = [self.sectionContents subarrayWithRange:NSMakeRange(0, 5)];
//        }
//    }
//    if ([self.targetId isEqualToString:@"rrspjump://empty"]) {
//        self.targetId = @"";
//    }
//    self.sectionType = self.sectionType.uppercaseString;
//    /* 5.0 在 ipad 下 除了多图组件 其他平铺组件都强制变成横滑 多图组件则保持平铺并且一行4个展示 */
//    if (isApplePad && ![self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//        self.display = kRRSectionDisplayTypeSlide;
//    }
//    [self.sectionContents enumerateObjectsUsingBlock:^(RRSectionContextsItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.sectionType = self.sectionType;
//        obj.display = self.display;
//    }];
//    return YES;
//}
//
//- (void)checkSeriesOverCount:(NSInteger)count {
//    NSMutableIndexSet *indexToDel = [NSMutableIndexSet indexSet];
//    [self.sectionContents enumerateObjectsUsingBlock:^(RRSectionContextsItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (obj.series.count < count) {
//            [indexToDel addIndex:idx];
//        }
//    }];
//    if (indexToDel.count) {
//        NSMutableArray *allArray = [self.sectionContents mutableCopy];
//        [allArray removeObjectsAtIndexes:indexToDel];
//        self.sectionContents = [allArray copy];
//    }
//}
//
//- (NSString *)display {
//    if (!_display) {
//        return kRRSectionDisplayTypePlain;
//    }
//    return _display;
//}
//
//- (Class)headerClass {
//    if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//        return NULL;
//    }
//    if ([self.position isEqualToString:@"23"] && [self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//        return NULL;
//    }
//    /*
//     兜底逻辑: 除了榜单组件（kRRSectionTypeRankList）我的页面的魔方组件（kRRSectionTypeMagicCube）外
//     其他标题可选组件（单图，多图，魔方，AD , 片单）不展示标题（displayTitle == NO）下 预留高度还是返回RRChannelSectionReusableView
//     根据displayTitle 是否展示 RRChannelSectionReusableView 上的 RRChannelHeadView
//     */
//    return [RRChannelSectionReusableView class];
//}
//
//- (Class)footerClass {
//    return NULL;
//}
//
//- (CGSize)headerSize {
//    return [[self headerClass] sizeWithData:self withDict:nil];
//}
//
//- (CGSize)footerSize {
//    return [[self footerClass] sizeWithData:self withDict:nil];
//}
//
//- (CGFloat)minimumInteritemSpacing {
//    if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//        if (![self.position isEqualToString:@"23"]) {
//            return floorValue((KWidth - 32 - 58 * 4)/ 3);
//        }
//        return 0;
//    }
//    return 8;
//}
//
//- (CGFloat)minimumLineSpacing {
//    if ([self.sectionType isEqualToString:kRRSectionTypeSheet] && [self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        return 8;
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage] && [self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        return 8;
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube] && (![self.position isEqualToString:@"23"])) {
//        return 18;
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//        return 27;
//    }
//    return 0;
//}
//
//- (NSInteger)cellCount {
//    if ([self displayBySingleCell]) {
//        return 1;
//    }
//    if ([self showBatchChangeFooter]) {
//        return MIN(self.sectionContents.count, 6);
//    }
//    return self.sectionContents.count;
//}
//
//- (NSArray<id<RRViewBindingCellModel>> *)cellModels {
//    if ([self displayBySingleCell]) {
//        return  @[self];
//    }
//    return self.sectionContents;
//}
//
//- (UIEdgeInsets)sectionInsets {
//    if ([self displayBySingleCell]) {
//        return UIEdgeInsetsZero;
//    }
//    return UIEdgeInsetsMake(0, 16, 0, 16);
//}
//
//- (BOOL)displayBySingleCell {
//    if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube] && ![self.position isEqualToString:@"23"]) {
//        return NO;
//    }
//    if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]){
//        if (isApplePad) {
//            return YES;
//        }
//        return NO;
//    }
//    if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//        if ([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//            return NO;
//        }
//        if ([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//            return NO;
//        }
//    }
//
//    return YES;
//}
//
//- (BOOL)showBatchChangeFooter {
//    return ([self.sectionType isEqualToString:kRRSectionTypeSheet] && [self.display isEqualToString:kRRSectionDisplayTypePlain]);
//}
//
//- (Class)cellClass {
//    if ([self.sectionType isEqualToString:kRRSectionTypeRankList]) {
//        return [RRHomeRankListCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeMagicCube]) {
//        if ([self.position isEqualToString:@"23"]) {
//            return [RRMyMagicCubeCell class];
//        }
//        return [RRMagicCubeCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeSingleImage]) {
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            return [RRSingleImageCell class];
//        }
//        return [RRSingleImageListCell class];
//    } else if([self.sectionType isEqualToString:kRRSectionTypeSheet]) {
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            return [RRHomeSheetScrollItemCell class];
//        }
//        return [RRHomeSheetListCell class];
//    } else if([self.sectionType isEqualToString:kRRSectionTypeMutiImage]) {
//        if ([self.display isEqualToString:kRRSectionDisplayTypePlain]) {
//            return [RRMultiImageScrollCell class];
//        }
//        return [RRMultiImageSlideCell class];
//    } else if ([self.sectionType isEqualToString:kRRSectionTypeAD]) {
//        return [RRHomeAdvertisementListCell class];
//    }
//
//
////     VIDEO / VIDEO_AUTO  影视组建 ()
////     MAGIC_CUBE 魔方组建
////     SHEET  片单组建
////     TOP 榜单组建
////     SINGLE_IMAGE 单图组建
////     MULTI_IMAGE 多图组建
////     BEAN 小豆干
//    return [RRHomeRankListCell class];
//}
//
//- (CGSize)cellSize{
//    return [[self cellClass] sizeWithData:self withDict:nil] ;
//}
//
//#pragma mark - 埋点数据准备
//
//- (NSString *)rr_contentSection {
//    return [NSString stringWithFormat:@"%@#@#%@", self.ID, self.name];
//}
//
//- (void)buildUmengContentContextWithPage:(NSString *)page channel:(NSString *)channel group:(NSString *)group section:(NSString *)section location:(NSString *)location {
//    if (!self.rr_contentContext) {
//        RRUmengContentContext *context = [[RRUmengContentContext alloc] init];
//        context.contentName = self.name;
//        context.contentID = self.ID;
//        context.contentType = kRRUmengEventContentTypeSectionStruct;
//        context.page = page;
//        context.channel = channel;
//        context.group = group;
//        context.section = section;
//        context.location = location;
//        self.rr_contentContext = context;
//    }
//}
//
//@end
//
//@implementation RRHomeChannelModel
//
//+ (NSDictionary<NSString *, id> *)modelCustomPropertyMapper {
//    return @{@"ID": @"id"};
//}
//
//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{ @"sections"       :   [RRHomeChannelSectionModel class],
//              @"bannerTop"      :   [NewRingModel class],
//    };
//}
//
//+ (nullable NSArray<NSString *> *)modelPropertyBlacklist {
//    return @[@"allBanners", @"guessFavoriteDataType"];
//}
//
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    NSMutableIndexSet *indexsToDel = [NSMutableIndexSet indexSet];
//    [self.sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj isKindOfClass:[RRVideoSectionModel class]]) {
//            RRVideoSectionModel *videoSection = (RRVideoSectionModel *)obj;
//            if ([videoSection.display isEqualToString:kRRSectionDisplayTypeSlide] && videoSection.sectionContents.count < 4) {
//                [indexsToDel addIndex:idx];
//            }
//        }
//    }];
//    if (indexsToDel.count) {
//        NSMutableArray *allArray = [self.sections mutableCopy];
//        [allArray removeObjectsAtIndexes:indexsToDel];
//        self.sections = [allArray copy];
//    }
//    return YES;
//}
//
//@end
//
//@implementation RRTopBannerModel
//
//- (NSInteger)cellCount {
//    return 1;
//}
//
//- (NSArray<id<RRViewBindingCellModel>> *)cellModels {
//    return  @[self];
//}
//
/////**
////    * 首页精选
////    */
////   CHANNEL_INDEX(18L),
////
////   /**
////    * 频道综合页
////    */
////   CHANNEL_INDEX(16L),
////
////   /**
////    * 英美剧频道
////    */
////   CHANNEL_USK(11L),
////
////   /**
////    * 日剧频道
////    */
////   CHANNEL_JP(12L),
////
////   /**
////    * 泰剧频道
////    */
////   CHANNEL_TH(13L),
////
////   /**
////    * 韩剧频道
////    */
////   CHANNEL_KR(14L),
////
////   /**
////    * 国产剧频道
////    */
////   CHANNEL_CHN(17L),
////
////   /**
////    * 电影频道
////    */
////   CHANNEL_MOVIE(15L),
////
////   /**
////    * 新人推荐页
////    */
////   NEW_USER_RECOMMEND(21L),
////
////   /**
////    * VIP
////    */
////   CHANNEL_VIP(22L),
////
////   /**
////    * 我的
////    */
////   CHANNEL_MY(23L),
//
//- (Class)cellClass {
//    if ([self.position isEqualToString:@"CHANNEL_VIP"]) {
//        return  [RRVipBannerTopCell class];
//    }
//    return [RRHomeBannerTopCell class];
//}
//
//- (CGSize)cellSize {
//    return [[self cellClass] sizeWithData:self withDict:nil] ;
//}
//
//- (Class)headerClass {
//     return NULL;
//}
//
//- (CGSize)headerSize {
//    return CGSizeZero;
//}
//
//- (CGSize)footerSize {
//    return CGSizeZero;
//}
//
//- (UIEdgeInsets)sectionInsets {
//    return UIEdgeInsetsZero;
//}
//
//@end

//new
@implementation RRHomeChannelModel

@end

@implementation RRSeriesItemModel

@end
