
[!["dashstack_poster"](https://github.com/user-attachments/assets/f2bc02d8-cb45-41a6-bfc7-b849cda7366b)](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8?pvs=143)


#   No Internet SnackBar 
A customizable Flutter widget that automatically shows a snackbar-style when the internet connection is lost or restored.

---

## ✨ Features
🌐 Auto-detects internet connectivity using connectivity_plus.

📍 Show snackbar on top or bottom of the screen.

🎨 Customizable colors, gradients, text styles, and icons.

👆 Tap-to-dismiss option.

👉 Swipe-to-dismiss option (up / down based on position).

⏱ Auto-hide after a given duration.

🔄 Retry button with callback support.

🖼 Add custom online/offline icons or images.

🪟 Adjustable margin, padding, border radius, box shadows.

---

## 📸 Screenshots
| NoInternetSnackBar Default Screen | NoInternetSnackBar Customizable Screen |
|----------------------------------|---------------------------------------|
| ![Default Screen](https://github.com/user-attachments/assets/2ed6e455-2aeb-4fc3-9e38-1ded5d5d25fe) | ![Customizable Screen](https://github.com/user-attachments/assets/eef384c8-27fe-4c5a-a072-c8798a58c0ae) |

---

## How to use it ?

### 1. Add dependency
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  no_internet_snackbar: <latest_version>
```  

### 2. Install it You can install packages from the command line: 

with pub :
```
$ pub get
```
with Flutter : 
```
$ flutter pub get
```
### 3. Import it

Now in your `Dart` code, you can use :

```
import 'package:no_internet_snackbar/no_internet_snackbar.dart';

```

### 4. Use it

Sample app demonstrates how simple the usage of the library actually is.

Using PriceText in your project is super simple.

You just need to add the widget with an amount and currency type, and it will handle formatting for you.

## 🎨 Customization Options

| Property                  | Type               | Default                     | Description                                      |
| ------------------------- | ------------------ | --------------------------- | ------------------------------------------------ |
| `offlineMessage`          | `String`           | `"No internet connection!"` | Text shown when offline                          |
| `onlineMessage`           | `String`           | `"Back Online"`             | Text shown when online                           |
| `offlineColor`            | `Gradient?`        | Red                         | Offline snackbar background                      |
| `onlineColor`             | `Gradient?`        | Green                       | Online snackbar background                       |
| `offlineMessageTextStyle` | `TextStyle?`       | White, size 16              | Offline text style                               |
| `onlineMessageTextStyle`  | `TextStyle?`       | White, size 16              | Online text style                                |
| `position`                | `SnackBarPosition` | `bottom`                    | Snackbar position (top/bottom)                   |
| `duration`                | `Duration`         | 5s                          | Auto-hide duration (`Duration.zero` = keep open) |
| `swipeToDismiss`          | `bool`             | `false`                     | Enable swipe-to-dismiss                          |
| `tapToDismiss`            | `bool`             | `false`                     | Enable tap-to-dismiss                            |
| `onlineImage`             | `Widget?`          | WiFi Icon                   | Custom widget when online                        |
| `offlineImage`            | `Widget?`          | WiFi Off Icon               | Custom widget when offline                       |
| `textLabel`               | `String?`          | `null`                      | Retry button text                                |
| `onRetry`                 | `VoidCallback?`    | `null`                      | Retry button callback                            |
| `snackbarBorderRadius`    | `BorderRadius?`    | `null`                      | Snackbar border radius                           |
| `snackbarMargin`          | `EdgeInsets?`      | `null`                      | Margin around snackbar                           |
| `snackbarPadding`         | `EdgeInsets?`      | `12px`                      | Padding inside snackbar                                               

### withount any customization
```
return NoInternetSnackBar(
  child: const Scaffold(
  body: Center(
    child: Text('Example Screen'),
  ),
 ),
);
```
### with customization
```
  return NoInternetSnackBar(
      snackbarMargin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margin around snackbar
      snackbarPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside snackbar
      snackbarBorderRadius: BorderRadius.circular(8), // Border radius of snackbar
      swipeToDismiss: true, // Allow swipe to dismiss snackbar
      tapToDismiss: true, // Allow tap to dismiss snackbar
      onlineImage: Icon(Icons.wifi,size: 50,color: Colors.blue,), // Optional online image
      offlineImage: Image.asset('assets/no_wifi.png', width: 50, height: 50), // Optional offline image
      duration: const Duration(seconds: 5), // Duration before auto-hide
      /// Gradient colors for offline snackbar
       offlineColor:  const LinearGradient(
        colors: [Colors.red, Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
      offlineMessage: "No internet connection!", // Offline message
      offlineMessageTextStyle: TextStyle(fontSize: 16, color: Colors.white), // Offline text style
      /// Gradient colors for online snackbar
      onlineColor:  const LinearGradient(
        colors: [Colors.green, Colors.lightGreen],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
      onlineMessageTextStyle: TextStyle(fontSize: 16, color: Colors.white), // Online text style
      onlineMessage: "Back to Online", // Online message
      textLabel: "Reconnect", // Retry button text
      /// Retry button callback
      onRetry:  () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Retrying connection...")),
        );
      },
      position: SnackBarPosition.top, // Position of snackbar (top/bottom)
      child: const Scaffold(
        body: Center(
          child: Text('Example Screen'),
        ),
      ),
    );
```



# Bugs and Feedback 
We welcome and appreciate any suggestions you may have for improvement.
For bugs, questions, and discussions please use the [GitHub Issues](your link).

# Acknowledgments 
It extends Flutter’s foundation to provide a ready-to-use, customizable currency formatter widget.While Flutter and intl provide the base, price_text simplifies the process by combining widgets and formatting logic into a single package you can drop into any app.
 
# Contribution 
The DashStack team enthusiastically welcomes contributions and project participation!
There are a bunch of things you can do if you want to contribute!
The Contributor Guide has all the information you need for everything from reporting bugs to contributing new features.
  
# Credits 
`no_internet_snackbar` is owned and maintained by the `Dashstack team`.
Follow us for updates and new releases 🚀.

