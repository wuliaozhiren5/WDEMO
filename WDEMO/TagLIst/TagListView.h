//
//  TagListView.h
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol TagListViewDataSource;

@interface TagListView : UIView

@property(weak , nonatomic)id<TagListViewDataSource> dataSource;



- (instancetype)initWithFrame:(CGRect)frame
                       tagArr:(NSArray *)tagArr
                        index:(NSInteger)index
             textDefaultColor:(UIColor *)textDefaultColor
           textHighlightColor:(UIColor *)textHighlightColor
      textHighBackgroundColor:(UIColor *)textHighBackgroundColor;

@end

@protocol TagListViewDataSource <NSObject>

-(UIView *)tagListView:(TagListView *)tagListView didSelectItemAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
