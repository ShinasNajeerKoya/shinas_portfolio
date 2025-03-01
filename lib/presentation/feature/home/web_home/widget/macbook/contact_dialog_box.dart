import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shinas_koya_portfolio/config/constants/details_constants.dart';
import 'package:shinas_koya_portfolio/config/helper/contact_button_helper.dart';
import 'package:shinas_koya_portfolio/config/themes/colors.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text_button.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/details_row.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/mac_dialog_app_bar.dart';

class ContactDialogBox extends StatelessWidget {
  final WebHomeBloc? bloc;

  ContactDialogBox({
    super.key,
    required this.bloc,
  });

  final List<Map<String, dynamic>> contactOptions = [
    {'title': 'Call', 'icon': CupertinoIcons.phone_fill, 'tooltip': 'Call me'},
    {'title': 'Email', 'icon': CupertinoIcons.envelope_fill, 'tooltip': 'Send me an email'},
    {'title': 'Web', 'icon': CupertinoIcons.globe, 'tooltip': 'Visit my website'},
    {'title': 'Share', 'icon': CupertinoIcons.share, 'tooltip': 'Share my portfolio'},
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // await WifiOnlyPref.saveFirstTimeWifiOnlyState(isFirstTime: false);
        return false;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: SingleChildScrollView(
          // padding: EdgeInsets.zero,
          child: Container(
            height: 220.h,
            width: 250.w,
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

                /// **App bar section**
                MacDialogAppBar(
                  bloc: bloc,
                  title: 'Contact',
                  titlePadding: 52,
                ),
                verticalMargin16,

                /// **Profile Image**
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(AppImages.kMacOsBg),
                    ),
                    horizontalMargin8,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'Shinas Najeer Koya',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          'Flutter Engineer',
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          fontColor: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalMargin12,

                /// **contact icons list**

                SizedBox(
                  height: 60,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(contactOptions.length, (index) {
                      final option = contactOptions[index];
                      return ContactOptionColumn(
                        title: option['title'],
                        icon: option['icon'],
                        tooltip: option['tooltip'],
                      );
                    }),
                  ),
                ),

                verticalMargin12,

                /// **Experience**

                StreamBuilder<bool>(
                  stream: bloc!.isContactPhoneHovered,
                  builder: (context, mouseHoveredSnapshot) {
                    final isHovered = mouseHoveredSnapshot.data ?? false;
                    return DetailsRow(
                      onEnter: (_) => bloc!.isContactPhoneHovered.add(true),
                      onExit: (_) => bloc!.isContactPhoneHovered.add(false),
                      title: 'Phone',
                      value: '+91 8088 670 650',
                      isHovered: isHovered,
                    );
                  },
                ),
                const CustomContactDivider(),
                StreamBuilder<bool>(
                  stream: bloc!.isContactEmailHovered,
                  builder: (context, mouseHoveredSnapshot) {
                    final isHovered = mouseHoveredSnapshot.data ?? false;
                    return DetailsRow(
                      onEnter: (_) => bloc!.isContactEmailHovered.add(true),
                      onExit: (_) => bloc!.isContactEmailHovered.add(false),
                      title: 'Email',
                      // value: 'shinasnajeerkoya@gmail.com',
                      value: DetailsConstantValues.email,
                      isHovered: isHovered,
                    );
                  },
                ),
                const CustomContactDivider(),
                StreamBuilder<bool>(
                  stream: bloc!.isContactWebsiteHovered,
                  builder: (context, mouseHoveredSnapshot) {
                    final isHovered = mouseHoveredSnapshot.data ?? false;
                    return DetailsRow(
                      onEnter: (_) => bloc!.isContactWebsiteHovered.add(true),
                      onExit: (_) => bloc!.isContactWebsiteHovered.add(false),
                      title: 'Website',
                      // value: 'null null',
                      value: DetailsConstantValues.websiteUrl,
                      isHovered: isHovered,
                    );
                  },
                ),

                verticalMargin16,

                /// **Skills Section**

                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.kDialogButtonColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: CustomTextButton(
                          'About Me',
                          onTap: () {
                            Navigator.of(context).pop();
                            bloc!.appBarTitleValue.add(MenuItemsConstantKeys.aboutMe);

                            bloc!.showCustomDialog(
                              // context: navigatorKey.currentContext!,
                              context: context,
                              bloc: bloc,
                              title: MenuItemsConstantKeys.aboutMe,
                              // subTitle: 'sub title',
                            );
                          },
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalMargin8,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContactDivider extends StatelessWidget {
  const   CustomContactDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Divider(
        height: 0.5,
        endIndent: 10,
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

class ContactOptionColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String tooltip;

  const ContactOptionColumn({
    super.key,
    required this.icon,
    required this.title,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => ContactButtonHelper.handleContactTap(context, title),
            child: Tooltip(
              margin: topPadding8,
              message: tooltip,
              waitDuration: const Duration(milliseconds: 300),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.kContactButtonBlueColor,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        CustomText(
          title,
          fontSize: 11,
          fontColor: AppColors.kContactButtonBlueColor,
        ),
      ],
    );
  }
}
