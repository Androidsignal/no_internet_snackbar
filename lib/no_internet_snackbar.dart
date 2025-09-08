import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Snackbar position enum
enum SnackBarPosition { top, bottom }

/// A widget that automatically shows a **snackbar-style box**
/// when internet is lost or restored.
class NoInternetSnackBar extends StatefulWidget {
  final Widget child;

  /// Message when no internet.
  final String offlineMessage;

  /// Message when back online.
  final String onlineMessage;

  /// Background color for offline.
  final Gradient? offlineColor;

  /// Background color for online.
  final Gradient? onlineColor;

  /// Duration before auto-hide.
  final Duration duration;

  /// Text style.
  final TextStyle? offlineMessageTextStyle;
  final TextStyle? onlineMessageTextStyle;

  /// Retry button text.
  final String? buttonLabel;

  /// Retry callback.
  final VoidCallback? onRetry;

  /// Optional image/icon widget.
  final Widget? onlineImage;
  final Widget? offlineImage;
  final List<BoxShadow>? boxShadow;

  /// Position of snackbar (top / bottom).
  final SnackBarPosition position;
  final BorderRadiusGeometry? snackbarBorderRadius;

  /// Margin-padding snackbar.
  final EdgeInsets? snackbarMargin;
  final EdgeInsets? snackbarPadding;

  /// Enable swipe to dismiss snackbar.
  final bool swipeToDismiss;
  final bool tapToDismiss;

  const NoInternetSnackBar({
    super.key,
    required this.child,
    this.offlineMessage = "No internet connection!",
    this.onlineMessage = "Back Online",
    this.offlineColor,
    this.onlineColor,
    this.duration = const Duration(seconds: 5),
    this.offlineMessageTextStyle,
    this.onlineMessageTextStyle,
    this.buttonLabel,
    this.onRetry,
    this.onlineImage,
    this.offlineImage,
    this.position = SnackBarPosition.bottom,
    this.snackbarBorderRadius,
    this.snackbarMargin,
    this.snackbarPadding,
    this.boxShadow,
    this.swipeToDismiss = false,
    this.tapToDismiss = false,
  });

  @override
  State<NoInternetSnackBar> createState() => _NoInternetSnackBarState();
}

class _NoInternetSnackBarState extends State<NoInternetSnackBar> {
  late final StreamSubscription<List<ConnectivityResult>> subscription;
  bool hasInternet = true;
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    subscription =
        Connectivity().onConnectivityChanged.listen(updateConnectionStatus);
    _checkInitialConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    updateConnectionStatus(result);
  }

  void updateConnectionStatus(List<ConnectivityResult> results) {
    final hasInternet = results.any((r) => r != ConnectivityResult.none);
    if (this.hasInternet != hasInternet) {
      this.hasInternet = hasInternet;
      showOverlay(hasInternet);
    }
  }

  void showOverlay(bool hasInternet) {
    overlayEntry?.remove();

    Widget snackbarContent = AnimatedContainer(
      duration: widget.duration,
      margin: widget.snackbarMargin,
      padding: widget.snackbarPadding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (hasInternet ? widget.onlineColor : widget.offlineColor) == null
            ? (hasInternet ? Colors.green : Colors.red)
            : null,
        gradient: hasInternet ? widget.onlineColor : widget.offlineColor,
        borderRadius: widget.snackbarBorderRadius,
        boxShadow: widget.boxShadow ??
            [
              const BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              )
            ],
      ),
      child: Row(
        children: [
          hasInternet
              ? (widget.onlineImage ??
              const Icon(Icons.wifi, color: Colors.white, size: 30))
              : (widget.offlineImage ??
              const Icon(Icons.wifi_off, color: Colors.white, size: 30)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hasInternet ? widget.onlineMessage : widget.offlineMessage,
              style: hasInternet
                  ? (widget.onlineMessageTextStyle ??
                  const TextStyle(color: Colors.white, fontSize: 16))
                  : (widget.offlineMessageTextStyle ??
                  const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          if (!hasInternet && widget.buttonLabel != null)
            TextButton(
              onPressed: widget.onRetry,
              child: Text(widget.buttonLabel!, style: const TextStyle(color: Colors.white)),
            ),
        ],
      ),
    );

    // Wrap with tap-to-dismiss
    if (widget.tapToDismiss) {
      snackbarContent = GestureDetector(
        onTap: () => _removeSnackbar(),
        child: snackbarContent,
      );
    }

    //  Wrap with swipe-to-dismiss
    if (widget.swipeToDismiss) {
      snackbarContent = Dismissible(
        key: UniqueKey(),
        direction: widget.position == SnackBarPosition.top
            ? DismissDirection.up
            : DismissDirection.down,
        onDismissed: (context) => _removeSnackbar(),
        child: snackbarContent,
      );
    }

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: widget.position == SnackBarPosition.top ? 40: null,
        bottom: widget.position == SnackBarPosition.bottom ? 0 : null,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: snackbarContent,
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);

    if (widget.duration != Duration.zero) {
      Future.delayed(widget.duration, _removeSnackbar);
    }
  }

  void _removeSnackbar() {
    overlayEntry?.remove();
    overlayEntry = null;
  }


  @override
  void dispose() {
    subscription.cancel();
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

