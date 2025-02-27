import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_os_button.dart';

class AboutMeDialogBox extends StatefulWidget {
  // final String title;
  // final String subTitle;

  const AboutMeDialogBox({
    super.key,
    // required this.title,
    // required this.subTitle,
  });

  @override
  State<AboutMeDialogBox> createState() => _AboutMeDialogBoxState();
}

class _AboutMeDialogBoxState extends State<AboutMeDialogBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
        return true;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Container(
          height: 200.h,
          width: 200.w,
          padding: horizontalPadding8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.w,
            ),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              verticalMargin2,

              MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: SizedBox(
                  height: 16,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      MacOSButton(
                          onTap: () => Navigator.of(context).pop(),
                          color: Colors.red,
                          icon: AppIcons.kCancelIcon,
                          iconColor: Colors.black,
                          isHovered: _isHovered),
                      horizontalMargin2,
                      MacOSButton(color: Colors.yellow, isHovered: _isHovered),
                      horizontalMargin2,
                      MacOSButton(color: Colors.green, isHovered: _isHovered),
                    ],
                  ),
                ),
              ),
              verticalMargin4,
              Text(
                'title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 16.sp,
                ),
              ),
              // SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
                },
                child: Text(
                  'subTitle',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
