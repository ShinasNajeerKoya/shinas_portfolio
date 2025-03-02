import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shinas_koya_portfolio/config/helper/desktop_layout_helper.dart';
import 'package:shinas_koya_portfolio/config/helper/mac_bottom_bar_helper.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_app_bar.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_icon_widget.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_svg_icon.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/made_with_flutter_widget.dart';

//
// class WebHomeScreen extends StatefulWidget {
//   const WebHomeScreen({super.key});
//
//   @override
//   State<WebHomeScreen> createState() => _WebHomeScreenState();
// }
//
// class _WebHomeScreenState extends State<WebHomeScreen> {
//   WebHomeBloc? bloc;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   bool _splitScreenMode = false;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _splitScreenMode = MediaQuery.of(context).size.width > 800;
//   // }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     bloc = Provider.of<WebHomeBloc>(context, listen: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Scaffold(
//         key: scaffoldKey,
//         body: StreamBuilder<bool>(
//             stream: bloc!.isMacPlatform,
//             builder: (context, snapshot) {
//               bool isMacOS = snapshot.data ?? true;
//               return Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(isMacOS ? AppImages.kMacOsBg : AppImages.kWindowsOsBg),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // context.isMacOS
//                     isMacOS
//                         ? MacAppBar(
//                       bloc: bloc,
//                     )
//                         : Container(
//                       height: 15.h,
//                       color: Colors.transparent,
//                     ),
//                     verticalMargin20,
//
//                     ///
//                     /// ** main layout section **
//                     // Expanded(
//                     //   child: GridView.builder(
//                     //     scrollDirection: Axis.horizontal,
//                     //     physics: const NeverScrollableScrollPhysics(),
//                     //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     //       maxCrossAxisExtent: 110,
//                     //       mainAxisSpacing: 20,
//                     //       crossAxisSpacing: 20,
//                     //       childAspectRatio: 1,
//                     //     ),
//                     //     itemCount: 9,
//                     //     itemBuilder: (context, index) {
//                     //       return InkWell(
//                     //         onTap: () => bloc!.togglePlatform(),
//                     //         child: SizedBox(
//                     //           child: Column(
//                     //             children: [
//                     //               Container(
//                     //                 height: 50,
//                     //                 width: 50,
//                     //                 color: Colors.yellow.withOpacity(index * 0.09),
//                     //                 child: CustomSvgIcon(AppIcons.kFlutterMacIcon),
//                     //               ),
//                     //               const SizedBox(height: 5),
//                     //               Text(
//                     //                 "App ${index + 1}",
//                     //                 style: const TextStyle(color: Colors.white),
//                     //               ),
//                     //             ],
//                     //           ),
//                     //         ),
//                     //       );
//                     //     },
//                     //   ),
//                     // ),
//
//                     Expanded(
//                       child: GridView.builder(
//                         scrollDirection: Axis.horizontal,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                           maxCrossAxisExtent: 110,
//                           mainAxisSpacing: 20,
//                           crossAxisSpacing: 20,
//                           childAspectRatio: 1,
//                         ),
//                         itemCount: MainLayoutEnum.values.length,
//                         itemBuilder: (context, index) {
//                           final layout = MainLayoutEnum.values[index];
//
//                           return InkWell(
//                             onTap: DesktopLayoutHelper.getMainLayoutOnTap(layoutEnum: layout, bloc: bloc),
//                             child: Column(
//                               children: [
//                                 MacIconWidget(
//                                   layout: layout,
//                                   notificationCountValue: DesktopLayoutHelper.getNotificationCount(layout),
//                                   hasSlantedArrow: DesktopLayoutHelper.shouldShowArrow(layout),
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Text(
//                                   DesktopLayoutHelper.getMainLayoutTitle(layout),
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//
//                     /// ///
//
//                     // Expanded(
//                     //   child: LayoutBuilder(
//                     //     builder: (context, constraints) {
//                     //       double itemHeight = 50 + 5; // Item height + spacing
//                     //       int itemsPerColumn = (constraints.maxHeight / itemHeight).floor();
//                     //       itemsPerColumn =
//                     //           itemsPerColumn > 0 ? itemsPerColumn : 1; // Ensure at least 1 item per column
//                     //
//                     //       List<List<int>> columns = [];
//                     //       for (int i = 0; i < 9; i++) {
//                     //         int columnIndex = i ~/ itemsPerColumn;
//                     //         if (columns.length <= columnIndex) {
//                     //           columns.add([]);
//                     //         }
//                     //         columns[columnIndex].add(i);
//                     //       }
//                     //
//                     //       return Row(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         children: columns.map((colItems) {
//                     //           return Expanded(
//                     //             child: ListView.builder(
//                     //               scrollDirection: Axis.horizontal,
//                     //               physics: const NeverScrollableScrollPhysics(),
//                     //               // Prevent individual scrolling
//                     //               itemCount: colItems.length,
//                     //               itemBuilder: (context, index) {
//                     //                 int itemIndex = colItems[index];
//                     //                 return Padding(
//                     //                   padding: const EdgeInsets.only(bottom: 5),
//                     //                   child: InkWell(
//                     //                     onTap: () => bloc!.togglePlatform(),
//                     //                     child: Column(
//                     //                       children: [
//                     //                         Container(
//                     //                           height: 50,
//                     //                           width: 50,
//                     //                           color: Colors.yellow.withOpacity(itemIndex * 0.09),
//                     //                         ),
//                     //                         const SizedBox(height: 5),
//                     //                         Text(
//                     //                           "App ${itemIndex + 1}",
//                     //                           style: const TextStyle(color: Colors.white),
//                     //                         ),
//                     //                       ],
//                     //                     ),
//                     //                   ),
//                     //                 );
//                     //               },
//                     //             ),
//                     //           );
//                     //         }).toList(),
//                     //       );
//                     //     },
//                     //   ),
//                     // ),
//
//                     /// reference code for dynamic layout changing container
// /*
//
//                     ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 900),
//                       child: Wrap(
//                         spacing: 25,
//                         runSpacing: 25,
//                         children: [
//                           for (int i = 0; i < 10; i++)
//                             Container(
//                               height: 60,
//                               width: 60,
//                               color: Colors.blue,
//                             ),
//                         ],
//                       ),
//                     ),
// */
//
//                     ///
//                     // "made with flutter"
//                     CustomBackdropFilter(
//                       borderRadius: 50.r,
//                       height: 15.h,
//                       width: 100,
//                       child: Container(),
//                     ),
//
//                     //bottom bar
//                     // context.isMacOS
//                     isMacOS
//                         ? Container(
//                       margin: verticalPadding4,
//                       height: 30.h,
//                       child: CustomBackdropFilter(
//                         child: Center(
//                           child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     )
//                         : Container(
//                       margin: topPadding4,
//                       width: double.maxFinite,
//                       height: 34.h,
//                       child: CustomBackdropFilter(
//                         child: Center(
//                           child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             }),
//       );
//     });
//
//     ///
//
//     /*final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Scaffold(
//           key: scaffoldKey,
//           backgroundColor: Colors.yellow,
//           endDrawer: constraints.maxWidth >= 800 ? null : null,
//           body: StreamBuilder<bool>(
//               stream: bloc!.isMacPlatform,
//               builder: (context, snapshot) {
//                 bool isMacOS = snapshot.data ?? true;
//                 return Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(isMacOS ? AppImages.kMacOsBg : AppImages.kWindowsOsBg),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: ListView(
//                     scrollDirection: Axis.vertical,
//                     children: [
//                       // SKILLS
//                       SizedBox(
//                         width: screenWidth,
//                         height: 20,
//                         child: isMacOS
//                             ? Container(
//                                 width: double.maxFinite,
//                                 height: 10,
//                                 color: Colors.yellow,
//                               )
//                             : Container(
//                                 width: double.maxFinite,
//                                 height: 10,
//                                 color: Colors.transparent,
//                               ),
//                       ),
//
//                       const SizedBox(height: 30),
//
//                       // PROJECTS
//                       const ProjectSection(),
//
//                       // const SizedBox(height: 30),
//
//                       // CONTACT
//                       Container(
//                         padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
//                         color: Colors.black,
//                         child: Column(
//                           children: [
//                             // title
//                             Text(
//                               "Get In Touch",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 24,
//                                 color: Colors.red,
//                               ),
//                             ),
//
//                             const SizedBox(height: 50),
//
//                             ConstrainedBox(
//                               constraints: const BoxConstraints(maxWidth: 700),
//                               child: Row(
//                                 children: [
//                                   // Flexible(
//                                   //   // name
//                                   //   child: CustomTextField(hintText: "Your name"),
//                                   // ),
//                                   const SizedBox(width: 15),
//                                   // Flexible(
//                                   //   // email
//                                   //   child: CustomTextField(hintText: "Your email"),
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             // message
//                             ConstrainedBox(
//                               constraints: const BoxConstraints(maxWidth: 700),
//                               child: SizedBox(),
//                             ),
//                             const SizedBox(height: 20),
//                             // send button
//                             SizedBox(
//                               // color: Colors.yellow,
//                               width: double.maxFinite,
//                               height: 40,
//                               child: const SizedBox(),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // FOOTER
//                       SizedBox(
//                         height: 500,
//                         width: double.maxFinite,
//                         // color: Colors.blueGrey,
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         );
//       },
//     );
//
//
//     */
//
//     ///
//   }
// }
//

