import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';

class PassCodeComponent extends StatelessWidget {
  final ValueChanged? onChanged;
  final ValueChanged? onCompleted;
  final ValueChanged? onSubmitted;
  const PassCodeComponent({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      obscureText: true,
      obscuringWidget: Container(
        height: 12.h,
        width: 12.h,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: AppColors.black),
      ),
      controller: TextEditingController(),
      onChanged: onChanged,
      onCompleted: onCompleted,
      onSubmitted: onSubmitted,
      autofocus: true,
      hapticFeedbackType: HapticFeedbackType.vibrate,
      errorText: 'Incorrect code!',
      errorBuilder: (errorText, pin) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Center(
          child: Text(
            errorText!,
            textAlign: TextAlign.center,
            style: AppTextStyles.labelStyle6.copyWith(color: AppColors.red),
          ),
        ),
      ),
      cursor: Container(
        height: 16.h,
        width: 2.w,
        color: AppColors.primaryColor,
      ),
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      defaultPinTheme: PinTheme(
          textStyle: AppTextStyles.labelStyle5
              .copyWith(fontFamily: AppTextStyles.satoshiBold),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: AppColors.borderColor),
          )),
          height: 56.h,
          width: 56.h),
      submittedPinTheme: PinTheme(
          textStyle: AppTextStyles.labelStyle5
              .copyWith(fontFamily: AppTextStyles.satoshiBold),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: AppColors.green),
          )),
          height: 56.h,
          width: 56.h),
      focusedPinTheme: PinTheme(
          textStyle: AppTextStyles.labelStyle5.copyWith(
              fontFamily: AppTextStyles.satoshiBold, color: AppColors.black),
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 1, color: AppColors.primaryColor),
          )),
          height: 56.h,
          width: 56.h),
    );
  }
}
