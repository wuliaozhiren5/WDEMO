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
