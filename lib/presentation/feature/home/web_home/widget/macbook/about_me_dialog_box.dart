import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';

class AboutMeDialogBox extends StatelessWidget {
  // final String title;
  // final String subTitle;

  const AboutMeDialogBox({
    super.key,
    // required this.title,
    // required this.subTitle,
  });

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
          padding: EdgeInsets.all(20.w),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
