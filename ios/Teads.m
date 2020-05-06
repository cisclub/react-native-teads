#import "Teads.h"
#import <TeadsSDK/TeadsSDK.h>

@interface RNTTeadsInReadAdViewManager() <TFAAdDelegate>

@end

@implementation RNTTeadsInReadAdViewManager

RCT_EXPORT_MODULE(RNTTeadsInReadAdViewManager)

RCT_EXPORT_VIEW_PROPERTY(onAdClose, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onDidReceiveAd, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onAdError, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onAdDidFail, RCTBubblingEventBlock);
RCT_CUSTOM_VIEW_PROPERTY(pid, NSInteger, TFAInReadAdView) {
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

- (void)adError:(TFAInReadAdView * _Nonnull)ad errorMessage:(NSString * _Nonnull)errorMessage {
    if (!ad.onAdError) {
        return;
    }
    
    ad.onAdError(@{@"errorMessage" : errorMessage});
}

- (void)didFailToReceiveAd:(TFAInReadAdView * _Nonnull)ad adFailReason:(AdFailReason * _Nonnull)adFailReason {
    if (!ad.onAdDidFail) {
        return;
    }
    
    ad.onAdDidFail(@{@"errorCode" : @(adFailReason.errorCode),
                     @"errorMessage" : adFailReason.errorMessage});
}

- (void)didReceiveAd:(TFAInReadAdView * _Nonnull)ad adRatio:(CGFloat)adRatio {
    if (!ad.onDidReceiveAd) {
        return;
    }
    
    ad.onDidReceiveAd(@{@"adRatio" : @(adRatio)});
}

@end

#pragma mark - TFAInReadAdView+AssociatedObject

#import <objc/runtime.h>

@implementation TFAInReadAdView (AssociatedObject)
@dynamic onAdClose;

#pragma mark OnAdClose

- (void)setOnAdClose:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onAdClose), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onAdClose {
    return objc_getAssociatedObject(self, @selector(onAdClose));
}

#pragma mark OnDidReceiveAd

- (void)setOnDidReceiveAd:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onDidReceiveAd), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onDidReceiveAd {
    return objc_getAssociatedObject(self, @selector(onDidReceiveAd));
}

#pragma mark OnAdError

- (void)setOnAdError:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onAdError), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onAdError {
    return objc_getAssociatedObject(self, @selector(onAdError));
}

#pragma mark OnAdDidFail

- (void)setOnAdDidFail:(RCTBubblingEventBlock)object {
    objc_setAssociatedObject(self, @selector(onAdDidFail), object, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (RCTBubblingEventBlock)onAdDidFail {
    return objc_getAssociatedObject(self, @selector(onAdDidFail));
}

@end
