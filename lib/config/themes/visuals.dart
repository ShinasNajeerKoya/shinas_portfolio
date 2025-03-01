/// this file is for assets path with base url as constant and rest are concatinated

// ignore_for_file: dangling_library_doc_comments

class AppIcons {
  AppIcons._();

  // static const String blank = "assets/";
  static const String _iconBasePath = "assets/icons";

  static const String kFloralBadgeIcon = '$_iconBasePath/floral_badge.svg';

  static const String kBlankIcon = '$_iconBasePath/blank_icon.svg';
  static const String kAppleLogo = '$_iconBasePath/apple_logo.svg';

  static const String kCancelIcon = '$_iconBasePath/cancel_icon.svg';

  // main layout icons -- mac
  static const String kChromeMacIcon = '$_iconBasePath/mac_chrome_icon.svg';
  static const String kContactMacIcon = '$_iconBasePath/mac_contact_icon.svg';
  static const String kDartMacIcon = '$_iconBasePath/mac_dart_icon.svg';
  static const String kFigmaMacIcon = '$_iconBasePath/mac_figma_icon.svg';
  static const String kFlappyBirdMacIcon = '$_iconBasePath/mac_flappy_bird_icon.svg';
  static const String kFlutterMacIcon = '$_iconBasePath/mac_flutter_icon.svg';
  static const String kGithubMacIcon = '$_iconBasePath/mac_github_icon.svg';
  static const String kLinkedInMacIcon = '$_iconBasePath/mac_linked_in_icon.svg';
  static const String kMailMacIcon = '$_iconBasePath/mac_mail_icon.svg';
  static const String kPhoneMacIcon = '$_iconBasePath/mac_phone_icon.svg';
  static const String kSettingsMacIcon = '$_iconBasePath/mac_settings_icon.svg';
  static const String kWeatherMacIcon = '$_iconBasePath/mac_weather_icon.svg';
  static const String kWebsiteMacIcon = '$_iconBasePath/mac_website_icon.svg';
  static const String kWindowsMacIcon = '$_iconBasePath/mac_windows_icon.svg';
  static const String kResumeMacIcon = '$_iconBasePath/mac_resume_icon.svg';

