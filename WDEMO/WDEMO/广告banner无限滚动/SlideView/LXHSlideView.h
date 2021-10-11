
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXHSlideView : UIView

@property (nonatomic,strong)NSArray * vcArray;

- (instancetype)initWithFrame:(CGRect)frame WithViewControllers:(NSArray *)viewControllers;

@end

NS_ASSUME_NONNULL_END
