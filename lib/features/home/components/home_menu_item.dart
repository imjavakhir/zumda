import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/features/home/components/credit_card.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';
class HomeMenuItem extends StatelessWidget {
  final String iconPath;
  final String title;
  const HomeMenuItem({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 64.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 24.h,
              width: 24.h,
              colorFilter:
                  const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
            Text(
              title,
              style: AppTextStyles.labelStyle7
                  .copyWith(fontFamily: AppTextStyles.satoshiMed),
            )
          ],
        ),
      ),
    );
  }
}