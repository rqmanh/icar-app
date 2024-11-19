import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

mixin RouteAwareWidget<T extends StatefulWidget> on State<T> implements RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    // The screen became visible
    onScreenVisible();
  }

  @override
  void didPopNext() {
    // The screen became visible again after another screen was popped
    onScreenVisible();
  }

  @override
  void didPop() {
    // The screen was popped, no longer visible
    onScreenInvisible();
  }

  @override
  void didPushNext() {
    // Another screen was pushed on top, making this screen invisible
    onScreenInvisible();
  }

  // Override these methods in your screen to handle visibility
  void onScreenVisible() {}
  void onScreenInvisible() {}
}
