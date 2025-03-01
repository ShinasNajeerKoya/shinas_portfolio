import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/screens/mac_home_screen.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/screens/windows_home_screen.dart';

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

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage(AppImages.kMacOsBg), context);

    final scaffoldKey = GlobalKey<ScaffoldState>();
    final bloc = Provider.of<WebHomeBloc>(context, listen: false);

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.black,
        key: scaffoldKey,
        body: StreamBuilder<bool>(
            stream: bloc.isMacPlatform,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              bool isMacOS = snapshot.data ?? true;
              // return isMacOS ? MacHomeScreen(bloc: bloc) : WindowsHomeScreen(bloc: bloc);
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500), // Adjust transition speed
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },

                child: isMacOS ? MacHomeScreen(bloc: bloc) : WindowsHomeScreen(bloc: bloc),
              );
            }),
      );
    });
  }
}

///
// transitionBuilder: (Widget child, Animation<double> animation) {
//   return SlideTransition(
//     position: Tween<Offset>(
//       begin: const Offset(1, 0), // Start from right
//       end: Offset.zero, // Move to center
//     ).animate(animation),
//     child: child,
//   );
// },
///
// transitionBuilder: (Widget child, Animation<double> animation) {
//   return ScaleTransition(
//     scale: animation,
//     child: child,
//   );
// },

///

// transitionBuilder: (Widget child, Animation<double> animation) {
//   return RotationTransition(
//     turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
//     child: child,
//   );
// },

///

// transitionBuilder: (Widget child, Animation<double> animation) {
//   return SizeTransition(
//     sizeFactor: animation,
//     child: child,
//   );
// },
///
// transitionBuilder: (Widget child, Animation<double> animation) {
//   return SlideTransition(
//     position: Tween<Offset>(
//       begin: const Offset(0, 1), // Start from bottom
//       end: Offset.zero, // Move to center
//     ).animate(animation),
//     child: child,
//   );
// },
