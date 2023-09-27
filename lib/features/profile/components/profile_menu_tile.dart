import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_icons.dart';
import 'package:zumda/theme/app_text_styles.dart';

class ProfileMenuTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String leadingPath;
  const ProfileMenuTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListTile(
        visualDensity: const VisualDensity(vertical: -1),
        trailing: SvgPicture.asset(
          AppIcons.arrowForward,
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          height: 18.h,
          width: 18.h,
        ),
        leading: SvgPicture.asset(
          leadingPath,
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
          height: 24.h,
          width: 24.h,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onTap: () {},
        title: Text(
          title,
          style: AppTextStyles.labelStyle5
              .copyWith(fontFamily: AppTextStyles.satoshiMed),
        ),
      ),
    );
  }
}
