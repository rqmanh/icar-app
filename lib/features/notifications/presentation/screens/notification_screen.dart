import 'package:flutter/material.dart';
import 'package:icar/config/app_keys.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppKeys.nothingFound),
      ),
      body: Container(),
    );
  }
}