import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/constants/details_constants.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
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
          backgroundColor: Colors.black.withOpacity(0.2),
          child: CustomBackdropFilter(
            height: 200,
            width: 450,
            borderRadius: 25,
            border: Border.all(color: Colors.transparent),

            // padding: horizontalPadding8,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalMargin4,
                Expanded(
                  child: Container(
                    // height: 60,
                    // height: 110,
                    // width: double.maxFinite,
                    color: Colors.yellow,
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [],
                    // ),
                  ),
                ),
                const Spacer(),

                CustomBackdropFilter(
                  height: 60,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: Colors.black.withOpacity(0.3),
                  border: Border.all(color: Colors.transparent),
                  borderRadius: 0,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(AppImages.kMacOsBg),
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            DetailsConstantValues.name,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            DetailsConstantValues.jobRole,
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                            fontColor: Colors.grey,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          log('see more tapped');
                        },
                        child: Container(
                          height: 25,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D244D),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const CustomText(
                            'See more',
                            fontSize: 12,
                            fontColor: Color(0xFFD1E3FF),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
