//
//  ForceTouchDetailVC.m
//  WDEMO
//
//  Created by xxx on 2017/11/24.
//  Copyright © 2017年 wwc. All rights reserved.
//

#import "ForceTouchDetailVC.h"

@interface ForceTouchDetailVC ()

@property(strong,nonatomic) UILabel *lab;

@property (strong, nonatomic) UILabel *lbForce;

@property (strong, nonatomic) UILabel *lbForcexxx;

@end

@implementation ForceTouchDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _str;
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    _lab.textAlignment = NSTextAlignmentCenter;
    _lab.center=self.view.center;
    [self.view addSubview:_lab];
    _lab.text = _str;
    
    _lbForce = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 200, 64, 200, 20)];
    _lbForce.backgroundColor = [UIColor redColor];
    _lbForce.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_lbForce];
    _lbForce.text = @"压力";
 
    _lbForcexxx = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, 200, 100)];
    _lbForcexxx.backgroundColor = [UIColor redColor];
    _lbForcexxx.textAlignment = NSTextAlignmentCenter;
    _lbForcexxx.tag = 105;
    _lbForcexxx.userInteractionEnabled = YES;
    [self.view addSubview:_lbForcexxx];
    _lbForcexxx.text = @"用不同力度按我试试";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Aciton3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton3");
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"Began压力 ＝ %f",touch.force);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
//        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
    }
    
}

//按住移动or压力值改变时的回调
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    //通过tag确定按压的是哪个view，注意：如果按压的是label，将label的userInteractionEnabled属性设置为YES
    if (touch.view.tag == 105) {
        NSLog(@"move压力 ＝ %f",touch.force);
        //红色背景的label显示压力值
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
        //红色背景的label上移的高度＝压力值*100
//        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
        _lbForce.frame = CGRectMake(self.view.frame.size.width - 200, +64, 200, 20) ;

    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"End压力 ＝ %f",touch.force);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
//        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
        _lbForce.frame = CGRectMake(self.view.frame.size.width - 200, +64, 200, 20) ;
    }
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"Cancel压力 ＝ %f",touch.force);
        NSLog(@"压力所在view的tag ＝ %li",touch.view.tag);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
//        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
        _lbForce.frame = CGRectMake(self.view.frame.size.width - 200, +64, 200, 20) ;
    }
    
}
@end
