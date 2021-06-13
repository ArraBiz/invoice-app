import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';

class EmptyList extends StatelessWidget {
  final String message;
  final ThemeData themeData;

  const EmptyList({Key? key, required this.message, required this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Image(
                  image: AssetImage(
                    './assets/illustration/empty-box.png',
                  ),
                  height: MySize.safeWidth! * 0.5,
                  width: MySize.safeWidth! * 0.5),
            ),
            Container(
              child: Text(
                this.message,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1!,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600,
                    letterSpacing: 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
