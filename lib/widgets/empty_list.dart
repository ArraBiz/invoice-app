import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';

class EmptyList extends StatelessWidget {
  final String message;

  const EmptyList({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      child: Center(
        child: Text(
          message,
          style: AppTheme.getTextStyle(
            themeData.textTheme.headline6!,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
