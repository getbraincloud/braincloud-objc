# brainCloud Client Library

This package includes the brainCloud Client. For more information about brainCloud and the client library
including release history, api documentation, and tutorials please visit:

http://apidocs.braincloudservers.com/

Thanks and happy coding!
- The brainCloud Team



Platform: xxx
Version: x.x.x

## BrainCloud.xcframework Instruction

1. Download BrainCloud.framework or generate an archive of it using the braincloud-obj library workspace.
2. Place it somewhere such as your source root.
3. In xcode, select your project and go to the Build Phases tab. In the Link Binary with Libraries section, drag/add the BrainCloud.framework folder.
4. Go to the General tab, under Frameworks, Libraries, and Embedded Content, set the framework to Embed and Sign.
5. Go to the Build Settings tab, find Header Search Paths and drag/add the path to the included header files eg. "$(SRCROOT)/BrainCloud/Braincloud.framework/Headers/".

### Example usage (eg. in GameViewController):

```objective_c
m_bcWrapper = [[BrainCloudWrapper alloc] init]; // optionally pass in a _wrapperName
[m_bcWrapper  initialize:@"https://api.braincloudservers.com/dispatcherV2" 
        secretKey:@"abc123de-f456-abc1-23de-f789abc0" 
        appId:@"12345" 
        appVersion:@"1.0" 
        companyName:@"YourCompany" 
        appName:@"HelloWorld"];
```
Your appId and secretKey is set on the brainCloud dashboard under **Design | Core App Info > Application IDs**

There is a timer in the BrainCloudClient already connected. Just make calls and receive callbacks.

```objective_c
    successBlock = ^(NSString *serviceName, NSString *serviceOperation, NSString *jsonData,
                     BCCallbackObject cbObject)
    {
        self->_result = true;
        self->_jsonResponse = jsonData;
    };

    failureBlock = ^(NSString *serviceName, NSString *serviceOperation, NSInteger statusCode,
                     NSInteger returnCode, NSString *statusMessage, BCCallbackObject cbObject)
    {
        self->_result = true;
        self->_statusCode = statusCode;
        self->_reasonCode = returnCode;
        self->_statusMessage = statusMessage;
    };
    
    [m_bcWrapper authenticateAnonymous:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
```
where variables are defined

```objective_c
    BrainCloudWrapper *m_bcWrapper;
    
    // accessible within completion blocks
    __block bool _result;
    __block NSString *_jsonResponse;
    __block NSInteger _statusCode;
    __block NSInteger _reasonCode;
    __block NSString *_statusMessage;

    BCCompletionBlock successBlock;
    BCErrorCompletionBlock failureBlock;
```