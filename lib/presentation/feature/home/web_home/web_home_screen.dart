import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shinas_koya_portfolio/config/themes/units.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_backdrop_filter.dart';

class WebHomeScreen extends StatefulWidget {
  const WebHomeScreen({super.key});

  @override
  State<WebHomeScreen> createState() => _WebHomeScreenState();
}

class _WebHomeScreenState extends State<WebHomeScreen> {
  WebHomeBloc? bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<WebHomeBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ? Container(
                          height: 10.h,
                          color: Colors.yellow,
                        )
                      : Container(
                          height: 10.h,
                          color: Colors.transparent,
                        ),
                  verticalMargin20,
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
                  // "made with flutter"
                  CustomBackdropFilter(
                    borderRadius: 50.r,
                    height: 15.h,
                    width: 80.w,
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
  }
}
