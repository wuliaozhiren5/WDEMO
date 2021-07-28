//
//  ZZStarViewVC.h
//  ZZToolsDemo
//
//  Created by 刘猛 on 2019/2/1.
//  Copyright © 2019年 刘猛. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZStarViewVC : UIViewController

@end


# pragma mark- ZZStarView超出其父视图的使用示例(这里只是在同一个文件写了两个类)
@interface StarSuperView : UIView

///这里自定义init方法是为了传入预设分数
- (instancetype)initWithGrade:(CGFloat)grade;

@end

NS_ASSUME_NONNULL_END