class MacHomeScreen extends StatelessWidget {
  final WebHomeBloc? bloc;

  const MacHomeScreen({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.kMacOsBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// ** app bar section **
          MacAppBar(
            bloc: bloc,
          ),
          verticalMargin20,

          ///
          /// ** main layout section **

          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 110,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: MainLayoutEnum.values.length,
              itemBuilder: (context, index) {
                final layout = MainLayoutEnum.values[index];

                return InkWell(
                  onTap: DesktopLayoutHelper.getMainLayoutOnTap(
                    layoutEnum: layout,
                    bloc: bloc,
                    context: context,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    children: [
                      MacIconWidget(
                        layout: layout,
                        notificationCountValue: DesktopLayoutHelper.getNotificationCount(layout),
                        hasSlantedArrow: DesktopLayoutHelper.shouldShowArrow(layout),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DesktopLayoutHelper.getMainLayoutTitle(layout),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          ///
          /// ** made with flutter **
          const MadeWithFlutterWidget(),

          /// ** Bottom bar **

          MacBottomBar(bloc: bloc)
        ],
      ),
    );
  }
}

class MacBottomBar extends StatelessWidget {
  const MacBottomBar({
    super.key,
    required this.bloc,
  });

  final WebHomeBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 60,
      child: CustomBackdropFilter(
        width: 370,
        borderRadius: 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: MacBottomBarEnum.values.map((bottomOption) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5), // 5 padding between icons
              child: Tooltip(
                margin: const EdgeInsets.only(bottom: 5),
                message: MacBottomBarHelper.getBottomBarTooltip(bottomOption),
                textStyle: const TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: MacBottomBarHelper.getBottomOptionOnTap(
                    bottomOption: bottomOption,
                    bloc: bloc,
                    context: context,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: bottomOption == MacBottomBarEnum.meet
                        ? const MacMeetingCalendarWidget() // Custom widget for 'meet' option
                        : CustomSvgIcon(
                            MacBottomBarHelper.getBottomOptionIcon(bottomOption),
                          ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MacMeetingCalendarWidget extends StatelessWidget {
  const MacMeetingCalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEE').format(DateTime.now());
    String date = DateFormat('dd').format(DateTime.now());

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 1,
            left: 10,
            // right: 0,
            child: CustomText(
              day.toUpperCase(),
              fontSize: 9,
              fontColor: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Positioned(
            top: 5,
            left: 4,
            child: CustomText(
              date,
              fontSize: 28,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// class MacMeetingCalendarWidget extends StatelessWidget {
//   const MacMeetingCalendarWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     String day = DateFormat('EEE').format(DateTime.now()); // Example: "SAT"
//     String date = DateFormat('d').format(DateTime.now()); // Example: "20"
//
//     return Container(
//       width: 50,
//       // Adjust width to match UI
//       height: 55,
//       // Adjust height to match UI
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12), // More rounded corners
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             day.toUpperCase(), // Uppercase like in the image
//             style: const TextStyle(
//               fontSize: 14, // Slightly larger for visibility
//               fontWeight: FontWeight.bold,
//               color: Colors.red, // Match the red color in the image
//               letterSpacing: 1, // Slight spacing for better readability
//             ),
//           ),
//           const SizedBox(height: 2), // Add spacing for better layout
//           Text(
//             date,
//             style: const TextStyle(
//               fontSize: 30, // Large and bold for date
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
