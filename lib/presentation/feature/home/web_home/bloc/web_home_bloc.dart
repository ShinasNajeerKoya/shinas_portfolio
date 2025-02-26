
import 'package:rxdart/rxdart.dart';

class WebHomeBloc {
  // final LocationRepository locationRepository;
  // final NotificationRepository notificationRepository;

  final splashSubject = BehaviorSubject<String>();
  final permissionDeniedSubject = BehaviorSubject<bool>.seeded(false);

  ///
  final isMacPlatform = BehaviorSubject<bool>.seeded(true);

  WebHomeBloc(
  ) {
    // initDetails();
  }


  void togglePlatform() {
    isMacPlatform.add(!isMacPlatform.value);
  }

  void dispose() {
    splashSubject.close();
    permissionDeniedSubject.close();
  }
}
