import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp/features/screens/login/login_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, this.title='', this.leading, this.titleWidget, this.showActionIcon=false, this.onMenuActionTap})
      : super(key: key);

  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 5.5),
        child: Stack(
          children: [
            Positioned.fill(
                child: titleWidget == null
                    ? Center(
                        child: Text(title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)))
                    : Center(
                        child: titleWidget,
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(offset: const Offset(10, 0),
                    child: InkWell(
                      onTap: onMenuActionTap,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.menu),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 80);
}