  ///
// static const String kThemesIcon = '$_iconBasePath/themes.svg';
// static const String kModeIcon = '$_iconBasePath/mode.svg';
// static const String kScrollIcon = '$_iconBasePath/scroll.svg';
// static const String kNotesIcon = '$_iconBasePath/notes.svg';
// static const String kMoreIcon = '$_iconBasePath/more.svg';
//
// static const String kBookmarkIcon = '$_iconBasePath/bookmark.svg';
// static const String kGoalsIcon = '$_iconBasePath/goal.svg';
// static const String kShareIcon = '$_iconBasePath/share.svg';
// static const String kPlayIcon = '$_iconBasePath/play.svg';
// static const String kContinuousPlayIcon = '$_iconBasePath/continuous_play.svg';
// static const String kTafsirIcon = '$_iconBasePath/tafsir.svg';
// static const String kTranslateIcon = '$_iconBasePath/translate.svg';
// static const String kArrowRangeIcon = '$_iconBasePath/arrow_range.svg';
//
// static const String kDescriptionIcon = '$_iconBasePath/description.svg';
// static const String kDeleteIcon = '$_iconBasePath/delete.svg';
// static const String kBookmarkOutline = '$_iconBasePath/bookmark_outline.svg';
// static const String kBookmarkFill = '$_iconBasePath/bookmark_fill.svg';
// static const String kPauseIcon = '$_iconBasePath/pause.svg';
// static const String kPlayPause = '$_iconBasePath/play_pause.svg';
// static const String kDefaultReciter = '$_iconBasePath/default_reciter.svg';
//
// static const String kShareWindows = '$_iconBasePath/share_windows.svg';
// static const String kShareText = '$_iconBasePath/share_text.svg';
// static const String kSharePhoto = '$_iconBasePath/share_photo.svg';
// static const String kShareAudio = '$_iconBasePath/share_audio.svg';
// static const String kShareVideo = '$_iconBasePath/share_video.svg';
//
// static const String kAlignCenter = '$_iconBasePath/align_center.svg';
// static const String kAlignRight = '$_iconBasePath/align_right.svg';
// static const String kAlignLeft = '$_iconBasePath/align_left.svg';
//
// static const String kGallery = '$_iconBasePath/gallery.svg';
// static const String kCamera = '$_iconBasePath/camera.svg';
// static const String kPanZoom = '$_iconBasePath/pan_zoom.svg';
// static const String kDownload = '$_iconBasePath/download.svg';
//
// //app shell icons
// static const String kHomeAppShell = '$_iconBasePath/home.svg';
// static const String kPrayerAppShell = '$_iconBasePath/prayer_time.svg';
// static const String kQiblaAppShell = '$_iconBasePath/qibla.svg';
// static const String kQuranAppShell = '$_iconBasePath/quran.svg';
// static const String kQuranAppShellFilled = '$_iconBasePath/quran_filled.svg';
// static const String kMoreAppShell = '$_iconBasePath/more.svg';
//
// static const String kReadButton = '$_iconBasePath/read_quran.svg';
// static const String kListenButton = '$_iconBasePath/listen_quran.svg';
//
// //adhan time icons
// static const String kGoldImsak = '$_iconBasePath/imsak_gold.svg';
// static const String kGoldFajr = '$_iconBasePath/fajr_gold.svg';
// static const String kGoldSunrise = '$_iconBasePath/sunrise_gold.svg';
// static const String kGoldDhuhr = '$_iconBasePath/duhr_gold.svg';
// static const String kGoldAsr = '$_iconBasePath/asr_gold.svg';
// static const String kGoldMaghrib = '$_iconBasePath/maghrib_gold.svg';
// static const String kGoldIsha = '$_iconBasePath/isha_gold.svg';
//
// static const String kBlueAsr = '$_iconBasePath/asr_blue.svg';
// static const String kBlueDhuhr = '$_iconBasePath/dhur_blue.svg';
// static const String kBlueFajr = '$_iconBasePath/fajr_blue.svg';
// static const String kBlueImsak = '$_iconBasePath/imsak_blue.svg';
// static const String kBlueIsha = '$_iconBasePath/isha_blue.svg';
// static const String kBlueMaghrib = '$_iconBasePath/maghrib_blue.svg';
// static const String kBlueSunrise = '$_iconBasePath/sunrise_blue.svg';
//
// static const String kDarkGoldAsr = '$_iconBasePath/asr_dark_gold.svg';
// static const String kDarkGoldDhuhr = '$_iconBasePath/dhur_dark_gold.svg';
// static const String kDarkGoldFajr = '$_iconBasePath/fajr_dark_gold.svg';
// static const String kDarkGoldImsak = '$_iconBasePath/imsak_dark_gold.svg';
// static const String kDarkGoldIsha = '$_iconBasePath/isha_dark_gold.svg';
// static const String kDarkGoldMaghrib = '$_iconBasePath/maghrib_dark_gold.svg';
// static const String kDarkGoldSunrise = '$_iconBasePath/sunrise_dark_gold.svg';
//
// static const String kDarkWhiteAsr = '$_iconBasePath/asr_dark_white.svg';
// static const String kDarkWhiteDhuhr = '$_iconBasePath/dhur_dark_white.svg';
// static const String kDarkWhiteFajr = '$_iconBasePath/fajr_dark_white.svg';
// static const String kDarkWhiteImsak = '$_iconBasePath/imsak_dark_white.svg';
// static const String kDarkWhiteIsha = '$_iconBasePath/isha_dark_white.svg';
// static const String kDarkWhiteMaghrib = '$_iconBasePath/maghrib_dark_white.svg';
// static const String kDarkWhiteSunrise = '$_iconBasePath/sunrise_dark_white.svg';
//
// static const String kGreenAsr = '$_iconBasePath/asr_green.svg';
// static const String kGreenDhuhr = '$_iconBasePath/dhur_green.svg';
// static const String kGreenFajr = '$_iconBasePath/fajr_green.svg';
// static const String kGreenImsak = '$_iconBasePath/imsak_green.svg';
// static const String kGreenIsha = '$_iconBasePath/isha_green.svg';
// static const String kGreenMaghrib = '$_iconBasePath/maghrib_green.svg';
// static const String kGreenSunrise = '$_iconBasePath/sunrise_green.svg';
//
// static const String kRedAsr = '$_iconBasePath/asr_red.svg';
// static const String kRedDhuhr = '$_iconBasePath/dhur_red.svg';
// static const String kRedFajr = '$_iconBasePath/fajr_red.svg';
// static const String kRedImsak = '$_iconBasePath/imsak_red.svg';
// static const String kRedIsha = '$_iconBasePath/isha_red.svg';
// static const String kRedMaghrib = '$_iconBasePath/maghrib_red.svg';
// static const String kRedSunrise = '$_iconBasePath/sunrise_red.svg';
//
// static const String kCheckCircle = '$_iconBasePath/check_circle.svg';
// static const String kRadioButtonChecked = '$_iconBasePath/radio_button_checked.svg';
// static const String kCalenderMonthIcon = '$_iconBasePath/calendar_month.svg';
// static const String kVibrationIcon = '$_iconBasePath/vibrate.svg';
// static const String kSilentAdhanIcon = '$_iconBasePath/silent.svg';
// static const String kFullAdhanIcon = '$_iconBasePath/full_adhan.svg';
// static const String kTakbeerIcon = '$_iconBasePath/takbeer.svg';
//
// // static const String kCalenderMonthIcon = '$_iconBasePath/calendar_month.svg';
//
// // icons
// static const String kAvatar = '$_iconBasePath/avatar.svg';
// static const String kSearchIcon = '$_iconBasePath/search_icon_new.svg';
// static const String kMic = '$_iconBasePath/mic.svg';
// static const String kMicListening = '$_iconBasePath/mic_listening.svg';
// static const String kClose = '$_iconBasePath/close.svg';
//
// // qibla tab
// static const String kQiblaMapKaabaPointer = '$_iconBasePath/kabah.png';
// static const String kUserCurrentLocationPointer = '$_iconBasePath/you_are_here.png';
//
// // static const String kQiblaMapKaabaPointer = '$_iconBasePath/qibla_map_kaaba.svg';
// // static const String kUserCurrentLocationPointer = '$_iconBasePath/qibla_map_you_are_here.svg';
// static const String kQiblaARRightArrow = '$_iconBasePath/right_arrow.png';
// static const String kQiblaARLeftArrow = '$_iconBasePath/left_arrow.png';
// static const String kMapPegmanIcon = '$_iconBasePath/pegman.svg';
//
// // more tab
// static const String kGlobeIcon = '$_iconBasePath/globe.svg';
// static const String kThemeColorIcon = '$_iconBasePath/colors_theme.svg';
// static const String kAppSettingsIcon = '$_iconBasePath/app_setting_gear.svg';
// static const String kThumbsUpIcon = '$_iconBasePath/thumbs_up.svg';
// static const String kFeedbackSuggestionIcon = '$_iconBasePath/password.svg';
// static const String kAboutIcon = '$_iconBasePath/about.svg';
//
// static const String kTwitterIcon = '$_iconBasePath/twitter_logo.svg';
// static const String kInstagramIcon = '$_iconBasePath/instagram_logo.svg';
// static const String kYoutubeIcon = '$_iconBasePath/youtube_logo.svg';
//
// static const String kSurahDividerIcon = '$_iconBasePath/surah_divider.svg';
// static const String kAboutBackgroundIcon = '$_iconBasePath/about_bg.svg';
//
// static const String kPause = '$_iconBasePath/listen_pause.svg';
// static const String kPlay = '$_iconBasePath/listen_play.svg';
// static const String kVolumeUpFilled = '$_iconBasePath/volume_up_fill.svg';
// static const String kVolumeOffFilled = '$_iconBasePath/volume_off.svg';
// static const String kLoop1 = '$_iconBasePath/loop1.svg';
// static const String kLoop2 = '$_iconBasePath/loop2.svg';
// static const String kLoop3 = '$_iconBasePath/loop3.svg';
// static const String kAcuteClock = '$_iconBasePath/acute_clock.svg';
//
// static const String kGoalsFilterIcon = '$_iconBasePath/filter.svg';
// static const String kPlaylistPlay = '$_iconBasePath/playlist_play.svg';
//
// static const String kGoalsWarning = '$_iconBasePath/goals_warning.svg';
//
// static const String shuffle = '$_iconBasePath/shuffle.svg';
// static const String shuffleOff = '$_iconBasePath/shuffle.svg';
//
// static const String kSurahTitleBackground = '$_iconBasePath/surah_title_background.svg';
// static const String kBook = '$_iconBasePath/center_book.svg';
//
// static const String kAppLogoIcon = '$_iconBasePath/app_logo_icon.png';
//
// static const String kLeftArrowHead = '$_iconBasePath/left_arrow_head.svg';
// static const String kRightArrowHead = '$_iconBasePath/right_arrow_head.svg';
//
// static const String kFastForwardIcon = '$_iconBasePath/fast_forward.svg';
// static const String kFastRewindIcon = '$_iconBasePath/fast_rewind.svg';
//
// static const String kLeftChevronIcon = '$_iconBasePath/left_chevron.svg';
// static const String kRightChevronIcon = '$_iconBasePath/right_chevron.svg';
//
// static const String kCancelIcon = '$_iconBasePath/cancel.svg';
//
// static const String kRefreshIcon = '$_iconBasePath/refresh.svg';
// static const String kCompassCalibrationIcon = '$_iconBasePath/compass_calibration.svg';
//
// static const String kBeepIcon = '$_iconBasePath/beep.svg';

// static const String kSelected = '$_iconBasePath/selected.svg';
// static const String kCompany = '$_iconBasePath/company.svg';
// static const String kUser = '$_iconBasePath/user.svg';
// static const String kCamera = '$_iconBasePath/camera.svg';
// static const String kGallery = '$_iconBasePath/gallery.svg';
// static const String kPencil = '$_iconBasePath/pencil.svg';
// static const String kSignOut = '$_iconBasePath/sign_out.svg';
// static const String kHomeDrawer = '$_iconBasePath/home_drawer.svg';
// static const String kHome = '$_iconBasePath/home.svg';
// static const String kCalendar = '$_iconBasePath/calendar.svg';
// static const String kProject = '$_iconBasePath/project.svg';
// static const String kReport = '$_iconBasePath/report.svg';
// static const String kEmployees = '$_iconBasePath/employees.svg';
}

