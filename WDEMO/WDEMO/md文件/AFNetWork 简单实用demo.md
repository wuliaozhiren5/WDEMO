#AFNetWork 简单实用demo



AFNetWork 简单实用demo
https://www.cnblogs.com/niray/p/4977566.html
```
NSString *postUrl = @"http://www.huway.com/api_index?module=event&action=topads";

    NSDictionary *parameters = @{@"PARAMETERS NAME 1" : @"PARAMETERS VALUE 1",
            @"PARAMETERS NAME 2" : @"PARAMETERS VALUE 2"};


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    //方法一：
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

    //注意：默认的Response为json数据
    //    [manager setResponseSerializer:[AFXMLParserResponseSerializer new]];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//使用这个将得到的是NSData
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//使用这个将得到的是JSON

    //注意：此行不加也可以
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain", @"text/html", nil];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain; charset=utf-8"];
    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];


    //SEND YOUR REQUEST
    [manager POST:postUrl parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject, "21342134234chenxiao");

        //        NSString *str = [responseObject objectForKey:@"KEY 1"];
        //        NSArray *arr = [responseObject objectForKey:@"KEY 2"];
        //        NSDictionary *dic = [responseObject objectForKey:@"KEY 3"];

        //  _arr = responseObject[@"data"];

        //[self.tb_show reloadData];

        //...
    }     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
```








