import React, { Component } from "react";
import { Platform, Dimensions, requireNativeComponent } from "react-native";

const { width } = Dimensions.get("window");

type Props = {
  style: any,
  pid: number,
  load?: boolean,
  onDidReceiveAd: Function,
  onAdDidFail: Function,
  onAdDisplayed: Function,
  onAdClose: Function,
  onAdError: Function,
  enableDebug?: boolean
};

type State = {
  height: number
};
export class AdView extends Component<Props, State> {
  static defaultProps = {
    load: true,
    enableDebug: __DEV__
  };

  constructor(props) {
    super(props);

    this.state = {
      height: 2
    };
  }

  onDidReceiveAd = info => {
    this.setState({
      height: width / info.nativeEvent.adRatio
    });
    if (this.props.onDidReceiveAd) {
      this.props.onDidReceiveAd(info);
    }
  };

  render() {
    const { style, ...rest } = this.props;

    return (
      <TeadsNativeAdView
        onDidReceiveAd={this.onDidReceiveAd}
        style={[
          {
            width,
            height: this.state.height
          },
          style
        ]}
        {...rest}
      />
    );
  }
}

const TeadsNativeAdView = requireNativeComponent(
  Platform.select({ ios: "RNTTeadsInReadAdView", android: "TeadsAdView" }),
  AdView
);

export default AdView;
import React, { Component } from "react";
import { Platform, Dimensions, requireNativeComponent } from "react-native";

const { width } = Dimensions.get("window");

type Props = {
  style: any,
  pid: number,
  load?: boolean,
  onDidReceiveAd: Function,
  onAdDidFail: Function,
  onAdDisplayed: Function,
  onAdClose: Function,
  onAdError: Function,
  enableDebug?: boolean
};

type State = {
  height: number
};
export class AdView extends Component<Props, State> {
  static defaultProps = {
    load: true,
    enableDebug: __DEV__
  };

  constructor(props) {
    super(props);

    this.state = {
      height: 2
    };
  }

  onDidReceiveAd = info => {
    this.setState({
      height: width / info.nativeEvent.adRatio
    });
    if (this.props.onDidReceiveAd) {
      this.props.onDidReceiveAd(info);
    }
  };

  render() {
    const { style, ...rest } = this.props;

    return (
      <TeadsNativeAdView
        onDidReceiveAd={this.onDidReceiveAd}
        style={[
          {
            width,
            height: this.state.height
          },
          style
        ]}
        {...rest}
      />
    );
  }
}

const TeadsNativeAdView = requireNativeComponent(
  Platform.select({ ios: "RNTTeadsInReadAdView", android: "TeadsAdView" }),
  AdView
);

export default AdView;
