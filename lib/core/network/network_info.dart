// import 'dart:async';

// import 'package:internet_connection_checker/internet_connection_checker.dart';

// /// NetworkInfoImpl is a class that provides network-related information and events.
// ///
// /// It uses the InternetConnectionChecker library to determine the device's
// /// internet connectivity status and provides a stream to listen for changes
// /// in the connection status.
// class NetworkInfo {
//   /// The InternetConnectionChecker instance used to check connectivity.
//   final InternetConnectionChecker _connectionChecker =
//       InternetConnectionChecker();

//   /// A private static instance of the NetworkInfoImpl class.
//   static NetworkInfo? _instance;

//   /// Private constructor for NetworkInfoImpl.
//   ///
//   /// The constructor initializes the onStatusChange method.
//   NetworkInfo._() {
//     _onStatusChange();
//   }

//   /// Factory constructor for NetworkInfoImpl.
//   ///
//   /// Returns the existing instance of NetworkInfoImpl if it exists,
//   /// or creates a new instance if one doesn't exist.
//   factory NetworkInfo() {
//     _instance ??= NetworkInfo._();
//     return _instance!;
//   }

//   Future<bool> get isConnected => _connectionChecker.hasConnection;
//   // Future<bool> get isConnected => Future.value(true);

//   /// A StreamController to manage the stream of network status changes.
//   final StreamController<bool> _statusController =
//       StreamController<bool>.broadcast();

//   /// A stream to listen for internet connection status changes.
//   ///
//   /// Returns:
//   ///
//   /// - `true` on internet connection.
//   ///
//   /// - `false` on internet disconnection.
//   Stream<bool> get onStatusChanged => _statusController.stream;

//   // ...

//   /// Listens for internet connection status changes and notifies the stream.
//   void _onStatusChange() async {
//     _connectionChecker.onStatusChange.listen((event) async {
//       if (event == InternetConnectionStatus.connected) {
//         _statusController.add(true); // Notify connected
//       } else {
//         _statusController.add(false); // Notify disconnected
//       }
//     });
//   }

//   /// Closes the stream controller when it is no longer needed.
//   void dispose() {
//     _statusController.close();
//   }
// }

// // import 'dart:async';

// // import 'package:internet_connection_checker/internet_connection_checker.dart';

// // class NetworkInfo {
// //   final InternetConnectionChecker _connectionChecker = InternetConnectionChecker();

// //   static NetworkInfo? _instance;

// //   NetworkInfo._() {
// //     _onStatusChange();
// //   }

// //   factory NetworkInfo() {
// //     _instance ??= NetworkInfo._();
// //     return _instance!;
// //   }

// //   Future<bool> get isConnected => _connectionChecker.hasConnection;

// //   final StreamController<bool> _statusController = StreamController<bool>.broadcast();

// //   Stream<bool> get onStatusChanged => _statusController.stream;

// //   void _onStatusChange() async {
// //     _connectionChecker.onStatusChange.listen((event) async {
// //       if (event == InternetConnectionStatus.connected) {
// //         _statusController.add(true); // Notify connected
// //       } else {
// //         _statusController.add(false); // Notify disconnected
// //       }
// //     });
// //   }

// //   void dispose() {
// //     _statusController.close();
// //   }
// // }
