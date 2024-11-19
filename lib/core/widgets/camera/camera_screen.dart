// // import 'package:better_open_file/better_open_file.dart';

// // void main() {
// //   runApp(const CameraAwesomeApp());
// // }

// // class CameraAwesomeApp extends StatelessWidget {
// //   const CameraAwesomeApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return const MaterialApp(
// //       title: 'camerAwesome',
// //       home: CameraPage(),
// //     );
// //   }
// // }

// import 'dart:io';

// import 'package:better_open_file/better_open_file.dart';
// import 'package:icar/core/shared/camera_preview_screen.dart';

// import 'package:cross_file/cross_file.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// class CameraPage extends StatelessWidget {
//   const CameraPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: CameraAwesomeBuilder.awesome(
//           onMediaCaptureEvent: (event) {
//             switch ((event.status, event.isPicture, event.isVideo)) {
//               case (MediaCaptureStatus.capturing, true, false):
//                 debugPrint('Capturing picture...');
//               case (MediaCaptureStatus.success, true, false):
//                 event.captureRequest.when(
//                   single: (single) {
//                     debugPrint('Picture saved: ${single.file?.path}');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CameraPreviewScreen(
//                           filePath: single.file!.path,
//                           isVideo: true,
//                           onConfirm: (updatedPath) {
//                             Navigator.pop(context);
//                           },
//                           onRetake: () {
//                             Navigator.pop(context);
//                           },
//                           onSend: () {
//                             // Handle send functionality
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   multiple: (multiple) {
//                     multiple.fileBySensor.forEach((key, value) {
//                       debugPrint('multiple image taken: $key ${value?.path}');
//                     });
//                   },
//                 );
//               case (MediaCaptureStatus.failure, true, false):
//                 debugPrint('Failed to capture picture: ${event.exception}');
//               case (MediaCaptureStatus.capturing, false, true):
//                 debugPrint('Capturing video...');
//               case (MediaCaptureStatus.success, false, true):
//                 event.captureRequest.when(
//                   single: (single) {
//                     debugPrint('Video saved: ${single.file?.path}');
//                   },
//                   multiple: (multiple) {
//                     multiple.fileBySensor.forEach((key, value) {
//                       debugPrint('multiple video taken: $key ${value?.path}');
//                     });
//                   },
//                 );
//               case (MediaCaptureStatus.failure, false, true):
//                 debugPrint('Failed to capture video: ${event.exception}');
//               default:
//                 debugPrint('Unknown event: $event');
//             }
//           },
//           saveConfig: SaveConfig.photoAndVideo(
//             mirrorFrontCamera: true,
//             initialCaptureMode: CaptureMode.photo,
//             photoPathBuilder: (sensors) async {
//               final Directory extDir = await getTemporaryDirectory();
//               final testDir = await Directory(
//                 '${extDir.path}/camerawesome',
//               ).create(recursive: true);
//               if (sensors.length == 1) {
//                 final String filePath =
//                     '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//                 return SingleCaptureRequest(filePath, sensors.first);
//               }
//               // Separate pictures taken with front and back camera
//               return MultipleCaptureRequest(
//                 {
//                   for (final sensor in sensors)
//                     sensor:
//                         '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
//                 },
//               );
//             },
//             videoOptions: VideoOptions(
//               enableAudio: true,
//               ios: CupertinoVideoOptions(
//                 fps: 10,
//               ),
//               android: AndroidVideoOptions(
//                 bitrate: 6000000,
//                 fallbackStrategy: QualityFallbackStrategy.lower,
//               ),
//             ),
//             exifPreferences: ExifPreferences(saveGPSLocation: true),
//           ),
//           sensorConfig: SensorConfig.single(
//             sensor: Sensor.position(SensorPosition.back),
//             flashMode: FlashMode.auto,
//             aspectRatio: CameraAspectRatios.ratio_4_3,
//             zoom: 0.0,
//           ),
//           enablePhysicalButton: true,
//           // filter: AwesomeFilter.AddictiveRed,
//           previewAlignment: Alignment.center,

//           // onMediaTap: (mediaCapture) {
//           //   mediaCapture.captureRequest.when(
//           //     single: (single) {
//           //       debugPrint('single: ${single.file?.path}');
//           //       single.file?.open();
//           //     },
//           //     multiple: (multiple) {
//           //       multiple.fileBySensor.forEach((key, value) {
//           //         debugPrint('multiple file taken: $key ${value?.path}');
//           //         value?.open();
//           //       });
//           //     },
//           //   );
//           // },

//           availableFilters: awesomePresetFiltersList,
//         ),
//       ),
//     );
//   }
// }
