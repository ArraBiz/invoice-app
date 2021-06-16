import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';

import '../core/theme.dart';

class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final List? dataSource;
  final String? textField;
  final String? valueField;
  final Function onChanged;
  final bool filled;
  final EdgeInsets contentPadding;

  DropDownFormField(
      {FormFieldSetter<dynamic>? onSaved,
      FormFieldValidator<dynamic>? validator,
      AutovalidateMode? autovalidateMode,
      this.titleText = 'Title',
      this.hintText = 'Country',
      this.required = false,
      this.errorText = 'Please select one option',
      this.value,
      this.dataSource,
      this.textField,
      this.valueField,
      required this.onChanged,
      this.filled = true,
      this.contentPadding = const EdgeInsets.all(0)})
      : super(
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          initialValue: value == '' ? null : value,
          builder: (FormFieldState<dynamic> state) {
            ThemeData themeData = AppTheme.getTheme();
            return InputDecorator(
              decoration: InputDecoration(
                hintText: "Company Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size8!),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size8!),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(MySize.size8!),
                    ),
                    borderSide: BorderSide.none),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              child: DropdownButtonHideUnderline(
                child: Container(
                  height: 20.0,
                  child: DropdownButton<dynamic>(
                    dropdownColor: themeData.colorScheme.background,
                    isExpanded: true,
                    hint: Text(
                      hintText,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle2!,
                          letterSpacing: 0.1,
                          color: themeData.colorScheme.onBackground,
                          fontWeight: 500),
                    ),
                    value: value == '' ? null : value,
                    onChanged: (dynamic newValue) {
                      state.didChange(newValue);
                      onChanged(newValue);
                    },
                    items: dataSource?.map((item) {
                      return DropdownMenuItem<dynamic>(
                        value: item[valueField],
                        child: Text(item[textField],
                            overflow: TextOverflow.ellipsis),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        );
}
