
# react-native-teads

## Getting started

`$ npm install react-native-teads --save`

### Mostly automatic installation

`$ react-native link react-native-teads`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-teads` and add `RNTeads.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTeads.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

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


## Usage

Create Module for  Ad view. Just create a Java script file (say TeadsInReadAdView.js) and paste following:
```
// TeadsInReadAdView.js

import { requireNativeComponent } from "react-native";

module.exports = requireNativeComponent("RNTTeadsInReadAdView");
```

And use this where you want to use the ad view
```javascript
import RNTeads from './src/TeadsInReadAdView';

<TeadsAdView
    PID={84242}
    style={{ flex: 0.5 }}
    onAdClose={dic => console.log("Ad Closed:\n", dic.nativeEvent)}
    onDidReceiveAd={dic =>
        console.log("Did Receive Ad:\n", dic.nativeEvent)}
/>
```
  
