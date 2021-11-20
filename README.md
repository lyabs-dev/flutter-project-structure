# Flutter Project Structure

A simple structure of a Flutter project to help you to maintain easily you source code.

# Steps to launch
Follow these steps to launch your project:

<h2>Global Configurations</h2>

<ol>
    <li>Extract the archive release file and open the folder with your Editor (Android studio, VS Code,...)</li>
    <li>Go to <b>assets/images</b> and replace the logo.jpg file with your own (it must have the same name and the same extension)</li>
    <li>In flutter console, go to project folder then run these two commands:
    <blockquote>
        <code>
            <p>flutter pub get</p>
            <p>flutter pub run flutter_launcher_icons:main</p>
        </code>
    </blockquote>
    </li>
    <li>
    Open <b>assets/i18n/en.json</b> and replace <i>app_title</i> field with your app title
    </li>
    <li>In <b>lib/styles/styles.dart</b> change dark theme and light theme properties of your app</li>
</ol>

<h2>Android</h2>

<ol>
    <li>In <b>android/app/build.gradle</b> look for <i>applicationId</i> in <i>defaultConfig</i> block and change it's value with your package name</li>
    <li>In <b>android/app/src/main/AndroidManifest.xml</b> replace the value of <code>android:label</code> with your app name</li>
</ol>

<h2>IOS</h2>

<ol>
    <li>In <b>ios/Runner/Info.plist</b> replace value of <code>CFBundleName</code> with your own (only lower case letters separated by '_' allowed)</li>
    <li>
        Review XCode project settings:
        <ol>
            <li>In Xcode, open <b>Runner.xcworkspace</b> in your app’s <b>ios</b> folder</li>
            <li>To view your app’s settings, select the Runner project in the Xcode project navigator. Then, in the main view sidebar, select the Runner target</li>
            <li>Select the <b>General</b> tab</li>
            <li>Replace <b>Display Name</b> and <b>Bundle Identifier</b> by your own value</li>
        </ol>
    </li>
</ol>

<h2>Web</h2>

<ol>
    <li>Go to [Favicon Generator](https://www.favicon-generator.org/) and generate icons from your logo</li>
    <li>Copy all generated files (except browserconfig and manifest) in <b>web/icons</b></li>
    <li>In <b>web/index.html</b> replace the value of <code>title</code> tag with your web app name</li>
    <li>In <b>web/index.html</b> replace the value of meta description content with a description of your app
    <blockquote>
    <code>&lt;meta name="description" content="YOUR_APP_DESCRIPTION"&gt;</code>
    </blockquote>
    </li>
    <li>In <b>web/manifest.json</b> replace values of <code>name, short_name, theme_color, description, </code> with your own</li>
</ol>

<h1><b>Enjoy IT 😊</b></h1>
