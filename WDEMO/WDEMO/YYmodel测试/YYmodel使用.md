YYModel使用教程
https://www.jianshu.com/p/79f52e42840f
《一篇文章全吃透》—YYModel的使用技巧
https://blog.csdn.net/u012946824/article/details/51788527
```
//数组取值
[self.array objectOrNilAtIndex:10];
//字典 
NSString *type = [dictionary stringValueForKey:@"Type" default:nil];


json 转 Model
+ (nullable instancetype)modelWithJSON:(id)json;
+ (nullable instancetype)modelWithDictionary:(NSDictionary *)dictionary;


json 转 Array
+ (nullable NSArray *)modelArrayWithClass:(Class)cls json:(id)json;


model 转 JSONString
- (nullable NSString *)modelToJSONString;


model 转 json
- (nullable NSData *)modelToJSONData;


demo
NSArray *array = [NSArray modelArrayWithClass:[AllSeasonCategorySectionModel class] json:result.data];

xxxModel *response = [xxxModel modelWithDictionary:result.data];


int main() {
    // create model from json
    YYBook *book = [YYBook modelWithJSON:@"{\"name\": \"Harry Potter\", \"pages\": 256, \"author\": {\"name\": \"J.K.Rowling\", \"birthday\": \"1965-07-31\" }}"];

    // convert model to json
    NSString *json = [book modelToJSONString];
    // {"author":{"name":"J.K.Rowling","birthday":"1965-07-31T00:00:00+0000"},"name":"Harry Potter","pages":256}
}
```

YYModel 源码解读（二）之NSObject+YYModel.h (5)
https://www.cnblogs.com/machao/p/5635397.html

我们先把总的功能罗列出来

1. json转字典              + (NSDictionary *)_yy_dictionaryWithJSON:(id)json

2. json转模型              + (instancetype)yy_modelWithJSON:(id)json

3. 字典转模型              + (instancetype)yy_modelWithDictionary:(NSDictionary *)dictionary

4. 模型转json               - (id)yy_modelToJSONObject

5. 模型转NSData          - (NSData *)yy_modelToJSONData

6. 模型转json字符串      - (NSString *)yy_modelToJSONString

7. 模型copy                 - (id)yy_modelCopy

8. 模型归档解档            - (id)yy_modelInitWithCoder:(NSCoder *)aDecoder  /   - (void)yy_modelEncodeWithCoder:(NSCoder *)aCoder

9. 模型hash值              - (NSUInteger)yy_modelHash

10. 模型是否相等           - (BOOL)yy_modelIsEqual:(id)model 

11. 模型描述                 - (NSString *)yy_modelDescription

```
********************** Coding/Copying/hash/equal *********************
@interface YYShadow :NSObject <NSCoding, NSCopying>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGSize size;
@end

@implementation YYShadow
- (void)encodeWithCoder:(NSCoder *)aCoder { [self modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self modelCopy]; }
- (NSUInteger)hash { return [self modelHash]; }
- (BOOL)isEqual:(id)object { return [self modelIsEqual:object]; }
@end
```
```
//yymodel的归档解档
#define MJCodingImplementation \
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self modelEncodeWithCoder:aCoder];\
}\
- (id)initWithCoder:(NSCoder *)aDecoder {\
self = [super init];\
return [self modelInitWithCoder:aDecoder];\
}
```
