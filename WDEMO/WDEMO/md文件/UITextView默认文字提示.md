#UITextView默认文字提示

UITextView默认文字提示
https://www.bbsmax.com/A/xl561PjoJr/

```
在UITextField中自带placeholder属性，可以用于提示输入框信息。但是UITextView并不具备此功能
介绍两种方法来实现：
第一种：
初始化UITextView
//首先定义UITextView
UITextView *textView = [[UITextView alloc] init];
textView.font = [UIFont systemFontOfSize:14];
textView.frame =CGRectMake(10, 0, cell.contentView.bounds.size.width-20, side);
textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
textView.backgroundColor = [UIColor whiteColor];
[cell.contentView addSubview:textView];
textView.hidden = NO;
textView.delegate = self;
//其次在UITextView上面覆盖个UILable,UILable设置为全局变量。
uilabel.frame =CGRectMake(17, 8, cell.contentView.bounds.size.width - side+10, 20);
uilabel.text = @"请填写审批意见...";
uilabel.enabled = NO;//lable必须设置为不可用
uilabel.backgroundColor = [UIColor clearColor];
[cell.contentView addSubview:uilabel];
实现UITextView的代理
-(void)textViewDidChange:(UITextView *)textView
{
    self.examineText =  textView.text;
    if (textView.text.length == 0) {
        uilabel.text = @"请填写审批意见...";
    }else{
        uilabel.text = @"";
    }
} 
```
