//
//  FGLanguageTool.m
//  WDEMO
//
//  Created by longzhu on 2019/11/29.
//  Copyright © 2019年 wwc. All rights reserved.
//
#define CNS @"zh-Hans"
#define EN @"en"
#define LANGUAGE_SET @"langeuageset"

#import "AppDelegate.h"
#import "FGLanguageTool.h"

static FGLanguageTool *sharedModel;

@interface FGLanguageTool()

@property(nonatomic,strong)NSBundle *bundle;
@property(nonatomic,copy)NSString *language;

@end

@implementation FGLanguageTool

+(id)sharedInstance
{
    if (!sharedModel)
    {
        sharedModel = [[FGLanguageTool alloc]init];
    }
    
    return sharedModel;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initLanguage];
    }
    
    return self;
}

-(void)initLanguage
{
    NSString *tmp = [[NSUserDefaults standardUserDefaults]objectForKey:LANGUAGE_SET];
    NSString *path;
    //默认是中文
    if (!tmp)
    {
        tmp = CNS;
    }
    else
    {
        tmp = EN;
    }
    
    self.language = tmp;
    path = [[NSBundle mainBundle]pathForResource:self.language ofType:@"lproj"];
    self.bundle = [NSBundle bundleWithPath:path];
}

-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table
{
    if (self.bundle)
    {
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}

-(void)changeNowLanguage
{
    if ([self.language isEqualToString:EN])
    {
        [self setNewLanguage:CNS];
    }
    else
    {
        [self setNewLanguage:EN];
    }
}

-(void)setNewLanguage:(NSString *)language
{
    if ([language isEqualToString:self.language])
    {
        return;
    }
    
    if ([language isEqualToString:EN] || [language isEqualToString:CNS])
    {
        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
        self.bundle = [NSBundle bundleWithPath:path];
    }
    
    self.language = language;
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self resetRootViewController];
}

//重新设置
-(void)resetRootViewController
{
//     old
//    AppDelegate *appDelegate =
//    (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UINavigationController *rootNav = [storyBoard instantiateViewControllerWithIdentifier:@"rootnav"];
//    UINavigationController *personNav = [storyBoard instantiateViewControllerWithIdentifier:@"personnav"];
//    UITabBarController *tabVC = (UITabBarController*)appDelegate.window.rootViewController;
//    tabVC.viewControllers = @[rootNav,personNav];
    
    AppDelegate *appDelegate =
    (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *rootNav = [storyBoard instantiateViewControllerWithIdentifier:@"rootnav"];
    appDelegate.window.rootViewController = rootNav;
  
}
@end
