#import <React/RCTBridgeModule.h>

@interface RNTTeadsInReadAdViewManager : RCTViewManager
@end

#pragma mark - TFAInReadAdView+AssociatedObject

@interface TFAInReadAdView (AssociatedObject)

@property (nonatomic, copy) RCTBubblingEventBlock onAdClose;
@property (nonatomic, copy) RCTBubblingEventBlock onDidReceiveAd;
@property (nonatomic, copy) RCTBubblingEventBlock onAdError;
@property (nonatomic, copy) RCTBubblingEventBlock onAdDidFail;

@end

