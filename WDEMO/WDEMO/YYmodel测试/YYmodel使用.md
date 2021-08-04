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
//array
NSArray *array = [NSArray modelArrayWithClass:[AllSeasonCategorySectionModel class] json:result.data];

//result.data 是 Dictionary
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


《一篇文章全吃透》—YYModel的使用技巧
https://blog.csdn.net/u012946824/article/details/51788527
《一篇文章全吃透》—YYModel的使用技巧
https://blog.csdn.net/sheng_bin/article/details/53208964


一、YYModel的使用场景
1.简单的 Model 与 JSON 相互转换
```
// JSON:
{
    "uid":123456,
    "name":"Harry",
    "created":"1965-07-31T00:00:00+0000"
}

// Model:
@interface User : NSObject
@property UInt64 uid;
@property NSString *name;
@property NSDate *created;
@end

@implementation User
@end
```
```
// 将 JSON (NSData,NSString,NSDictionary) 转换为 Model:
User *user = [User yy_modelWithJSON:json];

// 将 Model 转换为 JSON 对象:
NSDictionary *json = [user yy_modelToJSONObject];
```

2.Model 属性名和 JSON 中的 Key 不相同
```
// JSON:
{
    "n":"Harry Pottery",
    "p": 256,
    "ext" : {
        "desc" : "A book written by J.K.Rowing."
    },
    "ID" : 100010
}

// Model:
@interface Book : NSObject
@property NSString *name;
@property NSInteger page;
@property NSString *desc;
@property NSString *bookID;
@end
@implementation Book
//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"n",
             @"page" : @"p",
             @"desc" : @"ext.desc",
             @"bookID" : @[@"id",@"ID",@"book_id"]};
}
@end
```

3.Model 包含其他 Model
```
// JSON
{
    "author":{
        "name":"J.K.Rowling",
        "birthday":"1965-07-31T00:00:00+0000"
    },
    "name":"Harry Potter",
    "pages":256
}

// Model: 什么都不用做，转换会自动完成
@interface Author : NSObject
@property NSString *name;
@property NSDate *birthday;
@end
@implementation Author
@end

@interface Book : NSObject
@property NSString *name;
@property NSUInteger pages;
@property Author *author; //Book 包含 Author 属性
@end
@implementation Book
@end
```

4.容器类属性
```
@class Shadow, Border, Attachment;

@interface Attributes
@property NSString *name;
@property NSArray *shadows; //Array<Shadow>
@property NSSet *borders; //Set<Border>
@property NSMutableDictionary *attachments; //Dict<NSString,Attachment>
@end

@implementation Attributes
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"shadows" : [Shadow class],
             @"borders" : Border.class,
             @"attachments" : @"Attachment" };
}
@end
```
具体的代码实现如下：
```
NSDictionary *json =[self getJsonWithJsonName:@"ContainerModel"];
ContainerModel *containModel = [ContainerModel yy_modelWithDictionary:json];
NSDictionary *dataDict = [containModel valueForKey:@"data"];
//定义数组，接受key为list的数组
self.listArray = [dataDict valueForKey:@"list"]; 
 //遍历数组
[self.listArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *listDict = obj;
        //获取数组中得字典
        List *listModel = [List yy_modelWithDictionary:listDict];
        //获取count 和 id
        NSString *count = [listModel valueForKey:@"count"];
        NSString *id = [listModel valueForKey:@"id"];

```

5.黑名单与白名单
```
@interface User
@property NSString *name;
@property NSUInteger age;
@end

@implementation Attributes
// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
+ (NSArray *)modelPropertyBlacklist {
    return @[@"test1", @"test2"];
}
// 如果实现了该方法，则处理过程中不会处理该列表外的属性。
+ (NSArray *)modelPropertyWhitelist {
    return @[@"name"];
}
@end
```

6.数据校验与自定义转换
```
// JSON:
{
    "name":"Harry",
    "timestamp" : 1445534567     //时间戳
}

// Model:
@interface User
@property NSString *name;
@property NSDate *createdAt;
@end

@implementation User
// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *timestamp = dic[@"timestamp"];
    if (![timestamp isKindOfClass:[NSNumber class]]) return NO;
    _createdAt = [NSDate dateWithTimeIntervalSince1970:timestamp.floatValue];
    return YES;
}

// 当 Model 转为 JSON 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    if (!_createdAt) return NO;
    dic[@"timestamp"] = @(n.timeIntervalSince1970);
    return YES;
}
@end
```

7.Coding/Copying/hash/equal/description
```
@interface YYShadow :NSObject <NSCoding, NSCopying>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGSize size;
@end

@implementation YYShadow
// 直接添加以下代码即可自动完成
- (void)encodeWithCoder:(NSCoder *)aCoder { 
    [self yy_modelEncodeWithCoder:aCoder]; 
}
- (id)initWithCoder:(NSCoder *)aDecoder {
     self = [super init];
     return [self yy_modelInitWithCoder:aDecoder]; 
}
- (id)copyWithZone:(NSZone *)zone { 
    return [self yy_modelCopy]; 
}
- (NSUInteger)hash { 
    return [self yy_modelHash]; 
}
- (BOOL)isEqual:(id)object { 
    return [self yy_modelIsEqual:object]; 
}
- (NSString *)description { 
    return [self yy_modelDescription]; 
}
@end
```
