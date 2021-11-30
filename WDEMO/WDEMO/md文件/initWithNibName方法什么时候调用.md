#initWithNibName:方法什么时候调用

initWithNibName:方法什么时候调用
https://blog.csdn.net/sinat_31063657/article/details/51784227


今天看一个demo,发现在没有调用 initWithNibName时,这个方法依然被调用了,于是查了一下,发现,iOS中初始化(init)对象时，会调用对象的init方法，进入init方法时会调用initWithNibName方法，也就是 init方法会默认调用initWithNibName.

而初始化方法用initWithNibName,它可以让控制器一创建出来就拥有某些属性,所以在自定义初始化方法时建议使用:

```
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {

        // Custom initialization

    }

    return self;

}
```
————————————————
版权声明：本文为CSDN博主「韩小童鞋」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/sinat_31063657/article/details/51784227
