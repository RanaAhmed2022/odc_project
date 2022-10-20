import 'package:flutter/material.dart';
import 'package:odc_workshop/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    Key? key,
    this.labelText = "",
    this.hintText = "",
    this.startValue,
    this.isPasswordField = false,
    this.isObscureText = false,
    this.maxLines = 1,
    required this.controller,
    required this.validation,
     this.onChanged,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  String? startValue;
  bool isPasswordField;
  bool isObscureText;
  final int? maxLines;
  final TextEditingController controller;
  Function validation;
  Function? onChanged;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscureText,
      maxLines: widget.maxLines,
      initialValue: widget.startValue,
      cursorColor: AppColors.primaryColor,
      validator: (value) => widget.validation(value),
      onChanged: (value) => widget.onChanged!(value),

      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
        labelText:
            (widget.labelText.isNotEmpty) ? widget.labelText : widget.hintText,
        labelStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
        focusColor: AppColors.primaryColor,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon((widget.isObscureText)
                    ? Icons.visibility_off
                    : Icons.visibility),
                color: AppColors.primaryColor,
                onPressed: () {
                  setState(() {
                    widget.isObscureText = !widget.isObscureText;
                  });
                },
              )
            : const SizedBox(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(
              5.sp,
            )),
      ),
    );
  }
}
