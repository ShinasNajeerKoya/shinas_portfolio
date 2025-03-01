import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/config/bloc/bloc_provider.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/web_home_page.dart';

class MobileSplashPage extends StatefulWidget {
  const MobileSplashPage({super.key});

  @override
  State<MobileSplashPage> createState() => _MobileSplashPageState();
}

class _MobileSplashPageState extends State<MobileSplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) =>
      //           Provider<WebHomeBloc>(
      //             create: (context) => provideWebHomeBloc(),
      //             dispose: (context, bloc) => bloc.dispose(),
      //             child: const WebHomePage(),
      //           )),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to My App -- mobile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