class AppImages {
  AppImages._();

  static const String _imageBasePath = 'assets/images';

  static const String kMacOsBg = '$_imageBasePath/mac_os_bg.jpg';
  static const String kWindowsOsBg = '$_imageBasePath/windows_11_bg.jpeg';

  ///
  ///
  ///
//   static const String _shareImageBasePath = '$_imageBasePath/share';
//
//   // static const String kLogo = '$_imageBasePath/logo.png';
//   static const String kMakkahBackground = '$_imageBasePath/makkah_bg.svg';
//
//   //
//   static const String kSplashBg = '$_imageBasePath/splash/splash_bg.png';
//   static const String kSplashBook = '$_imageBasePath/splash/splash_book.png';
//   static const String kSplashLogo = '$_imageBasePath/splash/splash_logo.png';
//   static const String kAppLogo = '$_imageBasePath/splash/app_logo.png';
//
//   static const String kShareImage1 = '$_shareImageBasePath/share_image_1.png';
//   static const String kShareImage2 = '$_shareImageBasePath/share_image_2.png';
//   static const String kShareImage3 = '$_shareImageBasePath/share_image_3.png';
//   static const String kShareImage4 = '$_shareImageBasePath/share_image_4.png';
//
// //
// // home screen
//
//   // qibla screen
//   static const String kQiblaKaabaGrey = '$_imageBasePath/black_kaaba.png';
//   static const String kQiblaKaaba = '$_imageBasePath/kaaba.png';
//   static const String kQiblaCompass = '$_imageBasePath/compass_v3.svg';
//
//   static const String kGoldCompassPointer = '$_imageBasePath/pointer_gold.svg';
//   static const String kDarkGoldCompassPointer = '$_imageBasePath/pointer_dark_gold.svg';
//   static const String kDarkWhiteCompassPointer = '$_imageBasePath/pointer_dark_white.svg';
//   static const String kRedCompassPointer = '$_imageBasePath/pointer_red.svg';
//   static const String kBlueCompassPointer = '$_imageBasePath/pointer_blue.svg';
//   static const String kGreenCompassPointer = '$_imageBasePath/pointer_green.svg';
//
//   static const String kGoldEnglishKaabaIcon = '$_imageBasePath/gold_kaaba.png';
//   static const String kDarkGoldEnglishKaabaIcon = '$_imageBasePath/dark_gold_kaaba.png';
//   static const String kDarkWhiteEnglishKaabaIcon = '$_imageBasePath/dark_white_kaaba.png';
//   static const String kRedEnglishKaabaIcon = '$_imageBasePath/red_kaaba.png';
//   static const String kBlueEnglishKaabaIcon = '$_imageBasePath/blue_kaaba.png';
//   static const String kGreenEnglishKaabaIcon = '$_imageBasePath/green_kaaba.png';
//
//   static const String kGoldArabicKaabaIcon = '$_imageBasePath/gold_kaaba_arabic.png';
//   static const String kDarkGoldArabicKaabaIcon = '$_imageBasePath/dark_gold_kaaba_arabic.png';
//   static const String kDarkWhiteArabicKaabaIcon = '$_imageBasePath/dark_white_kaaba_arabic.png';
//   static const String kRedArabicKaabaIcon = '$_imageBasePath/red_kaaba_arabic.png';
//   static const String kBlueArabicKaabaIcon = '$_imageBasePath/blue_kaaba_arabic.png';
//   static const String kGreenArabicKaabaIcon = '$_imageBasePath/green_kaaba_arabic.png';
//
//   static const String kGoldEnglishCurrentLocationIcon = '$_imageBasePath/gold_current_location.png';
//   static const String kDarkGoldEnglishCurrentLocationIcon = '$_imageBasePath/dark_gold_current_location.png';
//   static const String kDarkWhiteEnglishCurrentLocationIcon = '$_imageBasePath/dark_white_current_location'
//       '.png';
//   static const String kRedEnglishCurrentLocationIcon = '$_imageBasePath/red_current_location.png';
//   static const String kBlueEnglishCurrentLocationIcon = '$_imageBasePath/blue_current_location.png';
//   static const String kGreenEnglishCurrentLocationIcon = '$_imageBasePath/green_current_location.png';
//
//   static const String kGoldArabicCurrentLocationIcon = '$_imageBasePath/gold_current_location_arabic.png';
//   static const String kDarkGoldArabicCurrentLocationIcon =
//       '$_imageBasePath/dark_gold_current_location_arabic.png';
//   static const String kDarkWhiteArabicCurrentLocationIcon =
//       '$_imageBasePath/dark_white_current_location_arabic.png';
//   static const String kRedArabicCurrentLocationIcon = '$_imageBasePath/red_current_location_arabic.png';
//   static const String kBlueArabicCurrentLocationIcon = '$_imageBasePath/blue_current_location_arabic.png';
//   static const String kGreenArabicCurrentLocationIcon = '$_imageBasePath/green_current_location_arabic.png';
//
//   static const String kRedAsrImage = '$_imageBasePath/red_asr.png';
//   static const String kRedDhuhrImage = '$_imageBasePath/red_dhuhr.png';
//   static const String kRedFajrImage = '$_imageBasePath/red_fajr.png';
//   static const String kRedImsakImage = '$_imageBasePath/red_imsak.png';
//   static const String kRedIshaImage = '$_imageBasePath/red_isha.png';
//   static const String kRedMaghribImage = '$_imageBasePath/red_maghrib.png';
//   static const String kRedSunriseImage = '$_imageBasePath/red_sunrise.png';
//
//   static const String kBlueAsrImage = '$_imageBasePath/blue_asr.png';
//   static const String kBlueDhuhrImage = '$_imageBasePath/blue_dhuhr.png';
//   static const String kBlueFajrImage = '$_imageBasePath/blue_fajr.png';
//   static const String kBlueImsakImage = '$_imageBasePath/blue_imsak.png';
//   static const String kBlueIshaImage = '$_imageBasePath/blue_isha.png';
//   static const String kBlueMaghribImage = '$_imageBasePath/blue_maghrib.png';
//   static const String kBlueSunriseImage = '$_imageBasePath/blue_sunrise.png';
//
//   static const String kGreenAsrImage = '$_imageBasePath/green_asr.png';
//   static const String kGreenDhuhrImage = '$_imageBasePath/green_dhuhr.png';
//   static const String kGreenFajrImage = '$_imageBasePath/green_fajr.png';
//   static const String kGreenImsakImage = '$_imageBasePath/green_imsak.png';
//   static const String kGreenIshaImage = '$_imageBasePath/green_isha.png';
//   static const String kGreenMaghribImage = '$_imageBasePath/green_maghrib.png';
//   static const String kGreenSunriseImage = '$_imageBasePath/green_sunrise.png';
//
//   static const String kDarkGoldAsrImage = '$_imageBasePath/dark_gold_asr.png';
//   static const String kDarkGoldDhuhrImage = '$_imageBasePath/dark_gold_dhuhr.png';
//   static const String kDarkGoldFajrImage = '$_imageBasePath/dark_gold_fajr.png';
//   static const String kDarkGoldImsakImage = '$_imageBasePath/dark_gold_imsak.png';
//   static const String kDarkGoldIshaImage = '$_imageBasePath/dark_gold_isha.png';
//   static const String kDarkGoldMaghribImage = '$_imageBasePath/dark_gold_maghrib.png';
//   static const String kDarkGoldSunriseImage = '$_imageBasePath/dark_gold_sunrise.png';
//
//   static const String kDarkWhiteAsrImage = '$_imageBasePath/dark_white_asr.png';
//   static const String kDarkWhiteDhuhrImage = '$_imageBasePath/dark_white_dhuhr.png';
//   static const String kDarkWhiteFajrImage = '$_imageBasePath/dark_white_fajr.png';
//   static const String kDarkWhiteImsakImage = '$_imageBasePath/dark_white_imsak.png';
//   static const String kDarkWhiteIshaImage = '$_imageBasePath/dark_white_isha.png';
//   static const String kDarkWhiteMaghribImage = '$_imageBasePath/dark_white_maghrib.png';
//   static const String kDarkWhiteSunriseImage = '$_imageBasePath/dark_white_sunrise.png';
//
//   static const String kGoldAsrImage = '$_imageBasePath/gold_asr.png';
//   static const String kGoldDhuhrImage = '$_imageBasePath/gold_dhuhr.png';
//   static const String kGoldFajrImage = '$_imageBasePath/gold_fajr.png';
//   static const String kGoldImsakImage = '$_imageBasePath/gold_imsak.png';
//   static const String kGoldIshaImage = '$_imageBasePath/gold_isha.png';
//   static const String kGoldMaghribImage = '$_imageBasePath/gold_maghrib.png';
//   static const String kGoldSunriseImage = '$_imageBasePath/gold_sunrise.png';
//
//   static const String k0x5x = '$_imageBasePath/0.5X.svg';
//   static const String k0x75x = '$_imageBasePath/0.75X.svg';
//   static const String k1x = '$_imageBasePath/1.0x.svg';
//
//   static const String k1x25x = '$_imageBasePath/1.25X.svg';
//   static const String k1x5x = '$_imageBasePath/1.5X.svg';
//
//   static const String k1x75x = '$_imageBasePath/1.75X.svg';
//   static const String k2x = '$_imageBasePath/2.0x.svg';
//
//   static const String kDividerListenQuran = '$_imageBasePath/divider_play_quran.svg';
//   static const String kCalibration = '$_imageBasePath/calibration.png';
}

