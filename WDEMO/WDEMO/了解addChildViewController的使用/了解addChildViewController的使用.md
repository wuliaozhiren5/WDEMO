#了解addChildViewController的使用
 
我正在处理一些我需要重构的代码。视图控制器充当另外两个视图控制器的容器，并将在它们之间进行交换，如下面的代码所示。 这可能不是最好的设计。以这种方式交换视图控制器可能不是必需的。我明白那个。然而，当我使用这段代码时，我想进一步理解addChildViewController调用会发生什么。在苹果的文档或相关问题中，我一直无法找到答案(可能表明设计需要改变)。 具体来说 - 容器视图控制器如何处理要求添加子视图控制器的情况，它已经添加了？它是否认识到它已经添加了该视图控制器对象？ 例如。如果下面的代码在一个方法中 - 并且该方法被调用两次...

[self addChildViewController:viewControllerB];
[self.view addSubview:viewControllerB.view];
[viewControllerB didMoveToParentViewController:self];
[viewControllerA willMoveToParentViewController:nil];
[viewControllerA.view removeFromSuperview];
[viewControllerA removeFromParentViewController];


了解addChildViewController的使用
https://oomake.com/question/3517431


