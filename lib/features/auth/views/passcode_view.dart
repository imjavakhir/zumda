import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zumda/features/auth/components/passcode_component.dart';
import 'package:zumda/router/app_router.dart';
import 'package:zumda/shared/appbar_widget.dart';
import 'package:zumda/shared/filled_app_button.dart';
import 'package:zumda/theme/app_text_styles.dart';

class PasscodeView extends StatelessWidget {
  const PasscodeView({super.key});

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
                    'Set your passcode',
                    style: AppTextStyles.labelStyle2,
                  ),
                  ScreenUtil().setVerticalSpacing(8),
                  Text(
                    'We use state-of-the-art security measures to protect your information at all times',
                    style: AppTextStyles.labelStyle5,
                  ),
                ],
              ),
            ),
            ScreenUtil().setVerticalSpacing(24),
            const PassCodeComponent()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledAppButton(
          buttonName: 'Create passcode',
          onTap: () {
            context.goNamed(RouteNames.global);
          }),
    );
  }
}
