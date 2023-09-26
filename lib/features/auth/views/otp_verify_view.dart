import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/auth/components/pinput_component.dart';
import 'package:zumda/features/auth/components/textbutton_widget.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_text_styles.dart';

class OTPVerifyView extends StatelessWidget {
  const OTPVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isHasBack: true,
        onTapBack: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    'Verify it\'s you',
                    style: AppTextStyles.labelStyle2,
                  ),
                  ScreenUtil().setVerticalSpacing(8),
                  Text(
                    'We send a code to ( *****@gmail.com ). Enter it here to verify your identity',
                    style: AppTextStyles.labelStyle5,
                  ),
                ],
              ),
            ),
            ScreenUtil().setVerticalSpacing(32),
            const PinputComponent(),
            ScreenUtil().setVerticalSpacing(32),
            Center(
                child:
                    TextButtonWidget(onTap: () {}, buttonName: 'Resend Code'))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledAppButton(
          buttonName: 'Confirm',
          onTap: () {
            context.goNamed(RouteNames.fingerPrint);
          }),
    );
  }
}
