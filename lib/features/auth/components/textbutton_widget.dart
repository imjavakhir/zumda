import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  final double paddingW;
  const TextButtonWidget({
    super.key,
    required this.onTap,
    required this.buttonName,
    this.paddingW = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingW.w),
      child: TextButton(
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          onPressed: onTap,
          child: Text(
            buttonName,
            style: AppTextStyles.labelStyle6.copyWith(
                color: AppColors.green, fontFamily: AppTextStyles.satoshiBold),
          )),
    );
  }
}
