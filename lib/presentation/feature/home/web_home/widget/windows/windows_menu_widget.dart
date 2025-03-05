import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/constants/details_constants.dart';
import 'package:shinas_koya_portfolio/config/helper/contact_button_helper.dart';
import 'package:shinas_koya_portfolio/config/helper/windows_menu_items_helper.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/contact_dialog_box.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/windows/windows_menu_items_icon_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/windows_details_row.dart';

class WindowsMenuWidget extends StatelessWidget {
  final WebHomeBloc? bloc;

  WindowsMenuWidget({
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
          bloc!.isMenuContExpanded.add(false);
          return true;
        },
        child: Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Colors.black.withOpacity(0.2),
          child: StreamBuilder<bool>(
              stream: bloc!.isMenuContExpanded,
              builder: (context, menuContSnapshot) {
                final isMenuContExpanded = menuContSnapshot.data ?? false;
                return AnimatedContainer(
                  height: isMenuContExpanded ? 500 : 200,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  child: CustomBackdropFilter(
                    height: isMenuContExpanded ? 500 : 200,
                    width: 450,
                    borderRadius: 20,
                    border: Border.all(color: Colors.transparent),

                    // padding: horizontalPadding8,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // * top section starts *
                        SizedBox(
                          height: 100,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: WindowsMenuItemsEnum.values.map((menuItem) {
                              return WindowsMenuItemsIconWidget(
                                title: WindowsMenuItemHelper.getWindowsMenuItemTitle(menuItem),
                                icon: WindowsMenuItemHelper.getWindowsMenuItemIcon(menuItem),
                                onTap: WindowsMenuItemHelper.getWindowsMenuItemOnTap(
                                  menuItem: menuItem,
                                  bloc: bloc,
                                  context: context,
                                ),
                                notificationCountValue:
                                    WindowsMenuItemHelper.getWindowsMenuItemNotificationCount(menuItem),
                              );
                            }).toList(),
                          ),
                        ),
                        // * top section ends *

                        isMenuContExpanded
                            ? Expanded(
                                child: Padding(
                                  // height: 200,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const CustomContactDivider(horizontalPaddingValue: 0),
                                        StreamBuilder<bool>(
                                          stream: bloc!.isContactPhoneHovered,
                                          builder: (context, mouseHoveredSnapshot) {
                                            final isHovered = mouseHoveredSnapshot.data ?? false;
                                            return WindowsDetailsRow(
                                              icon: CupertinoIcons.phone,
                                              onEnter: (_) => bloc!.isContactPhoneHovered.add(true),
                                              onExit: (_) => bloc!.isContactPhoneHovered.add(false),
                                              title: 'Phone',
                                              // value: 'shinasnajeerkoya@gmail.com',
                                              value: DetailsConstantValues.phoneNumber,
                                              isHovered: isHovered,
                                              contactButton: ContactOptionEnum.call,
                                            );
                                          },
                                        ),
                                        const CustomContactDivider(horizontalPaddingValue: 0),
                                        StreamBuilder<bool>(
                                          stream: bloc!.isContactEmailHovered,
                                          builder: (context, mouseHoveredSnapshot) {
                                            final isHovered = mouseHoveredSnapshot.data ?? false;
                                            return WindowsDetailsRow(
                                              icon: CupertinoIcons.envelope_fill,

                                              onEnter: (_) => bloc!.isContactEmailHovered.add(true),
                                              onExit: (_) => bloc!.isContactEmailHovered.add(false),
                                              title: 'Email',
                                              // value: 'shinasnajeerkoya@gmail.com',
                                              value: DetailsConstantValues.email,
                                              isHovered: isHovered,
                                              contactButton:ContactOptionEnum.email,
                                            );
                                          },
                                        ),
                                        const CustomContactDivider(horizontalPaddingValue: 0),
                                        StreamBuilder<bool>(
                                          stream: bloc!.isContactWebsiteHovered,
                                          builder: (context, mouseHoveredSnapshot) {
                                            final isHovered = mouseHoveredSnapshot.data ?? false;
                                            return WindowsDetailsRow(
                                              icon: CupertinoIcons.globe,
                                              onEnter: (_) => bloc!.isContactWebsiteHovered.add(true),
                                              onExit: (_) => bloc!.isContactWebsiteHovered.add(false),
                                              title: 'Website',
                                              // value: 'shinasnajeerkoya@gmail.com',
                                              value: DetailsConstantValues.websiteUrl,
                                              isHovered: isHovered,
                                              contactButton:ContactOptionEnum.web,
                                            );
                                          },
                                        ),
                                        const CustomContactDivider(horizontalPaddingValue: 0),
                                        const WindowsDetailsRow(
                                          title: 'Experience',
                                          value: DetailsConstantValues.experience,
                                        ),
                                        const WindowsDetailsRow(
                                          title: 'Skills',
                                          value: DetailsConstantValues.skills,
                                          maxLines: 7,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const Spacer(),

                        // * bottom section starts *
                        CustomBackdropFilter(
                          height: 70,
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
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 800),
                                child: isMenuContExpanded
                                    ? StreamBuilder<bool>(
                                        stream: bloc!.isMacPlatform,
                                        builder: (context, platformSnapshot) {
                                          final isMacOs = platformSnapshot.data ?? true;
                                          return SizedBox(
                                            width: 180,
                                            height: 20,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    bloc!.isMenuContExpanded.add(false);
                                                  },
                                                  child: Tooltip(
                                                    message: 'Close',
                                                    preferBelow: false,
                                                    waitDuration: const Duration(milliseconds: 300),
                                                    textStyle: const TextStyle(color: Colors.white),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black.withOpacity(0.7),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: const Icon(
                                                      CupertinoIcons.chevron_down,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                                ...ContactOptionEnum.values.map((option) {
                                                  return _ContactOptionColumn(
                                                    title: ContactButtonHelper.getContactButtonTitle(option),
                                                    icon: ContactButtonHelper.getContactButtonIcon(
                                                        option, isMacOs),
                                                    tooltip:
                                                        ContactButtonHelper.getContactButtonTooltip(option),
                                                    onTap: () => ContactButtonHelper.handleContactOnTap(
                                                        context, option),
                                                  );
                                                }).toList()
                                              ],
                                            ),
                                          );
                                        })
                                    : InkWell(
                                        onTap: () async {
                                          bloc!.isMenuContExpanded.add(true);
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
                                      ),
                              )
                            ],
                          ),
                        ),
                        // * bottom section ends *

                        // const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class _ContactOptionColumn extends StatelessWidget {
  final IconData icon;
  final String title;
  final String tooltip;
  final Function()? onTap;

  const _ContactOptionColumn({
    required this.icon,
    required this.title,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        preferBelow: false,
        waitDuration: const Duration(milliseconds: 300),
        textStyle: const TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
