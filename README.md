# Flutter Project Structure

A simple structure of a Flutter project that uses [bloc architecture](https://pub.dev/packages/flutter_bloc) to help you maintain your source code easily with a clean and scalable architecture.

## Steps to launch
Follow these steps to launch your project:

### Global Configurations

1. Extract the archive release file and open the folder with your Editor (Android studio, VS Code,...)
2. Go to `assets/images` and replace the `logo.jpg` file with your own (it must have the same name and the same extension)
3. In flutter console, go to project folder then run these two commands:
    ```
    flutter pub get
    flutter pub run flutter_launcher_icons:main
    ```
4. Open `lib/presentation/languages/l10n/intl_en.arb` and replace `app_title` field with your app title
5. In `lib/utils/constants.dart` update `colorHex` constant with your main app color and colorSecondary with your secondary color
6. (Optional) In `lib/presentation/styles/styles.dart` you can edit other style properties of your app.

### Android

1. In `android/app/build.gradle` look for `namespace` in `android` block and change its value with your package name
2. In `android/app/build.gradle` look for `applicationId` in `defaultConfig` block and change its value with your package name
3. In `android/app/src/main/kotlin/dev/lyabs/structure/MainActivity.kt` replace `dev.lyabs.structure` with your package name
4. In `android/app/src/main/AndroidManifest.xml` replace the value of `android:label` with your app name

### IOS

1. In `ios/Runner/Info.plist` replace value of `CFBundleName` with your own (only lower case letters separated by '_' allowed)
2. In `ios/Runner/Info.plist` replace value of `CFBundleDisplayName` with your app name
3. Review XCode project settings:
    1. In Xcode, open `Runner.xcworkspace` in your app’s `ios` folder
    2. To view your app’s settings, select the Runner project in the Xcode project navigator. Then, in the main view sidebar, select the Runner target
    3. Select the `General` tab and replace `Bundle Identifier` by your own value
    4. Select the `Signing & Capabilities` tab and replace `Bundle Identifier` by your own value 

### Web

1. In `web/index.html` replace the value of `title` tag with your web app name
2. In `web/index.html` replace the value of meta description content with a description of your app
    ```
    <meta name="description" content="YOUR_APP_DESCRIPTION">
    ```
3. In `web/manifest.json` replace values of `name, short_name, theme_color, description,` with your own

> Enjoy Developing with IT! 😊
