#显示HTML文本
iOS中TextView显示HTML文本
https://www.jianshu.com/p/85d59410d3df
```
NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
self.msg.attributedText = attributedString;
```
