import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';

class CardColorComponent extends StatelessWidget {
  final bool isSelected;
  final ValueChanged valueChanged;
  final int index;
  final Color firstColor;
  final Color secondColor;
  const CardColorComponent({
    this.isSelected = false,
    super.key,
    required this.valueChanged,
    required this.index,
    required this.firstColor,
    required this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => valueChanged(index),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 32.h,
          width: 32.h,
          decoration: BoxDecoration(
            border: Border.all(
                strokeAlign: BorderSide.strokeAlignCenter,
                width: 4.w,
                color: AppColors.white),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        color: firstColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: secondColor,
                      ),
                    )
                  ],
                ),
              ),
              if (isSelected)
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    CupertinoIcons.check_mark,
                    size: 16.h,
                    color: AppColors.white,
                  ),
                ),
            ],
          )),
    );
  }
}
