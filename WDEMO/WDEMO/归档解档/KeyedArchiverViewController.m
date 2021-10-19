//
//  KeyedArchiverViewController.m
//  WDEMO
//
//  Created by WDEMO on 2021/2/5.
//  Copyright © 2021 wwc. All rights reserved.
//

#import "KeyedArchiverViewController.h"
#import "MYPerson.h"
#import <YYKit/YYKit.h>

@interface KeyedArchiverViewController ()

@end

@implementation KeyedArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self archiver];
    [self unarchiver];
    
    
    
    MYPerson *person = [[MYPerson alloc] init];
    person.name = @"某某某";
    person.no = 109;
    person.age = 20;
    
    //转换成NSData 存储，利用yymodel转化
    NSData *jsonData = person.modelToJSONData;
    //获取沙盒中Documents的路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    //设置对象归档的路径及归档文件名
    NSString *jsonDataPath =[docPath stringByAppendingPathComponent:@"jsonData.archiver"];//后缀名可以随意命名
    
    BOOL flag = [NSKeyedArchiver archiveRootObject:jsonData toFile:jsonDataPath];
 
    NSData *cachedData = [NSKeyedUnarchiver unarchiveObjectWithFile:jsonDataPath];
    MYPerson *cachedPerson = [MYPerson modelWithJSON:cachedData];
    NSLog(@"%@, %@, %zi, %zi", cachedPerson, cachedPerson.name, cachedPerson.no, cachedPerson.age);

}

//归档
- (void)archiver {

    NSDictionary *personDict=@{@"name":@"xiaoBai",@"age":@"25",@"sex":@"man"};
    NSArray *array = @[@"数据1",@"数据2",@"数据3",@"数据4"];

    //获取沙盒中Documents的路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];

    //设置对象归档的路径及归档文件名
    NSString *dictPath =[docPath stringByAppendingPathComponent:@"person.archiver"];//后缀名可以随意命名
    //将对象归档到指定路径
    BOOL flag1 = [NSKeyedArchiver archiveRootObject:personDict toFile:dictPath];
    
    NSString *arrayPath =[docPath stringByAppendingPathComponent:@"data.archiver"];
    BOOL flag2 = [NSKeyedArchiver archiveRootObject:array toFile:arrayPath];
    
    NSLog(@"%d, %d", flag1, flag2);
}

//解档
- (void)unarchiver {
    
    //获取沙盒中Documents的路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];

    //设置对象归档的路径及归档文件名
    NSString *dictPath =[docPath stringByAppendingPathComponent:@"person.archiver"];//后缀名可以随意命名
    NSDictionary *dic = [NSKeyedUnarchiver unarchiveObjectWithFile:dictPath];
    
    NSString *arrayPath =[docPath stringByAppendingPathComponent:@"data.archiver"];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:arrayPath];
    
    NSLog(@"%@, %@", dic, array);

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
