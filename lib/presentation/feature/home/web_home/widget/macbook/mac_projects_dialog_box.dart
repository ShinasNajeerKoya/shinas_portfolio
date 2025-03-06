import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_dialog_app_bar.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_divider.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class MacProjectsDialogBox extends StatelessWidget {
  final WebHomeBloc? bloc;

  const MacProjectsDialogBox({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
        return false;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Container(
          height: 320.h,
          width: 700.w,
          padding: horizontalPadding8,
          decoration: BoxDecoration(
            color: AppColors.kMacPrimaryDarkColor,
            borderRadius: BorderRadius.circular(5.r),
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

              /// **App bar section**
              MacDialogAppBar(
                bloc: bloc,
                title: '',
                titlePadding: 52,
              ),
              verticalMargin4,
              // const Spacer(),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomText('Projects will be updated here soon.'),
              //   ],
              // ),
              // const Spacer(),
              Expanded(
                child: ListView(
                  children: [
                    ProjectTitleWidget(
                      title: LocaleKeys.featured.toLocalizeString,
                    ),
                    Container(
                      height: 300,
                      color: Colors.yellow,
                    ),
                    ProjectTitleWidget(
                      title: LocaleKeys.myProjects.toLocalizeString,
                    ),
                    Container(
                      height: 200,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 200,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 200,
                      color: Colors.green,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectTitleWidget extends StatelessWidget {
  final String title;

  const ProjectTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            title,
            fontSize: 30,
          ),
          const CustomDivider(horizontalPaddingValue: 0),
        ],
      ),
    );
  }
}
