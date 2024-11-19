// import 'package:icar/config/app_colors.dart';
// import 'package:icar/core/widgets/top_bar.dart';
// import 'package:icar/utils/app_utils.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';


// class WebSheetScreen extends StatefulWidget {
//   final String title;
//   final String url;

//   const WebSheetScreen({required this.title, required this.url, super.key});

//   @override
//   State<WebSheetScreen> createState() => _WebSheetScreenState();
// }

// class _WebSheetScreenState extends State<WebSheetScreen> {
//   bool isLoading = true;
//   WebViewController? controller;

//   @override
//   void initState() {
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {
//             if (isLoading) {
//               isLoading = false;
//               if (mounted) {
//                 setState(() {});
//               }
//             }
//           },
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//       // ..loadRequest(Uri.parse('https://flutter.dev'));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//       AppUtils.changStatusBar(StatusBarStyle.white);
//     return Container(
//       color: CColors.white,
//       child: Column(
//         children: [
//           TopBarForInView(
//             title: widget.title,
//             backIcon: Icons.close_rounded,
//             child: isLoading
//                 ? const CupertinoActivityIndicator(
//                     color: CColors.white,
//                   )
//                 : null,
//           ),
//           Expanded(
//             child: SafeArea(
//               top: false,
//               child: WebViewWidget(
//                 controller: controller!,
//                 gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
//                   ..add(
//                     Factory<VerticalDragGestureRecognizer>(
//                       () => VerticalDragGestureRecognizer(),
//                     ), // or null
//                   )
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
