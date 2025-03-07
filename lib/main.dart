import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shinas_koya_portfolio/config/constants/hive_constants/hive_constant_keys.dart';
import 'package:shinas_koya_portfolio/core/hive_adapters/hive_adapters.dart';
import 'package:shinas_koya_portfolio/data/dao/project_metadata/project_metadata.dart';
import 'package:shinas_koya_portfolio/data/service/project_service/project_service.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  await registerHiveAdapters();

  await Hive.openBox<ProjectMetadata>(HiveConstantKeys.projectsBox); // Open Box

  final projectService = ProjectService();
  await projectService.loadJsonToHive();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('kn'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
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
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

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
