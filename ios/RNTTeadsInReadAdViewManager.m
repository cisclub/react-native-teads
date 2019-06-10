#import "RNTTeadsInReadAdViewManager.h"

@interface RNTTeadsInReadAdViewManager() <TFAAdDelegate>

@end

@implementation RNTTeadsInReadAdViewManager

RCT_EXPORT_MODULE(RNTTeadsInReadAdViewManager)

RCT_EXPORT_VIEW_PROPERTY(onAdClose, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDidReceiveAd, RCTBubblingEventBlock);
RCT_CUSTOM_VIEW_PROPERTY(PID, NSInteger, TFAInReadAdView) {
    [view setPid:[RCTConvert NSInteger:json]];
    [view loadWithTeadsAdSettings:nil];
}

- (TFAInReadAdView *)view {
    TFAInReadAdView *view = [[TFAInReadAdView alloc] initWithPid:0
                                                     andDelegate:self];
    [view loadWithTeadsAdSettings:nil];
    
    return view;
}

#pragma mark - TFAAdDelegate

- (void)adClose:(TFAInReadAdView * _Nonnull)ad userAction:(BOOL)userAction {
    if (!ad.onAdClose) {
        return;
    }
    
    ad.onAdClose(nil);
}

- (void)adError:(TFAAdView * _Nonnull)ad errorMessage:(NSString * _Nonnull)errorMessage {
}

- (void)didFailToReceiveAd:(TFAAdView * _Nonnull)ad adFailReason:(AdFailReason * _Nonnull)adFailReason {
}

- (void)didReceiveAd:(TFAInReadAdView * _Nonnull)ad adRatio:(CGFloat)adRatio {
    if (!ad.onDidReceiveAd) {
        return;
    }
    
    ad.onDidReceiveAd(@{@"adratio" : @(adRatio)});
}

@end

#pragma mark - TFAInReadAdView+AssociatedObject

#import <objc/runtime.h>

@implementation TFAInReadAdView (AssociatedObject)
@dynamic onAdClose;

- (void)setOnAdClose:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onAdClose), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onAdClose {
    return objc_getAssociatedObject(self, @selector(onAdClose));
}

- (void)setOnDidReceiveAd:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onDidReceiveAd), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onDidReceiveAd {
    return objc_getAssociatedObject(self, @selector(onDidReceiveAd));
}

@end
