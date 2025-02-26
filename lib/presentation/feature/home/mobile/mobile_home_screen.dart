import 'package:flutter/material.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shinas Portfolio - Mobile")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text("Main Content"),
              ),
            ),
          ),
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shinas_koya_portfolio/config/extensions/misc_extensions.dart';
// import 'package:shinas_koya_portfolio/config/themes/units.dart';
// import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
// import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';
//
// class MobileHomeScreen extends StatefulWidget {
//   const MobileHomeScreen({super.key});
//
//   @override
//   State<MobileHomeScreen> createState() => _MobileHomeScreenState();
// }
//
// class _MobileHomeScreenState extends State<MobileHomeScreen> {
//   void _togglePlatform() {
//     setState(() {
//       PlatformExtensions.togglePlatform(); // Toggle between Mac & Windows UI
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(context.isMacOS ? AppImages.kMacOsBg : AppImages.kWindowsOsBg),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             if (context.isMacOS)
//               Container(
//                 height: 10.h,
//                 color: Colors.yellow,
//               ),
//             verticalMargin20,
//             Expanded(
//               child: GridView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 100, // Controls width, forces vertical layout
//                   mainAxisSpacing: 20, // Vertical spacing
//                   crossAxisSpacing: 20, // Horizontal spacing
//                   childAspectRatio: 1, // Ensures square shape
//                 ),
//                 itemCount: 9,
//                 // Total items
//                 itemBuilder: (context, index) {
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       InkWell(
//                         onTap: () => _togglePlatform(),
//                         child: Container(
//                           height: 30.h,
//                           width: 30.h,
//                           color: Colors.yellow.withOpacity(index * 0.09),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "App ${index + 1}",
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             // "made with flutter"
//             CustomBackdropFilter(
//               borderRadius: 50.r,
//               height: 15.h,
//               width: 80.w,
//               child: Container(),
//             ),
//
//             //bottom bar
//             context.isMacOS
//                 ? Container(
//                     margin: verticalPadding4,
//                     height: 30.h,
//                     child: CustomBackdropFilter(
//                       child: Center(
//                         child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   )
//                 : Container(
//                     margin: topPadding4,
//                     width: double.maxFinite,
//                     height: 34.h,
//                     child: CustomBackdropFilter(
//                       child: Center(
//                         child: Text("Glass Effect", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
