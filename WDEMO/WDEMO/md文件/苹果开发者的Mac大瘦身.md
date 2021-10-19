#苹果开发者的Mac大瘦身
https://www.jianshu.com/p/aa134efa2ffa

本文系转载，原文地址
https://welkinx.com/2016/04/16/0/

鉴于买的MacBook只有128G，而最近空间吃紧，于是用 OmniDiskSweeper 看了一下电脑空间的占用情况之后，决定对Xcode下手。最终释放了30G的空间。
下面说一下我清理了哪些文件:
1. ~/Library/Developer/Xcode/DerivedData/

这个文件夹中保存的是Xcode的缓存文件，曾经在Xcode跑过的所有项目的索引、build的信息等都会保存在这里。删除后在下次打开项目编译的时候将会重新生成。由于这里包含了大量已经没用的项目的信息又懒得去筛选，于是把整个文件夹删了。
2. ~/Library/Developer/Xcode/iOS DeviceSupport/

每次把一个设备接入电脑进行真机调试之前，电脑会对设备建立索引，也在此文件夹下生成对该设备系统的支持文件。于是这里存在了一堆对旧版本iOS设备支持的文件。而我最近基本只对iOS9.3的设备进行真机调试。于是删除了所有低于9.3的文件夹。
3. ~/Library/Developer/Xcode/Archives/

每次打包App的dSYM等数据就保存在这里，把一些没用的版本删了。如果是上线了的版本还是保留吧。
4. ~/Library/Developer/Xcode/Products/

同上，把没用的删了。
5. ~/Library/Developer/CoreSimulator/Devices/

一堆模拟器的数据。每个文件夹里包含的就是一个特定系统版本的设备的数据。每个文件夹对应哪个设备可以在其下device.plist中查看。亲测删除之后的效果跟在模拟器里重置相同。省得一个个去重置了，删吧。
6. ~/Library/Developer/XCPGDevices/

这里保存了playground的项目缓存。全删了。
好吧，30G就这样没了。 :]

作者：小白猿
链接：https://www.jianshu.com/p/aa134efa2ffa
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
