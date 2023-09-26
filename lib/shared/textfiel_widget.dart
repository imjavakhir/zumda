import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zumda/theme/app_colors.dart';
import 'package:zumda/theme/app_text_styles.dart';
import 'package:zumda/theme/input_decorations.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintext;

  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final bool obsecure;
  final VoidCallback? eyeTap;
  final bool isPasswordField;
  final double paddingW;
  final bool isSoldField;
  final bool isDisabled;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final ValueChanged? valueChanged;
  final bool isPhoneNumber;
  final int? maxLines;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? listFormater;
  // final GlobalKey? textFieldKey = GlobalKey(debugLabel: 'textFfieldKey');
  final String? Function(String?)? validator;
  const TextfieldWidget({
    Key? key,
    required this.hintext,
    this.maxLines = 1,
    this.prefixIcon,
    this.textInputType = TextInputType.text,
    this.textEditingController,
    this.obsecure = false,
    this.eyeTap,
    this.isPhoneNumber = false,
    this.isPasswordField = false,
    this.paddingW = 16,
    this.isSoldField = false,
    this.isDisabled = false,
    this.focusNode,
    this.onEditingComplete,
    this.valueChanged,
    this.listFormater,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingW.w),
        child: TextFormField(
          validator: validator,
          // key: textFieldKey,
          maxLines: maxLines,
          // onTapOutside: (event) {
          //   FocusManager.instance.primaryFocus?.unfocus();
          // },
          // onTap: () {
          //   Scrollable.ensureVisible(textFieldKey!.currentContext!);
          // },
          cursorColor: AppColors.primaryColor,
          textCapitalization: TextCapitalization.sentences,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: valueChanged,
          enableSuggestions: false,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyles.labelStyle6,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          enabled: !isDisabled,
          inputFormatters: listFormater,
          obscureText: obsecure,
          textInputAction: TextInputAction.next,
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: InputDecoration(
              suffixIcon: isPasswordField
                  ? Material(
                      color: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r)),
                      child: IconButton(
                          splashRadius: 20.r,
                          onPressed: () {},
                          icon: Icon(
                            obsecure
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: AppColors.textfieldText,
                          )),
                    )
                  : null,
              hintTextDirection: TextDirection.ltr,
              counterText: '',
              isCollapsed: true,
              prefixIcon: isPhoneNumber
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(color: AppColors.borderColor))),
                      child: Text(
                        '+998',
                        style: AppTextStyles.labelStyle5,
                      ),
                    )
                  : prefixIcon,
              disabledBorder: Decorations.disabledBorder,
              hintText: hintext,
              hintStyle: AppTextStyles.labelStyle6
                  .copyWith(color: AppColors.textfieldText),
              prefixIconConstraints: const BoxConstraints(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              filled: true,
              focusedErrorBorder: Decorations.errorBorder,
              fillColor: AppColors.white,
              enabledBorder: Decorations.enabledBorder,
              focusedBorder: Decorations.focusedBorder,
              errorBorder: Decorations.errorBorder),
        ));
  }
}
