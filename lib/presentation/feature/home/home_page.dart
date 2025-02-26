import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/config/bloc/bloc_provider.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/mobile/mobile_home_screen.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/web_home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget homeScreen;

    if (kIsWeb || Platform.isMacOS || Platform.isWindows) {
      homeScreen = Provider<WebHomeBloc>(
        create: (context) => provideWebHomeBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        child: const WebHomeScreen(),
      ); // Web Layout
    } else {
      homeScreen = const MobileHomeScreen(); // Mobile Layout
    }

    return homeScreen;
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:shinas_koya_portfolio/presentation/feature/home/web/web_home_screen.dart';
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
