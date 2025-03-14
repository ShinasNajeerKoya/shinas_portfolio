import 'dart:html' as html;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/mobile/mobile_home_screen.dart';
import 'package:shinas_koya_portfolio/presentation/feature/splash/web_splash_page.dart';

bool isMobileWeb() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();
  return userAgent.contains("android") || userAgent.contains("iphone") || userAgent.contains("ipad");
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget homeScreen;
    //
    // if (kIsWeb || Platform.isMacOS || Platform.isWindows) {
    //   homeScreen = const WebSplashPage(); // Web Layout
    //   // homeScreen = Provider<WebHomeBloc>(
    //   //   create: (context) => provideWebHomeBloc(),
    //   //   dispose: (context, bloc) => bloc.dispose(),
    //   //   child: const WebHomePage(),
    //   // ); // Web Layout
    // } else {
    //   homeScreen = const MobileHomeScreen(); // Mobile Layout
    //
    //   // homeScreen = const WebSplashPage();
    // }
    //
    // return homeScreen;

    if (kIsWeb) {
      if (isMobileWeb()) {
        return const MobileHomeScreen(); // Show mobile layout for mobile browsers
      } else {
        return const WebSplashPage(); // Show desktop layout for desktop browsers
      }
    }
    
    // For non-web platforms (Native Android, iOS, Windows, MacOS)
    if (Platform.isMacOS || Platform.isWindows) {
      return const WebSplashPage();
    } else {
      return const MobileHomeScreen();
    }
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:shinas_koya_portfolio/presentation/feature/home/web/mac_home_screen.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isPortrait = screenSize.height > screenSize.width; // Detect portrait mode
//
//     return ScreenTypeLayout.builder(
//       mobile: (context) => const WebHomeScreen(), // For phones & small screens
//       tablet: (context) => const WebHomeScreen(), // For tablets
//       desktop: (context) {
//         if (kIsWeb && isPortrait) {
//           // return const MobileHomeScreen(); // Show mobile layout in portrait mode
//           return const WebHomeScreen(); // Show mobile layout in portrait mode
//         }
//         return const WebHomeScreen(); // Default web layout
//       },
//     );
//   }
// }
