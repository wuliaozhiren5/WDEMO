//
//  RRActorVideoHeader.h
//  PUClient
//
//  Created by WDEMO on 2021/3/19.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
////响应点击
//typedef void (^ClickBlock)(UIResponder *sender);
////模型响应点击
//typedef void (^ClickModelBlock)(UIResponder *sender, NSObject *model);
////序列响应点击
//typedef void (^ClickIndexBlock)(UIResponder *sender, NSUInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface RRActorVideoHeader : UICollectionReusableView
//点击状态条件
@property (nonatomic, copy) ClickIndexBlock clickStatusIndex;
//点击开关
@property (nonatomic, copy) ClickIndexBlock clickSwichIndex;
@end

NS_ASSUME_NONNULL_END

