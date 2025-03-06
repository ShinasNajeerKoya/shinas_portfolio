import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/extensions/string_extensions.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/generated/locale_keys.g.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_dialog_app_bar.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/project_title_widget.dart';

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
              verticalMargin6,

              /// **App bar section**
              MacDialogAppBar(
                bloc: bloc,
                title: '',
                titlePadding: 52,
              ),
              verticalMargin6,
              // const Spacer(),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomText('Projects will be updated here soon.'),
              //   ],
              // ),
              // const Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      ProjectTitleWidget(
                        title: LocaleKeys.featured.toLocalizeString,
                      ),
                      Container(
                        height: 250,
                        // color: Colors.yellow.withOpacity(0.2),
                        child: Row(
                          children: [
                            // Left child - Column
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  CustomText(
                                    "Project Title Here",
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 4),
                                  CustomText(
                                    "Category",
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontColor: Colors.white.withOpacity(0.6),
                                  ),
                                  SizedBox(height: 16),
                                  CustomText(
                                    "Brief Info on app",
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    fontColor: Colors.white,
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                    child: CustomText(
                                      "See more",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontColor: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            // Right child - Image with fade effect
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.white,
                                        Colors.transparent,
                                      ],
                                      stops: [0.0, 0.7],
                                    ).createShader(bounds);
                                  },
                                  blendMode: BlendMode.dstIn, // Applies the fade effect
                                  child: Image.asset(
                                    AppImages.kMacOsBg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
