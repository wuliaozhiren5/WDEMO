//
//  Plist.m
//  WDEMO
//
//  Created by Sun on 2020/7/17.
//  Copyright © 2020 wwc. All rights reserved.
//

#import "Plist.h"

@implementation Plist
//https://www.jianshu.com/p/557574141a57

//1.写入数据到plist文件
-(void)create{
     //获取路径对象
     NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *path = [pathArray objectAtIndex:0];
     //获取文件的完整路径
     NSString *filePatch = [path stringByAppendingPathComponent:@"xiaoxi.plist"];
     //上面3句可以写成这一句//
//     NSString *filePatch = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
     //    NSLog(@"------filepath---%@",filePatch);
      /**
     下面是我的plist路径,在桌面空白处点击一下，前往－按住option-资源库-Developer-CoreSimulator-Devices......就按照下面路径找到plist所在的位置
     /Users/baiteng01/Library/Developer/CoreSimulator/Devices/92444384-5241-4934-B078-1A7241F1B687/data/Containers/Data/Application/73005382-D1FB-4BC2-BB4E-1FBC64284141/Documents/xiaoxi.plist
     */
     //写入数据到plist文件
     NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小虎",@"name",@"5",@"age",@"boy",@"sex",nil];
     NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"小小兮",@"name",@"6",@"age",@"girl",@"sex",nil];
     //将上面2个小字典保存到大字典里面
     NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];    [dataDic setObject:dic1 forKey:@"一年级"];
     [dataDic setObject:dic2 forKey:@"二年级"];    //写入plist里面
     [dataDic writeToFile:filePatch atomically:YES];        //读取plist文件的内容
     NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];
     NSLog(@"---plist一开始保存时候的内容---%@",dataDictionary);

}


//2.对plist文件内容进行/删除/修改/添加/写入操作
-(void)edit{
     
    //获取plist文件的路径
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePatch = [path stringByAppendingPathComponent:@"xiaoxi.plist"];

    //根据之前保存的容器类型读取数据
    //是数组就用数组来获取数据，是字典就用字典来获取数据
    //xiaoxi.plist文件
    //NSMutableArray *dataArr = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    //xiaoxi.plist文件
    NSMutableDictionary *dataDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filePatch];

    
    //修改字典里面的内容,先按照结构取到你想修改内容的小字典
    NSMutableDictionary *dd = [dataDictionary objectForKey:@"一年级"];
    [dd setObject:@"我改名字了哦" forKey:@"name"];
    [dd setObject:@"我添加的新内容" forKey:@"content"];
    [dd removeObjectForKey:@"age"];
    //修改成功以后，将这个小字典重新添加到大字典里面
    [dataDictionary setObject:dd forKey:@"一年级"];
    [dataDictionary writeToFile:filePatch atomically:YES];
    NSLog(@"---plist做过操作之后的字典里面内容---%@",dataDictionary);

}

//3.删除plist文件
-(void)delete{
    
     //清除plist文件，可以根据我上面讲的方式进去本地查看plist文件是否被清除
     NSFileManager *fileMger = [NSFileManager defaultManager];
     NSString *xiaoXiPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]stringByAppendingPathComponent:@"xiaoxi.plist"];
     //如果文件路径存在的话
    BOOL bRet = [fileMger fileExistsAtPath:xiaoXiPath];
     if (bRet) {
                   NSError *err;
                   [fileMger removeItemAtPath:xiaoXiPath error:&err];
      }
   
}
@end
