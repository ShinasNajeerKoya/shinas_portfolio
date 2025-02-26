
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';

// AppBloc provideAppBloc() {
//   return AppBloc();
// }

WebHomeBloc provideWebHomeBloc() {
  // return SplashBloc(locationRepository: provideLocationRepository());
  return WebHomeBloc(
    // locationRepository: provideLocationRepository(),
    // notificationRepository: provideNotificationRepository(),
  );
}