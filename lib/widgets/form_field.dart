import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice/core/theme.dart';

class ABFormField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int? maxLength, minLines, maxLines;
  final MaxLengthEnforcement? maxLengthEnforcement;

  const ABFormField(
      {Key? key,
      required this.hintText,
      this.initialValue,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onSaved,
      this.maxLength,
      this.maxLengthEnforcement,
      this.minLines,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = AppTheme.getTheme();

    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      minLines: minLines,
      maxLines: maxLines,
      style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
          letterSpacing: 0,
          color: themeData.colorScheme.onBackground,
          fontWeight: 500),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
            letterSpacing: 0,
            color: themeData.colorScheme.onBackground,
            fontWeight: 500),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: themeData.colorScheme.background,
        isDense: true,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
    );
  }
}
