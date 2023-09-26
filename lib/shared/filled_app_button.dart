import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class FilledAppButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final double fontsize;
  final double paddingW;
  final bool isDisabled;
  final bool isSocialHas;

  const FilledAppButton({
    Key? key,
    required this.buttonName,
    this.isSocialHas = false,
    required this.onTap,
    this.width = double.maxFinite,
    this.height = 44,
    this.fontsize = 14,
    this.paddingW = 16,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        horizontal: paddingW.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isDisabled
              ? AppColors.primaryColor.withOpacity(0.7)
              : AppColors.primaryColor),
      width: width,
      height: height.h,
      duration: const Duration(milliseconds: 200),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        enableFeedback: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        onPressed: isDisabled ? null : onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: AppTextStyles.labelStyle5.copyWith(
                  fontSize: fontsize.sp,
                  fontFamily: AppTextStyles.satoshiBold,
                  color: isDisabled
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
