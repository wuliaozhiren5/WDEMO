//
//  RRDestroyAccountContentCell.h
//  PUClient
//
//  Created by WDEMO on 2020/8/13.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, RRDestroyAccountContentType) {
    RRDestroyAccountContentTypeNone = 0,
    RRDestroyAccountContentTypeAccountInfo,//1.账号信息
    RRDestroyAccountContentTypeMemberInfo,//2.账号内财产相关
    RRDestroyAccountContentTypeTips,//3.账号注销后无法找回
    
    
};

@interface RRDestroyAccountContentModel : NSObject 
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *level;

@property (nonatomic, strong) NSMutableAttributedString *detailAtt;
@property (nonatomic, assign) RRDestroyAccountContentType type;
@property (nonatomic, assign) CGFloat cellHeight;

+ (instancetype)initWithTitle:(NSString *)title
                       detail:(NSString *)detail
                     name:(NSString *)name
                         time:(NSString *)time
                        level:(NSString *)level
                         type:(RRDestroyAccountContentType)type;

@end

@interface RRDestroyAccountContentCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;
//@property (nonatomic, strong) UILabel *detailLab;
@property (nonatomic, strong) YYLabel *detailLab;

@property (nonatomic, strong) RRDestroyAccountContentModel *model;
  
- (void)fillWithData:(RRDestroyAccountContentModel *)model;
@end

@interface RRDestroyAccountContentInfoCell : RRDestroyAccountContentCell
//副标题
@property (nonatomic, strong) UILabel *subtitleLab1;
@property (nonatomic, strong) UILabel *subtitleLab2;
@property (nonatomic, strong) UILabel *subtitleLab3;

@property (nonatomic, strong) UILabel *contentLab1;
@property (nonatomic, strong) UILabel *contentLab2;
@property (nonatomic, strong) UILabel *contentLab3;

- (void)fillWithData:(RRDestroyAccountContentModel *)model;

@end
 


NS_ASSUME_NONNULL_END
