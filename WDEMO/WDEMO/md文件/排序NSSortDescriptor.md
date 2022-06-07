
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
 

#谓语NSPredicate  


排序进阶(NSPredicate、NSSortDescriptor 的使用)
https://www.jianshu.com/p/5bccb20c5dcd

iOS谓词NSPredicate的简单使用
https://www.cnblogs.com/wanli-leon/p/12149096.html

iOS中谓词NSPredicate的使用
https://www.jianshu.com/p/ae1275a574fc

NSPredicate——iOS中的数据过滤
https://www.jianshu.com/p/a90e9800e3b0





/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
#排序NSSortDescriptor
 
iOS 模型排序之NSSortDescriptor
https://blog.csdn.net/bitcser/article/details/109612492
 
NSArray按字母顺序排序
https://blog.csdn.net/tinylight/article/details/50051477
```
NSArray* unsortedArray = [[NSArray alloc] initWithObjects:@"DAFDA",@"EWRWE",@"VCXVX",@"HSHXC",@"ONSWXC",@"WETCS",@"ACXDS", nil];
NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
NSArray *sortedArray = [unsortedArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor,nil]];
NSLog(@"sortedArray:%@",sortedArray);
```

```
//文字长度 降序
NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:NO];
//ABCDEF升序
NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
//排序
NSArray *sortedArray = [mArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor, nil]];
NSLog(@"sortedArray:%@",sortedArray);
```
 
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
 

项目中的代码

赏袋页面所有数据
```
- (void)createOpenData {
    NSArray *array = self.contentModel.goodsArr;
    //同一个箱子下的物品
    //排序
    //Bounds Last ABCDEF
    NSArray *arr = [array valueForKeyPath:@"trade_goods_level"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);

    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);
    
    //    //文字长度 降序
    //    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:NO];
    //    //ABCDEF升序
    //    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    //    //排序
    //    NSArray *sortedArray = [mArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor, nil]];
    //    NSLog(@"sortedArray:%@",sortedArray);
        
 
    //拼接新的字典
    //展开
    NSMutableDictionary *openMDict = [NSMutableDictionary dictionary];
    //关闭
    NSMutableDictionary *closeMDict = [NSMutableDictionary dictionary];

    {
        for (NSInteger i = 0; i < mArr.count; i++) {
            NSString *typeStr = mArr[i];
            NSMutableArray *typeArr = [NSMutableArray array];
            for (MWSRewardDetailModel *object in array) {
                if ([object.trade_goods_level isEqualToString:typeStr]) {
                    [typeArr addObject:object];
                }
            }
            
            if (typeArr.count > 0) {
                //升序
                NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"active_id" ascending:YES];
                //排序
                NSArray *sortedArray = [typeArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
                NSLog(@"sortedArray:%@",sortedArray);
                openMDict[typeStr] = sortedArray;
                
                NSArray *tempArr = [self createCloseData:sortedArray];
                closeMDict[typeStr] = tempArr;
            }
        }
    }
    NSLog(@"%@", openMDict);
    NSLog(@"%@", closeMDict);
   
}

- (NSArray *)createCloseData:(NSArray *)array {
    //排序
    NSArray *arr = [array valueForKeyPath:@"active_id"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);

    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);
    
    NSMutableArray *newArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < mArr.count; i++) {
        NSString *typeStr = mArr[i];
        NSMutableArray *typeArr = [NSMutableArray array];
        for (MWSRewardDetailModel *object in array) {
            if ([object.active_id isEqualToString:typeStr]) {
                [typeArr addObject:object];
            }
        }
        
        if (typeArr.count > 0) {
            [newArr addObject:typeArr];
        }
    }
    return  newArr;
}

```

赏袋页面优化后的数据 
```
- (void)createData {
    NSMutableArray *temp = [NSMutableArray array];
    NSInteger n = self.contentModel.goodsArr.count;
    for (NSInteger i = 0; i < n ; i++) {
        MWSRewardDetailLevelModel *levelModel = [self.contentModel.goodsArr objectOrNilAtIndex:i];
//        levelModel.tradeDetail;
        if (levelModel.tradeDetail.count > 0) {
            [temp addObject:levelModel.tradeDetail];
        }
    }
    self.closeArr = [NSArray arrayWithArray:temp];
}
```


