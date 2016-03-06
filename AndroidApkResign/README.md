Android APK 重签名工具
===

### 应用场景
在使用robotium进行自动化测试时，需要被测应用与测试apk签名一致，测试用例才能执行。因此，对待测应用重签名是首先要解决的问题。
在搜索了各种资料后，实现了一个简单的批处理文件，来完成对apk重签名。
使用步骤：

1. 使用7z打开apk文件
2. 删除META-INF文件夹
3. 关闭7z,得到没有签名的apk文件:nosign.apk
4. 运行run.bat，输入apk的绝对路径，开始重签名。

### 实现原理
1. 签名文件使用的是当前运行电脑上的 debug.keystore, 当然你也可以使用自己的key, 修改批处理文件就可以了。
2. 签名命令

```
jarsigner -verbose -keystore debug.keystore -signedjar phonebook_signed.apk phonebook.apk mine.keystore
```

jarsigner是java的签名工具

- verbose参数表示：显示出签名详细信息
- keystore表示使用当前目录中的debug.keystore签名证书文件。
- signedjar phonebook_signed.apk表示签名后生成的apk名称，phonebook.apk表示未签名的apk android软件其他 ， mine.keystore表示别名.

关于sdk工具使用的keystore：

- keystore名字：“debug.keysotre”
- keystore密码：“android”
- key别名：“androiddebugkey”
- key密码：“android”
