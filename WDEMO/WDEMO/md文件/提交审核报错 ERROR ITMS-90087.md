#提交审核报错 ERROR ITMS-90087
 
提交审核报错 ERROR ITMS-90087解决办法
https://blog.csdn.net/m0_37809901/article/details/117079622

自建framework提交审核报错 ERROR ITMS-90087解决办法
https://blog.csdn.net/yutaotst/article/details/53887958

```
ERROR ITMS-90087: "Unsupported Architectures. The executable for yht.temp_caseinsensitive_rename.app/Frameworks/VideoCore.framework contains unsupported architectures '[x86_64, i386]'."
 
 
 
 ERROR ITMS-90209: "Invalid Segment Alignment. The app binary at 'yht.temp_caseinsensitive_rename.app/Frameworks/VideoCore.framework/VideoCore' does not have proper segment alignment. Try rebuilding the app with the latest Xcode version."
 
 
 
ERROR ITMS-90125: "The binary is invalid. The encryption info in the LC_ENCRYPTION_INFO load command is either missing or invalid, or the binary is already encrypted. This binary does not seem to have been built with Apple's linker."
 
 
 
WARNING ITMS-90080: "The executable 'Payload/yht.temp_caseinsensitive_rename.app/Frameworks/VideoCore.framework' is not a Position Independent Executable. Please ensure that your build settings are configured to create PIE executables. For more information refer to Technical Q&A QA1788 - Building a Position Independent Executable in the iOS Developer Library."
```

```
APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"
 
# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"
 
EXTRACTED_ARCHS=()
 
for ARCH in $ARCHS
do
echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done
 
echo "Merging extracted architectures: ${ARCHS}"
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"
 
echo "Replacing original executable with thinned version"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
 
done

```
