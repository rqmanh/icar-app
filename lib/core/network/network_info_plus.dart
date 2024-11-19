import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoPlus {
  // Singleton pattern to ensure a single instance
  static final NetworkInfoPlus _instance = NetworkInfoPlus._internal();
  factory NetworkInfoPlus() => _instance;
  NetworkInfoPlus._internal() {
    _initConnectivity();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<List<ConnectivityResult>>
      _connectivityStreamController =
      StreamController<List<ConnectivityResult>>.broadcast();

  // Stream to listen to connectivity changes
  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivityStreamController.stream;

  // property to check current connectivity status
  Future<bool> get isConnected async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  // property to get current connectivity method
  Future<ConnectivityResult> get getConnectivityMethod async {
    return (await _connectivity.checkConnectivity()).first;
  }

  // Internal method to initialize connectivity listening
  void _initConnectivity() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _connectivityStreamController.add(result);
    });
  }

  // Dispose method to close the stream controller when done
  void dispose() {
    _connectivityStreamController.close();
  }

// void _updateConnectionStatus(List<ConnectivityResult> results) {
//     for (var result in results) {
//       if (result == ConnectivityResult.mobile) {
//         Helper.successSnackBar('Connected');
//       } else if (result == ConnectivityResult.none) {
//         Helper.errorSnackBar( 'You are offline. Please check your internet connection.');
//       } else if (result == ConnectivityResult.wifi) {
//         Helper.successSnackBar('Connected');
//       } else if (result == ConnectivityResult.vpn) {
//         Helper.successSnackBar('Connected');
//       } else {
//         Helper.errorSnackBar( 'You are offline. Please check your internet connection.');
//       }
//     }
//   }
}