class AppAnimation {
  AppAnimation._();

  static const String _gifBasePath = "assets/gif";

  static const String kNullGif = _gifBasePath;

//
// static const String kLoaderGif = '$_gifBasePath/loader.gif';
// static const String kLoader1Gif = '$_gifBasePath/loader_1.gif';
}

class AppRiveAnimation {
  AppRiveAnimation._();

  static const String _riveBasePath = "assets/rive";
  static const String kNullRive = _riveBasePath;

// static const String kLoaderRive = '$_riveBasePath/loader.riv';
}

class QuranFrameImage {
  QuranFrameImage._();

  static const String _imageBasePath = "assets/images/frame";

  // static const String kThickSide = '$_imageBasePath/frame1_side.png';
  // static const String kThickTop = '$_imageBasePath/frame1_top.png';
  // static const String kThickBottom = '$_imageBasePath/frame1_bottom.png';
  //
  // static const String kThinSide = '$_imageBasePath/frame2_side.png';
  // static const String kThinTop = '$_imageBasePath/frame2_top.png';
  // static const String kThinBottom = '$_imageBasePath/frame2_bottom.png';

  static const String kThickSide = '$_imageBasePath/Thick_Frame_Left.png';
  static const String kThickTop = '$_imageBasePath/Thick_Frame_Top.png';
  static const String kThickBottom = '$_imageBasePath/Thick_Frame_Bottom.png';

  static const String kThinSide = '$_imageBasePath/Thin_Frame_Left.png';
  static const String kThinTop = '$_imageBasePath/Thin_Frame_Top.png';
  static const String kThinBottom = '$_imageBasePath/Thin_Frame_Bottom.png';

  static const String kSurahHeaderBackground = '$_imageBasePath/Surah_Header.svg';
  static const String kSurahHeaderBackground80 = '$_imageBasePath/Surah_Header_80.svg';
  static const String kSurahHeaderBackground90 = '$_imageBasePath/Surah_Header_90.svg';
  static const String kSurahHeaderBackground100 = '$_imageBasePath/Surah_Header_100.svg';
}
