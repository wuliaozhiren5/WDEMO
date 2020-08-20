//
//  TagListView.m
//  gaodengDemo
//
//  Created by Sun on 2020/7/11.
//  Copyright © 2020 Sun. All rights reserved.
//


#import "TagListView.h"
#import "TagListCell.h"
#import "TagSegmentedControl.h"
#import "WMacros.h"
#import <Masonry/Masonry.h>

@interface TagListView ()<TagSegmentedControlDelegate, UIScrollViewDelegate,NSCacheDelegate>

//
@property(strong , nonatomic)UIScrollView *bottomScrollView;
@property(strong , nonatomic)UIView *contentView;

@property(strong , nonatomic)TagSegmentedControl *segmentedControl;

@property(strong , nonatomic)UIView *headerView;

@property(strong , nonatomic)NSCache *cache;

//tag
@property(copy , nonatomic)NSArray *tagArr;
//头部标签
@property(assign , nonatomic)NSInteger index;

@property(assign , nonatomic)UIColor *textHighlightColor;
@property(assign , nonatomic)UIColor *textDefaultColor;
@property(assign , nonatomic)UIColor *textHighBackgroundColor;


@end

@implementation TagListView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                 tagArr:(NSArray *)tagArr
                  index:(NSInteger)index
       textDefaultColor:(UIColor *)textDefaultColor
     textHighlightColor:(UIColor *)textHighlightColor
      textHighBackgroundColor:(UIColor *)textHighBackgroundColor{
    
    _tagArr = @[@"全部",
        @"全部1",
        @"全部2",
        @"全部3",
        @"全部4"];
    
    if (tagArr) {
        _tagArr = tagArr;
    }
    
    _index = index;
    _textDefaultColor = textDefaultColor;
    _textHighlightColor = textHighlightColor;
    _textHighBackgroundColor = textHighBackgroundColor;
    
    self = [super initWithFrame:frame];
       if (self) {
           [self addView];
       }
    return self;
    
}

-(void)addView{
  
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    _headerView = headerView;
    [self addSubview:_headerView];

    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.equalTo(@40);
    }];
    
 
    
    TagSegmentedControl *segmentedControl = [[TagSegmentedControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//    segmentedControl.backgroundColor = [UIColor yellowColor];
    segmentedControl.tagArr = _tagArr;
    segmentedControl.index = _index;
    
    segmentedControl.textHighlightColor = self.textHighlightColor;
    segmentedControl.textDefaultColor = self.textDefaultColor;
    segmentedControl.textHighBackgroundColor = self.textHighBackgroundColor;
    
    segmentedControl.delegate = self;
    [_headerView addSubview:segmentedControl];

    _segmentedControl =segmentedControl;

    
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_headerView);
     }];
      
    
    UIScrollView * scrollview = [[UIScrollView alloc] init];
    scrollview.delegate = self;
    scrollview.pagingEnabled = YES;
        [self addSubview:scrollview];
        [scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.top.equalTo(_segmentedControl.mas_bottom);
        }];
        
    
    _bottomScrollView = scrollview;

    UIView * contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor clearColor];
    [scrollview addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollview);
        make.height.equalTo(scrollview);
    }];

    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor whiteColor];
    view1.clipsToBounds = YES;
    view1.layer.cornerRadius = 10;
    [contentView addSubview: view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        //这个view的高很明显就超出了scrollview的高
        make.width.equalTo(@(SCREEN_WIDTH * _tagArr.count));
        make.top.equalTo(contentView);
        make.leading.equalTo(contentView);
        make.bottom.equalTo(contentView);
    }];

    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(view1.mas_trailing);
    }];
    _contentView = contentView;
  
}
- (void)setDataSource:(id<TagListViewDataSource>)dataSource{
    
    _dataSource = dataSource;
    
    //首页
    [self viewPage:_index];
}

#pragma mark - TagSegmentedControlDelegate
-(void)tagSegmentedControl:(TagSegmentedControl *)tagSegmentedControl
      didSelectItemAtIndex:(NSInteger)index{
    
    _index = index;
    NSLog(@"%zi",index);
    [_bottomScrollView setContentOffset:CGPointMake((SCREEN_WIDTH * index), 0) animated:NO];
     
    [self viewPage:_index];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
   
    if (!decelerate) {
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        _segmentedControl.index = index;

        [self viewPage:index];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
 
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    _segmentedControl.index = index;
    [self viewPage:index];
     
}

-(void)viewPage:(NSInteger)index{
    
    _index = index;
    
    if([self.cache objectForKey:@(_index)]){
        return;
    }
     
    UIView *view = nil;
    if ([self.dataSource respondsToSelector:@selector(tagListView:didSelectItemAtIndex:)]) {
        view = [self.dataSource tagListView:self didSelectItemAtIndex:_index];
    }
    if (view) {
        [_contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.bottom.equalTo(_contentView);
                    make.width.equalTo(@(SCREEN_WIDTH));
                    make.leading.equalTo(@(index * SCREEN_WIDTH));
                }];
        
        
        [self.cache setObject:view forKey:@(_index)];

    }
}


 - (NSCache *)cache {

    if (_cache == nil) {
        _cache = [[NSCache alloc] init];
        _cache.totalCostLimit = 10;
        _cache.delegate = self;
        _cache.countLimit = 10;
    }
    return _cache;
}
 
//  NSCacheDelegate
 
- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    
    NSLog(@"%@", [NSString stringWithFormat:@"%@ will be evict",obj]);
    UIView *view = (UIView *)obj;
    [view removeFromSuperview];
}
 
@end

 
