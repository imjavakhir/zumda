import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';

abstract class AppTextStyles {
  static const String satoshiLight = 'SatoshiLight';
  static const String satoshiReg = 'SatoshiReg';
  static const String satoshiBold = 'SatoshiBold';
  static const String satoshiMed = 'SatoshiMed';

  static TextStyle labelStyle1 = TextStyle(
      fontSize: 24.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontFamily: satoshiBold);
  static TextStyle labelStyle2 = TextStyle(
      fontSize: 22.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      fontFamily: satoshiBold);
  static TextStyle labelStyle3 = TextStyle(
      fontSize: 20.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontFamily: satoshiMed);
  static TextStyle labelStyle4 = TextStyle(
      fontSize: 18.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontFamily: satoshiReg);
  static TextStyle labelStyle5 = TextStyle(
      fontSize: 16.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontFamily: satoshiReg);
  static TextStyle labelStyle6 = TextStyle(
      fontSize: 14.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontFamily: satoshiReg);
  static TextStyle labelStyle7 = TextStyle(
      fontSize: 12.sp,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontFamily: satoshiLight);
}
