// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final String? labelName;
  final String? hintText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final EdgeInsets? margin;
  final Function(String)? onChange;
  final bool? readOnly;
  Color? color;
  final Function(String?)? onSaved;
  final Function(String?)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Widget? suffix;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final bool? showPassword;
  final TextInputAction? textInputAction;
  EdgeInsetsGeometry? contentPadding;

  CustomTextField({
    Key? key,
    this.controller,
    this.prefix,
    this.prefixIcon,
    this.hintText,
    this.margin,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.height,
    this.labelName,
    this.inputFormatters,
    this.keyboardType,
    this.readOnly = false,
    this.validator,
    this.onTap,
    this.onChange,
    this.color = Colors.black,
    this.onSaved,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.suffix,
    this.suffixIcon,
    this.focusNode,
    this.textStyle,
    this.showPassword,
    this.textInputAction,
    this.contentPadding = const EdgeInsets.only(left: 10, bottom: 12, top: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: maxLines,
        onTap: onTap,
        validator: validator,
        readOnly: readOnly!,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: controller,
        onChanged: onChange,
        onSaved: onSaved,
        onFieldSubmitted: (v) => {focusNode!.unfocus()},
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        obscureText: showPassword == null ? false : !showPassword!,
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey,
            focusColor: Colors.grey,
            hintText: hintText,
            labelText: labelName,
            contentPadding: EdgeInsets.only(top: 0, left: 8)),
        style: TextStyle(
            fontSize: 14.px,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: Colors.black),
        autocorrect: true,
      ),
    );
  }
}
