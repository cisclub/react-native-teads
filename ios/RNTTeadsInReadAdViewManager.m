#import "RNTTeadsInReadAdViewManager.h"
#import <TeadsSDK/TeadsSDK.h>

@implementation RNTTeadsInReadAdViewManager

RCT_EXPORT_MODULE(RNTTeadsInReadAdViewManager)

- (TFAInReadAdView *)view {
    return [[TFAInReadAdView alloc] initWithPid:84242
                                    andDelegate:nil];
}

RCT_EXPORT_VIEW_PROPERTY(pid, BOOL)

@end
