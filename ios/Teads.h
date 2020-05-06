#import <React/RCTBridgeModule.h>

#if __has_include("RCTViewManager.h")
#import "RCTViewManager.h"
#else
#import <React/RCTViewManager.h>
#endif

#import <TeadsSDK/TeadsSDK.h>


@interface RNTTeadsInReadAdViewManager : RCTViewManager
@end

#pragma mark - TFAInReadAdView+AssociatedObject

@interface TFAInReadAdView (AssociatedObject)

@property (nonatomic, copy) RCTBubblingEventBlock onAdClose;
@property (nonatomic, copy) RCTBubblingEventBlock onDidReceiveAd;
@property (nonatomic, copy) RCTBubblingEventBlock onAdError;
@property (nonatomic, copy) RCTBubblingEventBlock onAdDidFail;

@end


