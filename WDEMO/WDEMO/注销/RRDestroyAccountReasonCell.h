//
//  RRDestroyAccountReasonCell.h
//  PUClient
//
//  Created by WDEMO on 2020/8/13.
//  Copyright © 2020 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, RRDestroyAccountReasonType) {
    RRDestroyAccountReasonTypeNone = 0,
    RRDestroyAccountReasonTypeMoreAccount, //这是个多余的账号
    RRDestroyAccountReasonTypeHaveBug,//产品性能问题（卡顿、闪退、bug多等）
    RRDestroyAccountReasonTypeNoLike,//没找到想看的剧、推荐的剧不喜欢
    RRDestroyAccountReasonTypeOther,//其他

};
@interface RRDestroyAccountReasonModel : NSObject

@property (nonatomic, assign) BOOL select;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *reason;
@property (nonatomic, assign) RRDestroyAccountReasonType type;

+ (instancetype)initWithTitle:(NSString *)title
                      reason:(NSString *)reason
                      type:(RRDestroyAccountReasonType)type
                    select:(BOOL)select;

@end

@interface RRDestroyAccountReasonCell : UITableViewCell

@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) RRDestroyAccountReasonModel *model;
@property (nonatomic, assign) BOOL isSelected;
-(void)isSelected:(BOOL)select;
@end

@interface RRDestroyAccountReasonTextCell : RRDestroyAccountReasonCell
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UILabel *placeholderLabel;
@end
NS_ASSUME_NONNULL_END
