import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final String title;

  final List<Widget>? actions;
  final bool isHasBack;
  final VoidCallback? onTapBack;
  final Widget? leading;
  final bool centerTitle;
  final Color backgroundColor;

  const AppBarWidget(
      {super.key,
      this.isHasBack = false,
      this.title = '',
      this.actions,

      this.leading,
      this.onTapBack,
      this.backgroundColor = AppColors.backgroundColor,
      this.centerTitle = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
     
      leading: isHasBack
          ? IconButton(
              enableFeedback: false,
              splashRadius: 24.r,
              onPressed: onTapBack,
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: AppColors.black,
              ))
          : leading,
      actions: actions,
      elevation: 0,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: AppTextStyles.labelStyle3,
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.maxFinite, 48.h);
}
