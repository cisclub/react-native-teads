# react-native-teads

## Getting started

`$ npm install react-native-teads --save`

### Mostly automatic installation

`$ react-native link react-native-teads`

## Usage

```javascript
import React, { Component } from "react";
import { Dimensions } from "react-native";
import TeadsNativeAdView from "react-native-teads";

const { width } = Dimensions.get("window");

class AdView extends Component<Props, State> {
  constructor(props) {
    super(props);

    this.state = {
      height: 0
    };
  }

  onDidReceiveAd = info => {
    this.setState({
      height: width / info.nativeEvent.adRatio
    });
  };

  render() {
    const { style } = this.props;

    return (
      <TeadsNativeAdView
        style={[
          {
            width,
            height: this.state.height
          },
          style
        ]}
        pid={84242}
        onDidReceiveAd={this.onDidReceiveAd}
      />
    );
  }
}
```

