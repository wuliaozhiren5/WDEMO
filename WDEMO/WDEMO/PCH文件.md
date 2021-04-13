 OS中PCH文件的使用
https://www.jianshu.com/p/2e839ef4768d



iOS项目中添加pch文件
https://www.jianshu.com/p/10e11de8c5e1



1.Command+N选择
2.设置Precomplite Prefix Header 的布尔值为YES,
作用是让pch文件预编译后缓存起来，减少之后的编译时间。
3.设置Prefix Header的值为$(SRCROOT)/项目名/PCH文件名.pch
