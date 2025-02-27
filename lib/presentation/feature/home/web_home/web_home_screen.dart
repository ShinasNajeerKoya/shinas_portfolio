import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_app_bar.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  WebHomeBloc? bloc;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool _splitScreenMode = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _splitScreenMode = MediaQuery.of(context).size.width > 800;
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<WebHomeBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        body: StreamBuilder<bool>(
            stream: bloc!.isMacPlatform,
            builder: (context, snapshot) {
              bool isMacOS = snapshot.data ?? true;
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(isMacOS ? AppImages.kMacOsBg : AppImages.kWindowsOsBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // context.isMacOS
                    isMacOS
                        ? MacAppBar(
                      bloc: bloc,
                    )
                        : Container(
                            height: 15.h,
                            color: Colors.transparent,
                          ),
                    verticalMargin20,

                    ///
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100, // Controls width, forces vertical layout
                          mainAxisSpacing: 20, // Vertical spacing
                          crossAxisSpacing: 20, // Horizontal spacing
                          childAspectRatio: 1, // Ensures square shape
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () => bloc!.togglePlatform(),
                                child: Container(
                                  height: 30.h,
                                  width: 30.h,
                                  color: Colors.yellow.withOpacity(index * 0.09),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "App ${index + 1}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    /// reference code for dynamic layout changing container
/*

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for (int i = 0; i < 10; i++)
                            Container(
                              height: 60,
                              width: 60,
                              color: Colors.blue,
                            ),
                        ],
                      ),
                    ),
*/

                    ///
                    // "made with flutter"
                    CustomBackdropFilter(
                      borderRadius: 50.r,
                      height: 15.h,
                      width: 100,
                      child: Container(),
                    ),

                    //bottom bar
                    // context.isMacOS
                    isMacOS
                        ? Container(
                            margin: verticalPadding4,
                            height: 30.h,
                            child: CustomBackdropFilter(
                              child: Center(
                                child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          )
                        : Container(
                            margin: topPadding4,
                            width: double.maxFinite,
                            height: 34.h,
                            child: CustomBackdropFilter(
                              child: Center(
                                child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          )
                  ],
                ),
              );
            }),
      );
    });

    ///

    /*final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.yellow,
          endDrawer: constraints.maxWidth >= 800 ? null : null,
          body: StreamBuilder<bool>(
              stream: bloc!.isMacPlatform,
              builder: (context, snapshot) {
                bool isMacOS = snapshot.data ?? true;
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(isMacOS ? AppImages.kMacOsBg : AppImages.kWindowsOsBg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      // SKILLS
                      SizedBox(
                        width: screenWidth,
                        height: 20,
                        child: isMacOS
                            ? Container(
                                width: double.maxFinite,
                                height: 10,
                                color: Colors.yellow,
                              )
                            : Container(
                                width: double.maxFinite,
                                height: 10,
                                color: Colors.transparent,
                              ),
                      ),

                      const SizedBox(height: 30),

                      // PROJECTS
                      const ProjectSection(),

                      // const SizedBox(height: 30),

                      // CONTACT
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                        color: Colors.black,
                        child: Column(
                          children: [
                            // title
                            Text(
                              "Get In Touch",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.red,
                              ),
                            ),

                            const SizedBox(height: 50),

                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Row(
                                children: [
                                  // Flexible(
                                  //   // name
                                  //   child: CustomTextField(hintText: "Your name"),
                                  // ),
                                  const SizedBox(width: 15),
                                  // Flexible(
                                  //   // email
                                  //   child: CustomTextField(hintText: "Your email"),
                                  // ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            // message
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: SizedBox(),
                            ),
                            const SizedBox(height: 20),
                            // send button
                            SizedBox(
                              // color: Colors.yellow,
                              width: double.maxFinite,
                              height: 40,
                              child: const SizedBox(),
                            ),
                          ],
                        ),
                      ),

                      // FOOTER
                      SizedBox(
                        height: 500,
                        width: double.maxFinite,
                        // color: Colors.blueGrey,
                      ),
                    ],
                  ),
                );
              }),
        );
      },
    );


    */

    ///
  }
}

// class ProjectSection extends StatelessWidget {
//   const ProjectSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       width: screenWidth,
//       padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
//       child: Column(
//         children: [
//           // Work Projects title
//           Text(
//             "Work Projects",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.brown.withOpacity(0.2),
//             ),
//           ),
//           const SizedBox(height: 50),
//
//           // Work projects cards
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 900),
//             child: Wrap(
//               spacing: 25,
//               runSpacing: 25,
//               children: [
//                 for (int i = 0; i < 4; i++) ProjectCardWidget(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 80),
//           // Hobby Projects title
//           const Text(
//             "Hobby Projects",
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.brown,
//             ),
//           ),
//           const SizedBox(height: 50),
//
//           // Hobby projects cards
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 900),
//             child: Wrap(
//               spacing: 25,
//               runSpacing: 25,
//               children: [
//                 for (int i = 0; i < 3; i++) ProjectCardWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
  });

  // final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal.withOpacity(0.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // project img
          Image.asset(
            AppImages.kMacOsBg,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 6),
            child: Text(
              'project.title',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.teal.withOpacity(0.4),
              ),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              'project.subtitle',
              style: TextStyle(fontSize: 12, color: Colors.teal.withOpacity(0.2)),
            ),
          ),
          const Spacer(),
          // footer
          Container(
            color: Colors.teal.withOpacity(0.9),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Available on:",
                  style: TextStyle(
                    color: Colors.teal.withOpacity(0.8),
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                // if (project.iosLink != null)
                //   InkWell(
                //     onTap: () {
                //       // js.context.callMethod("open", [project.iosLink]);
                //     },
                //     child: Image.asset("assets/ios_icon.png", width: 19),
                //   ),
                // if (project.androidLink != null)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 6),
                //     child: InkWell(
                //       onTap: () {
                //         // js.context.callMethod("open", [project.androidLink]);
                //       },
                //       child: Image.asset("assets/android_icon.png", width: 17),
                //     ),
                //   ),
                // if (project.webLink != null)
                //   Padding(
                //     padding: const EdgeInsets.only(left: 6),
                //     child: InkWell(
                //       onTap: () {
                //         // js.context.callMethod("open", [project.webLink]);
                //       },
                //       child: Image.asset("assets/web_icon.png", width: 17),
                //     ),
                //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
