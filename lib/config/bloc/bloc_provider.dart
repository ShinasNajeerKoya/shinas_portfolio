import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/splash/bloc/splash_page_bloc.dart';

// AppBloc provideAppBloc() {
//   return AppBloc();
// }

SplashPageBloc provideSplashPageBloc() {
  return SplashPageBloc();
}

WebHomeBloc provideWebHomeBloc() {
  // return SplashBloc(locationRepository: provideLocationRepository());
  return WebHomeBloc(
      // locationRepository: provideLocationRepository(),
      // notificationRepository: provideNotificationRepository(),
      );
}
