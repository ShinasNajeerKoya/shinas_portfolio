import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  // Manually register the plugin for web

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      // Hide the default debug banner
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(844, 390),
          minTextAdapt: true,
          splitScreenMode: true,
        );

        return Banner(
          message: "Development",
          location: BannerLocation.topEnd,
          color: Colors.green,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Colors.white,
          ),
          child: child ?? const HomePage(),
        );
      },
      home: const HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Widget homeScreen;
//
//     if (kIsWeb) {
//       // Web (Default: MacBook UI)
//       homeScreen = const MacBookHomeScreen();
//     } else if (Platform.isMacOS) {
//       // macOS
//       homeScreen = const MacBookHomeScreen();
//     } else if (Platform.isWindows) {
//       // Windows
//       homeScreen = const WindowsHomeScreen();
//     } else if (Platform.isIOS) {
//       // iOS
//       homeScreen = const IosScreen();
//     } else if (Platform.isAndroid) {
//       // iOS
//       homeScreen = const AndroidScreen();
//     } else {
//       // Default Fallback (Android / Other platforms)
//       homeScreen = const MacBookHomeScreen();
//     }
//
//     return Scaffold(
//       body: homeScreen,
//     );
//   }
// }
