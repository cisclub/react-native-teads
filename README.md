# react-native-teads

## Getting started

`$ npm install react-native-teads --save`

### Mostly automatic installation

`$ react-native link react-native-teads`

**NOTE:**
iOS:
1- link the `TeadsSDK.framework` to your project by drag and drop and make sure `TeadsSDK.framework` appears in application's target > General > Linked Framework and Libraries
2- Add `TeadsSDK.framework` to application target > General > Embedded Binaries

Android:
You need to add `maven { url "http://dl.bintray.com/teads/TeadsSDK-android" }` to your android/build.gradle as follows:

```
allprojects {
    repositories {
        // ...
        maven {
            url 'http://dl.bintray.com/teads/TeadsSDK-android'
        }
    }
    // ...
}
```

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-teads` and add `RNTeads.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTeads.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. link the `TeadsSDK.framework` to your project by drag and drop and make sure `TeadsSDK.framework` appears in application's target > General > Linked Framework and Libraries
5. Add `TeadsSDK.framework` to application target > General > Embedded Binaries
6. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.reactlibrary.RNTeadsPackage;` to the imports at the top of the file
- Add `new RNTeadsPackage()` to the list returned by the `getPackages()` method

2. Append the following lines to `android/settings.gradle`:
   ```
   include ':react-native-teads'
   project(':react-native-teads').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-teads/android')
   ```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
   ```
     compile project(':react-native-teads')
   ```
4. You need to add `maven { url "http://dl.bintray.com/teads/TeadsSDK-android" }` to your android/build.gradle as follows:
   ```
     allprojects {
           repositories {
               // ...
               maven {
                   url 'http://dl.bintray.com/teads/TeadsSDK-android'
               }
           }
           // ...
       }
   ```

## Usage

And use this where you want to use the ad view

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
