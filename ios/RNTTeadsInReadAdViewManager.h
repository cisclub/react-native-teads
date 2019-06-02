
#if __has_include("RCTBridgeModule.h")
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

#if __has_include("RCTViewManager.h")
#import "RCTViewManager.h"
#else
#import <React/RCTViewManager.h>
#endif

@interface RNTTeadsInReadAdViewManager : RCTViewManager
@end
