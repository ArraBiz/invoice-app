import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchBar extends StatefulWidget {
  final String placeholder;

  const SearchBar({Key? key, required this.placeholder}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
                      child: TextFormField(
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
                              fontWeight: 500),
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
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MySize.size4!),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(MySize.size8!),
                      child: Icon(
                        MdiIcons.magnify,
                        color: themeData.colorScheme.onPrimary,
                        size: MySize.size20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
