 OS中PCH文件的使用
https://www.jianshu.com/p/2e839ef4768d



iOS项目中添加pch文件
https://www.jianshu.com/p/10e11de8c5e1



1.Command+N选择
2.设置Precomplite Prefix Header 的布尔值为YES,
作用是让pch文件预编译后缓存起来，减少之后的编译时间。
3.设置Prefix Header的值为$(SRCROOT)/项目名/PCH文件名.pch









iOS项目中PCH文件的一些坑
https://www.jianshu.com/p/282ccbf9d701

1.项目拷贝到别的电脑时运行报错，找不到pch文件。
这是因为项目中pch文件路径写的绝对路径，应该改为相对路径。
在Build Settings的搜索框中输入prefix header进行搜索，找到Prefix Header后双击后面的路径。然后将路径中第一个项目名和其前面的内容删掉替换成$(SRCROOT)。比如我的项目名是aaa，PCH文件路径是/Users/TING/Downloads/aaa/aaa/PrefixHeader.pch（注意路径中会出现2个项目aaa），替换后的路径为$(SRCROOT)/aaa/PrefixHeader.pch。
重新运行程序就可以了。

2.pch文件中引入头文件时最好用#ifdef OBJC和#endif将要引入的头文件包裹起来。这样保证只有OC文件才导入pch文件中的这些头文件。否则的话，项目中有非OC文件(比如.c、.mm、.cpp等后缀的文件)的话运行可能会报错。

```
#ifndef PrefixHeader_pch
#define PrefixHeader_pch

#ifdef __OBJC__
#import "MyTool.h"
#import <Masonry.h>
#endif

// 判断是iPhone还是iPad
#define IS_IPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#endif
```

3.pch文件中引用自己创建的头文件时不自动提示。对于新创建的项目，刚开始可能无法自动提示，要多等一会再试试。如果等了很久都一直没有提示，那么选择Xcode的“File--Project Settings”，将Build Settings改为Legacy Build System然后保存

作者：一叶知秋0830
链接：https://www.jianshu.com/p/282ccbf9d701
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。





Xcode12模拟器编译失败报错的解决方法总结
https://www.jianshu.com/p/c3245b996e3b

```
解决方法。
通过对1，2，3，4这上面的几点的理解后，问题的解决非常简单。

1.Architectures选项，设置他的值为Standard architectures - $(ARCHS_STANDARD)
2.xcode里面的Build Active Architectures Only选项，debug为Yes，release为No
3.xcode里面的Excluded Architectures选项，保留为空（网上不断在这里加arm64的，其实不用）
4.xcode里面的VALID_ARCHS选项，设置他的值为arm64 arm64e x86_64

然后模拟器编译ok

作者：coder_feng
链接：https://www.jianshu.com/p/c3245b996e3b
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
```
