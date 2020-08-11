//
//  IsEqualViewController.m
//  WDEMO
//
//  Created by rrtv on 2020/8/11.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "IsEqualViewController.h"
#import "MYPerson.h"

@interface IsEqualViewController ()

@end

@implementation IsEqualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test1];
    [self test2];
    [self test3];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)test1
{
   NSString *string1 = @"jack";
   NSString *string2 = [NSString stringWithFormat:@"jack"];

//理论上存储在内存不同区域,为不同对象,但系统重写后改成了比较内容
   NSLog(@"%p %p", string1, string2);

   NSLog(@"string1 == string2 -> %zd", string1 == string2); // 结果为0

   NSLog(@"[string1 isEqualToString:string2] -> %zd", [string1 isEqualToString:string2]); // 结果为1

   NSLog(@"[string1 isEqual:string2] -> %zd", [string1 isEqual:string2]); // 结果为1

}

- (void)test2
{
    NSString *string1 = [NSString stringWithFormat:@"111"];
    NSString *string2 = [NSString stringWithFormat:@"222"];
    //两个存储不同对象的数组,但内容是相同的
    NSArray *array1 = @[string1, @"222", @"333"];
    NSArray *array2 = @[@"111", string2, @"333"];
    
    NSArray *array = @[array1, array2];
    
    NSLog(@"%zd", [array indexOfObject:array2]);//结果为0
}

//没有重写isEqual
- (void)test3
{
    MYPerson *p1 = [[MYPerson alloc] init];
    p1.age = 20;
    p1.no = 30;
    
    MYPerson *p2 = [[MYPerson alloc] init];
    p2.age = 20;
    p2.no = 30;
    
    NSLog(@"%p %p", p1, p2);
    NSLog(@"p1 == p2 -> %zd", p1 == p2); // 0
    NSLog(@"[p1 isEqual:p2] -> %zd", [p1 isEqual:p2]); // 0
}

////重写后
//- (void)test3
//{
//    MYPerson *p1 = [[MYPerson alloc] init];
//    p1.age = 20;
//    p1.no = 30;
//
//    MYPerson *p2 = [[MYPerson alloc] init];
//    p2.age = 20;
//    p2.no = 30;
//
//    NSArray *array = @[@"2", @"6", p1, @"111"];
//
//    NSLog(@"%zd", [array indexOfObject:p2]);//结果为2
//}

@end
