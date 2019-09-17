package com.reactnative.teads;

import android.support.annotation.StringDef;
import android.view.View;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.uimanager.events.RCTEventEmitter;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import tv.teads.sdk.android.AdFailedReason;

public class TeadsEventEmitter {

    private static final String ON_AD_LOADED = "onDidReceiveAd";
    private static final String ON_FAILED_TO_LOAD = "onAdDidFail";
    private static final String ON_AD_DISPLAYED = "onAdDisplayed";
    private static final String ON_AD_CLOSED = "onAdClose";
    private static final String ON_ERROR = "onAdError";

    static final String[] Events = {
            ON_AD_LOADED,
            ON_FAILED_TO_LOAD,
            ON_AD_DISPLAYED,
            ON_AD_CLOSED,
            ON_ERROR,
    };

    @Retention(RetentionPolicy.SOURCE)
    @StringDef({
            ON_AD_LOADED,
            ON_FAILED_TO_LOAD,
            ON_AD_DISPLAYED,
            ON_AD_CLOSED,
            ON_ERROR,
    })
    @interface TeadsEvents {
    }

    private final RCTEventEmitter mEventEmitter;
    private int mViewId = View.NO_ID;

    TeadsEventEmitter(ReactContext reactContext) {
        mEventEmitter = reactContext.getJSModule(RCTEventEmitter.class);
    }

    void setViewId(int viewId) {
        mViewId = viewId;
    }

    public void onAdLoaded(float adRatio) {
        WritableMap event = Arguments.createMap();
        event.putDouble("adRatio", adRatio);
        receiveEvent(ON_AD_LOADED, event);
    }

    public void onAdFailedToLoad(AdFailedReason adFailedReason) {
        WritableMap event = Arguments.createMap();
        event.putInt("errorCode", adFailedReason.getErrorCode());
        event.putString("errorMessage", adFailedReason.getErrorMessage());
        receiveEvent(ON_FAILED_TO_LOAD, event);
    }

    public void onAdDisplayed() {
        receiveEvent(ON_AD_DISPLAYED, Arguments.createMap());
    }

    public void closeAd() {
        receiveEvent(ON_AD_CLOSED, Arguments.createMap());
    }

    public void onError(String errorMessage) {
        WritableMap event = Arguments.createMap();
        event.putString("errorMessage", errorMessage);
        receiveEvent(ON_ERROR, event);
    }

    private void receiveEvent(@TeadsEvents String type, WritableMap event) {
        mEventEmitter.receiveEvent(mViewId, type, event);
    }
}
