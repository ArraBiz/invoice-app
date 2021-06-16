import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';

class ABSearchBar extends StatefulWidget {
  final String placeholder;
  final void Function(String)? onChanged;

  const ABSearchBar({Key? key, required this.placeholder, this.onChanged})
      : super(key: key);

  @override
  _ABSearchBarState createState() => _ABSearchBarState();
}

class _ABSearchBarState extends State<ABSearchBar> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    setState(() {
      themeData = AppTheme.getTheme();
      customAppTheme = AppTheme.getCustomAppTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Spacing.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: customAppTheme.bgLayer3,
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              ),
              padding: Spacing.all(6),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16!),
                      child: TextField(
                        onChanged: widget.onChanged,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2!,
                            letterSpacing: 0,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          hintText: widget.placeholder,
                          hintStyle: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2!,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              muted: true),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0),
                        ),
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