已选赏品
已选商品
```
- (void)createOpenData {
    NSArray *array = [NSArray arrayWithArray:self.mArr];
    //同一个箱子下的物品
    //排序
    //Bounds Last ABCDEF
    NSArray *arr = [array valueForKeyPath:@"trade_goods_level"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);

    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);

 
    //拼接新的字典
    //展开
    NSMutableDictionary *openMDict = [NSMutableDictionary dictionary];
    //关闭
    NSMutableDictionary *closeMDict = [NSMutableDictionary dictionary];

    {
        for (NSInteger i = 0; i < mArr.count; i++) {
            NSString *typeStr = mArr[i];
            NSMutableArray *typeArr = [NSMutableArray array];
            for (MWSRewardDetailModel *object in array) {
                if ([object.trade_goods_level isEqualToString:typeStr]) {
                    [typeArr addObject:object];
                }
            }

            if (typeArr.count > 0) {
                //升序
                NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"active_id" ascending:YES];
                //排序
                NSArray *sortedArray = [typeArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
                NSLog(@"sortedArray:%@",sortedArray);
                openMDict[typeStr] = sortedArray;

                NSArray *tempArr = [self createCloseData:sortedArray];
                closeMDict[typeStr] = tempArr;
            }
        }
    }
    NSLog(@"%@", openMDict);
    NSLog(@"%@", closeMDict);
    
    //文字长度 降序
    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:NO];
    //ABCDEF升序
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    //排序
    NSArray *sortedArray = [mArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor, nil]];
    NSLog(@"sortedArray:%@",sortedArray);
    
    NSMutableArray *goodsArr = [NSMutableArray array];
    for (NSString *str in sortedArray) {

        MWSRewardDetailLevelModel *levelModel = [[MWSRewardDetailLevelModel alloc] init];
        levelModel.level = str;
        levelModel.tradeDetail = openMDict[str];
        levelModel.count = levelModel.tradeDetail.count;
        [goodsArr addObject:levelModel];
    }
    self.goodsArr = [NSArray arrayWithArray:goodsArr];
    
    NSMutableArray *closeArr = [NSMutableArray array];
//    NSInteger n = closeMDict.allValues.count;
    for (NSString *str in sortedArray) {
        NSArray *temp = closeMDict[str];
        if (temp) {
            [closeArr addObjectsFromArray:temp];
        }
    }
    self.closeArr = [NSArray arrayWithArray:closeArr];

}

- (NSArray *)createCloseData:(NSArray *)array {
    //排序
    NSArray *arr = [array valueForKeyPath:@"active_id"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);

    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);

    NSMutableArray *newArr = [NSMutableArray array];

    for (NSInteger i = 0; i < mArr.count; i++) {
        NSString *typeStr = mArr[i];
        NSMutableArray *typeArr = [NSMutableArray array];
        for (MWSRewardDetailModel *object in array) {
            if ([object.active_id isEqualToString:typeStr]) {
                [typeArr addObject:object];
            }
        }

        if (typeArr.count > 0) {
            [newArr addObject:typeArr];
        }
    }
    return  newArr;
}

```

发货页
```
- (void)createOpenData {
    NSArray *array = [NSArray arrayWithArray:self.mArr];
  
    //同一个箱子下的物品
    //排序
    //Bounds Last ABCDEF
    NSArray *arr = [array valueForKeyPath:@"trade_goods_level"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);

    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);


    //拼接新的字典
    //展开
    NSMutableDictionary *openMDict = [NSMutableDictionary dictionary];
    //关闭
    NSMutableDictionary *closeMDict = [NSMutableDictionary dictionary];

    {
        for (NSInteger i = 0; i < mArr.count; i++) {
            NSString *typeStr = mArr[i];
            NSMutableArray *typeArr = [NSMutableArray array];
            for (MWSRewardDetailModel *object in array) {
                if ([object.trade_goods_level isEqualToString:typeStr]) {
                    [typeArr addObject:object];
                }
            }

            if (typeArr.count > 0) {
                //升序
                NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"active_id" ascending:YES];
                //排序
                NSArray *sortedArray = [typeArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
                NSLog(@"sortedArray:%@",sortedArray);
                openMDict[typeStr] = sortedArray;

                NSArray *tempArr = [self createCloseData:sortedArray];
                closeMDict[typeStr] = tempArr;
            }
        }
    }
    NSLog(@"%@", openMDict);
    NSLog(@"%@", closeMDict);

    //文字长度 降序
    NSSortDescriptor *sortDescriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:NO];
    //ABCDEF升序
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    //排序
    NSArray *sortedArray = [mArr sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sortDescriptor1, sortDescriptor, nil]];
    NSLog(@"sortedArray:%@",sortedArray);

    NSMutableArray *goodsArr = [NSMutableArray array];
    for (NSString *str in sortedArray) {

        MWSRewardDetailLevelModel *levelModel = [[MWSRewardDetailLevelModel alloc] init];
        levelModel.level = str;
        levelModel.tradeDetail = openMDict[str];
        levelModel.count = levelModel.tradeDetail.count;
        [goodsArr addObject:levelModel];
    }
    self.goodsArr = [NSArray arrayWithArray:goodsArr];

    NSMutableArray *closeArr = [NSMutableArray array];
    //    NSInteger n = closeMDict.allValues.count;
    for (NSString *str in sortedArray) {
        NSArray *temp = closeMDict[str];
        if (temp) {
            [closeArr addObjectsFromArray:temp];
        }
    }
    //堆叠
//    self.closeArr = [NSArray arrayWithArray:closeArr];
    
    //全部展示
    NSMutableArray *allArr = [NSMutableArray array];
    for (NSArray *oneArr in closeArr) {
        [allArr addObjectsFromArray:oneArr];
    }
    self.closeArr = [NSArray arrayWithArray:allArr];

}

- (NSArray *)createCloseData:(NSArray *)array {
    //排序
    NSArray *arr = [array valueForKeyPath:@"active_id"];
    //去重复
    NSSet *set = [NSSet setWithArray:arr];
    //NSLog(@"%@", set);
    
    //新数组
    NSMutableArray *mArr= [NSMutableArray arrayWithArray:set.allObjects];
    NSLog(@"%@", mArr);
    
    NSMutableArray *newArr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < mArr.count; i++) {
        NSString *typeStr = mArr[i];
        NSMutableArray *typeArr = [NSMutableArray array];
        for (MWSRewardDetailModel *object in array) {
            if ([object.active_id isEqualToString:typeStr]) {
                [typeArr addObject:object];
            }
        }
        
        if (typeArr.count > 0) {
            [newArr addObject:typeArr];
        }
    }
    return  newArr;
}
```
