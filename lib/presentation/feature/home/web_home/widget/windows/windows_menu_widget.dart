import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class WindowsMenuWidget extends StatelessWidget {
  final WebHomeBloc? bloc;

  const WindowsMenuWidget({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: WillPopScope(
        onWillPop: () async {
          // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
          return true;
        },
        child: Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: SingleChildScrollView(
            // padding: EdgeInsets.zero,
            child: Container(
              height: 100.h,
              width: 300.w,
              padding: horizontalPadding8,
              decoration: BoxDecoration(
                color: AppColors.kMacPrimaryDarkColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppColors.kMacPrimaryDarkFontColor.withOpacity(0.5),
                  width: 0.1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Adjust shadow color and opacity
                    blurRadius: 10.r, // Controls the softness of the shadow
                    spreadRadius: 4.r, // How far the shadow spreads
                    offset: const Offset(2, 4), // Position of the shadow (X, Y)
                  ),
                ],
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalMargin4,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText('windows hahah'),
                    ],
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
