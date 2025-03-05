import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:popover/popover.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/domain/constants/web_constants/web_constant_keys.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_icon_button.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text_button.dart';

class MacAppBar extends StatelessWidget {
  final WebHomeBloc? bloc;

  MacAppBar({
    super.key,
    required this.bloc,
  });

  final List<Map<String, dynamic>> menuItems = [
    {"title": "About Me", "color": Colors.red},
    {"title": "Contact", "color": Colors.blue},
    {"title": "Projects", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackdropFilter(
      borderRadius: 0.r,
      height: 28,
      width: double.maxFinite,
      borderColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Row(
          children: [
            CustomIconButton(
              icon: AppIcons.kAppleLogo,
              onTap: () {
                log('iOS logo tapped');
                bloc!.appBarTitleValue.add('Finder');
                // const CustomPopupMenuButton();
                showPopover(
                  context: context,
                  bodyBuilder: (context) => MenuPopUp(
                    bloc: bloc,
                  ),
                  backgroundColor: Colors.transparent,
                );
              },
            ),
            const SizedBox(width: 16),
            StreamBuilder<String>(
                stream: bloc!.appBarTitleValue,
                builder: (context, titleSnapshot) {
                  final title = titleSnapshot.data ?? 'FinderB';

                  return CustomText(
                    title,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  );
                }),
            const SizedBox(width: 12),

            ///

            ...List.generate(
              menuItems.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CustomTextButton(
                    menuItems[index][MenuItemsConstantKeys.title],
                    onTap: () {
                      bloc!.appBarTitleValue.add(menuItems[index][MenuItemsConstantKeys.title]);

                      ///
                      bloc!.showCustomDialog(
                        // context: navigatorKey.currentContext!,
                        context: context,
                        bloc: bloc,
                        title: menuItems[index][MenuItemsConstantKeys.title],
                        // subTitle: 'sub title',
                      );

                      ///
                    },
                    fontSize: 12,
                  ),
                );
              },
            ),

            ///
            const Spacer(),

            /// ** language selection **
            Container(
              width: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: CustomTextButton(
                  "EN",
                  fontColor: Colors.black,
                  onTap: () {
                    log('language selection button tapped');
                    showPopover(
                      // contentDxOffset: 200,
                      // contentDyOffset: 200,
                      context: context,
                      direction: PopoverDirection.bottom,
                      bodyBuilder: (context) => CustomBackdropFilter(
                        height: 78,
                        width: 100,
                        backgroundColor: Colors.white.withOpacity(0.08),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LanguageMenuItems(
                              title: 'English',
                              onEnter: (_) => bloc!.isContactPhoneHovered.add(true),
                              onExit: (_) => bloc!.isContactPhoneHovered.add(false),
                              bloc: bloc,
                            ),
                            LanguageMenuItems(
                              title: 'Hindi',
                              onEnter: (_) => bloc!.isContactEmailHovered.add(true),
                              onExit: (_) => bloc!.isContactEmailHovered.add(false),
                              bloc: bloc,
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                    );
                  },
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            horizontalMargin8,
            CustomText(
              DateFormat('E, MMM d, h:mm a').format(DateTime.now()),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPopUp extends StatelessWidget {
  final WebHomeBloc? bloc;

  const MenuPopUp({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackdropFilter(
      height: 120,
      width: 200,
      backgroundColor: Colors.white.withOpacity(0.08),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          MenuPopupItems(
            title: MenuItemsConstantKeys.aboutMe,
            onEnter: (_) => bloc!.isContactPhoneHovered.add(true),
            onExit: (_) => bloc!.isContactPhoneHovered.add(false),
            bloc: bloc,
          ),
          MenuPopupItems(
            title: MenuItemsConstantKeys.contact,
            onEnter: (_) => bloc!.isContactEmailHovered.add(true),
            onExit: (_) => bloc!.isContactEmailHovered.add(false),
            bloc: bloc,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Divider(
              height: 0.5,
              endIndent: 10,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          MenuPopupItems(
            title: MenuItemsConstantKeys.projects,
            onEnter: (_) => bloc!.isContactWebsiteHovered.add(true),
            onExit: (_) => bloc!.isContactWebsiteHovered.add(false),
            bloc: bloc,
          ),
        ],
      ),
    );
  }
}

class LanguageMenuItems extends StatelessWidget {
  const LanguageMenuItems({
    super.key,
    required this.bloc,
    this.onEnter,
    this.onExit,
    required this.title,
  });

  final String title;
  final WebHomeBloc? bloc;
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: getStream(title),
        builder: (context, mouseHoveredSnapshot) {
          final isHovered = mouseHoveredSnapshot.data ?? false;
          return MouseRegion(
            onEnter: onEnter,
            onExit: onExit,
            child: InkWell(
              onTap: () {
                if (title == "Hindi") {
                  _showFeatureComingSoonMessage(context);
                }

                Navigator.pop(context);
              },
              child: Container(
                height: 26,
                width: 180,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  title,
                ),
              ),
            ),
          );
        });
  }

  Stream<bool> getStream(String titleValue) {
    switch (titleValue) {
      case 'English':
        return bloc!.isContactPhoneHovered;
      case 'Hindi':
        return bloc!.isContactEmailHovered;
      // case MenuItemsConstantKeys.projects:
      //   return bloc!.isContactWebsiteHovered;
      default:
        return bloc!.isContactPhoneHovered;
    }
  }

  void _showFeatureComingSoonMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("This feature will be available in the future soon."),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class MenuPopupItems extends StatelessWidget {
  const MenuPopupItems({
    super.key,
    required this.bloc,
    this.onEnter,
    this.onExit,
    required this.title,
  });

  final String title;
  final WebHomeBloc? bloc;
  final Function(PointerEnterEvent)? onEnter;
  final Function(PointerExitEvent)? onExit;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: getStream(title),
        builder: (context, mouseHoveredSnapshot) {
          final isHovered = mouseHoveredSnapshot.data ?? false;
          return MouseRegion(
            onEnter: onEnter,
            onExit: onExit,
            child: InkWell(
              onTap: () {
                bloc!.appBarTitleValue.add(title);

                Navigator.pop(context);

                ///
                bloc!.showCustomDialog(
                  // context: navigatorKey.currentContext!,
                  context: context,
                  bloc: bloc,
                  title: title,
                  // subTitle: 'sub title',
                );
              },
              child: Container(
                height: 26,
                width: 180,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isHovered ? Colors.blue : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  title,
                ),
              ),
            ),
          );
        });
  }

  Stream<bool> getStream(String titleValue) {
    switch (titleValue) {
      case MenuItemsConstantKeys.aboutMe:
        return bloc!.isContactPhoneHovered;
      case MenuItemsConstantKeys.contact:
        return bloc!.isContactEmailHovered;
      case MenuItemsConstantKeys.projects:
        return bloc!.isContactWebsiteHovered;
      default:
        return bloc!.isContactPhoneHovered;
    }
  }
}
