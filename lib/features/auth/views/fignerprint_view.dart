import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/auth/components/textbutton_widget.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_images.dart';
import 'package:zumda/theme/app_text_styles.dart';

class FingerPrintView extends StatelessWidget {
  const FingerPrintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isHasBack: true,
        onTapBack: () {
          context.pop();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenUtil().setVerticalSpacing(24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enable biometric access',
                          style: AppTextStyles.labelStyle2,
                        ),
                        ScreenUtil().setVerticalSpacing(8),
                        Text(
                          'Login quickly and securely with the fingerprint stored on this device',
                          style: AppTextStyles.labelStyle5,
                        ),
                      ],
                    ),
                  ),
                  ScreenUtil().setVerticalSpacing(80),
                  Center(
                      child: Image.asset(
                    AppImages.fingerprint,
                    height: 150.h,
                    width: 150.h,
                  )),
                  const Spacer(),
                  FilledAppButton(
                      buttonName: 'Enable biometric access', onTap: () {}),
                  ScreenUtil().setVerticalSpacing(24),
                  Center(
                    child: TextButtonWidget(
                        onTap: () {}, buttonName: 'I\'ll do this later'),
                  ),
                  ScreenUtil().setVerticalSpacing(50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
