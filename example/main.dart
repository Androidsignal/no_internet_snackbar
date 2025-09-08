import 'package:flutter/material.dart';
import 'package:no_internet_snackbar/no_internet_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ExampleScreen(),
    );
  }
}
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NoInternetSnackBar(
      snackbarMargin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margin around snackbar
      snackbarPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Padding inside snackbar
      snackbarBorderRadius: BorderRadius.circular(8), // Border radius of snackbar
      swipeToDismiss: true, // Allow swipe to dismiss snackbar
      tapToDismiss: true, // Allow tap to dismiss snackbar
      onlineImage: Icon(Icons.wifi,size: 50,color: Colors.blue), // Optional online image
      offlineImage: Icon(Icons.wifi_off,size: 50,color: Colors.blue), // Optional offline image
      duration: const Duration(seconds: 8), // Duration before auto-hide
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
      buttonLabel: "Reconnect", // Retry button text
      /// Retry button callback
      onRetry:  () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Retrying connection...")),
        );
      },
      child: const Scaffold(
        body: Center(
          child: Text('Example Screen'),
        ),
      ),
    );
  }
}