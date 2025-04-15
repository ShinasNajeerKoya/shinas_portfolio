import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/config/bloc/bloc_provider.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/web_home_page.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';

class WebSplashPage extends StatefulWidget {
  const WebSplashPage({super.key});

  @override
  State<WebSplashPage> createState() => _WebSplashPageState();
}
//
// class _WebSplashPageState extends State<WebSplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       if (!mounted) return;
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) => Provider<WebHomeBloc>(
//                   create: (context) => provideWebHomeBloc(),
//                   dispose: (context, bloc) => bloc.dispose(),
//                   child: const WebHomePage(),
//                 )),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CustomSvgIcon(height: 50, AppIcons.kSplashAppleIcon),
//       ),
//     );
//   }
// }

class _WebSplashPageState extends State<WebSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        _fadeTransitionRoute(
          Provider<WebHomeBloc>(
            create: (context) => provideWebHomeBloc(),
            dispose: (context, bloc) => bloc.dispose(),
            child: const WebHomePage(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CustomSvgIcon(height: 100, AppIcons.kSplashAppleIcon),
      ),
    );
  }

  /// Creates a fade transition route
  PageRouteBuilder _fadeTransitionRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500), // Adjust duration as needed
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
