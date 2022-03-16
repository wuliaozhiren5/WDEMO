#nullable nonnull

nullable 
nonnull
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

- (nullable NSArray *)instancesOfClasses:(nonnull NSArray *)classes;


方法
- (void)adapter:(RRUserDynamicAdapter * _Nullable)adapter;  
- (void)adapter:(RRUserDynamicAdapter * _Nonnull)adapter;


属性
@property (nonatomic, strong) RRSeniorCommentsModel *__nullable replyModel;
@property (nonatomic, strong) RRSeniorCommentsModel *__nonnull replyModel;



_Nonnull
_Nullable

typedef void(^ClickSeasonSeniorCommentsCell)(RRSeniorCommentsModel * _Nonnull model);//不可以为空
 

------------------------------------------------------------------------------------------

yymodel中的用法 
nullable  nonnull

@property (nullable, nonatomic, strong) YYImageCache *cache;
- (nullable NSNumber *)ligatureAtIndex:(NSUInteger)index;
- (void)setFont:(nullable UIFont *)font range:(NSRange)range;


nonnull
@property (nonnull, nonatomic, copy) YYTextDebugOption *debugOption;
block
- (void)removeAllItemsWithProgressBlock:(nullable void(^)(int removedCount, int totalCount))progress
                               endBlock:(nullable void(^)(BOOL error))end;


------------------------------------------------------------------------------------------

 
