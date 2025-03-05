import 'package:flutter/material.dart';
import 'package:shinas_koya_portfolio/config/themes/visuals.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/bloc/web_home_bloc.dart';
import 'package:shinas_koya_portfolio/presentation/feature/home/web_home/widget/macbook/mac_os_button.dart';
import 'package:shinas_koya_portfolio/presentation/widgets/custom_text.dart';

class MacDialogAppBar extends StatelessWidget {
  const MacDialogAppBar({
    super.key,
    required this.bloc,
    required this.title,
    this.titlePadding,
  });

  final WebHomeBloc? bloc;
  final String title;
  final double? titlePadding;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc!.isMouseHovered,
        builder: (context, mouseHoveredSnapshot) {
          final isHovered = mouseHoveredSnapshot.data ?? false;

          return MouseRegion(
            onEnter: (_) => bloc!.isMouseHovered.add(true),
            onExit: (_) => bloc!.isMouseHovered.add(false),
            child: SizedBox(
              height: 16,
              width: double.maxFinite,
              child: Row(
                children: [
                  MacOSButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      bloc!.appBarTitleValue.add('Finder');
                    },
                    color: Colors.red,
                    icon: AppIcons.kCancelIcon,
                    iconColor: Colors.black,
                    isHovered: isHovered,
                  ),
                  const SizedBox(width: 6),
                  MacOSButton(
                    color: Colors.yellow,
                    isHovered: isHovered,
                  ),
                  const SizedBox(width: 6),
                  MacOSButton(
                    color: Colors.green,
                    isHovered: isHovered,
                  ),
                  const Spacer(),
                  CustomText(
                    title,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: titlePadding ?? 44,
                  )
                ],
              ),
            ),
          );
        });
  }
}
