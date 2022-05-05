#适配iOS13之AFNetworking + UIWebView
 
////////////////////////////////////////////////////////////////////////////////////

AFNetworking 4.0以下版本存在UIWebView，导致APP store不通过
https://www.jianshu.com/p/424e778e32f6

方法一
原文链接：https://blog.csdn.net/number_one_2015/article/details/106332971
```
abstract_target 'BasePods' do
pod 'AFNetworking', '=2.5.4'
 
# remove UIKit(UIWebView) rejected by AppStore
pre_install do |installer|
    puts 'pre_install begin....'
    dir_af = File.join(installer.sandbox.pod_dir('AFNetworking'), 'UIKit+AFNetworking')
    Dir.foreach(dir_af) {|x|
      real_path = File.join(dir_af, x)
      if (!File.directory?(real_path) && File.exists?(real_path))
        if((x.start_with?('UIWebView') || x == 'UIKit+AFNetworking.h'))
          File.delete(real_path)
          puts 'delete:'+ x
        end
      end
    }
    puts 'end pre_install.'
end
 
end
```
方法二
升级到AFnetworking 4.0及以上版本
```
pod 'AFNetworking', '~> 4.0'
```



UIWebView存在在AFNetworking，导致APP store不通过
https://blog.csdn.net/Number_One_2015/article/details/106332971




适配iOS13之AFNetworking + UIWebView
https://www.jianshu.com/p/4584d2546db8

 
 
