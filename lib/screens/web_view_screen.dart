// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tmconnect/constants/app_constants.dart';
// import 'package:tmconnect/theme/app_colors.dart';
// import 'package:tmconnect/theme/app_text_style.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   const WebViewScreen({super.key, required this.url});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (url) {
//             print("🔄 Loading URL: $url");
//           },
//           onPageFinished: (url) {
//             print("✅ Page loaded: $url");
//           },
//           onWebResourceError: (error) {
//             print("❌ WebView error: ${error.description}");
//           },
//         ),
//       )
//       ..setUserAgent(
//         'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: AppColors.primaryColor,
//           title: Text(
//             AppConstants.appName,
//             style: AppTextStyle(fontSize: 20.sp, color: AppColors.white),
//           )),
//       body: SafeArea(
//         child: WebViewWidget(controller: _controller),
//       ),
//     );
//   }
// }
