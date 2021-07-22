#!/usr/bin/env bash
python3 /Users/rrtv/WDEMO/WDEMO/CodeConfuse/Confuse.py \
-i /Users/rrtv/WDEMO/WDEMO/WDEMO \
-s /Users/rrtv/WDEMO/WDEMO/System_Frameworks_iOS \
-e /Users/rrtv/WDEMO/WDEMO/WDEMO/Actor \
-k /Users/rrtv/WDEMO/WDEMO/CodeConfuse/ignoreKey.txt \
-o /Users/rrtv/WDEMO/WDEMO/CodeConfuse



#python3 Confuse.py \
#-i 你需要混淆的代码的目录，可以是多个目录，以`,`分隔 \
#-s 当前项目编译环境的SDK库头文件目录，可以是多个目录，以`,`分隔 \
#-e 你不需要混淆的代码的目录，Swift代码目录，可以是多个目录，以`,`分隔 \
#-c 你需要提取关键字做排除混淆的目录，可以是多个目录，以`,`分隔 \
#-k 可选，用于存放需要过滤的key(增加内容)
#-o 输出文件目录

#注：各参数的意义如下：
#
#-i（input_dirs）：必须，项目需要处理的主要文件所在的目录
#-s（system_dirs）：可选，配置系统Framework文件的目录，一般用于做排除字典，避免替换系统关键字
#-e（exclusive_dirs）：可选，用于存放不扫描处理的文件的目录，比如Swift文件目录
#-c（clean_dirs）：可选，用于存放排除关键字的文件的目录，例如Pods下的目录，或者静态库（头文件修改后会出错）
#-k（ignore_key_dir）：可选，用于存放需要过滤的key(增加内容)
#-o（output_dir）：必须，输出文件的目录，用于输出关键字、日志以及最后生成的混淆头文件的目录



#-s
#系统库路径/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/Frameworks
