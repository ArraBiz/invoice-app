import 'package:flutter/material.dart';
import 'package:invoice/AppTheme.dart';
import 'package:invoice/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        appBar: AppBar(
          backgroundColor: customAppTheme.bgLayer1,
          elevation: 0,
          leading: IconButton(
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              MdiIcons.chevronLeft,
              color: themeData.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: Text("Settings",
              style: AppTheme.getTextStyle(
                  themeData.appBarTheme.textTheme.headline6,
                  fontWeight: 600)),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: MySize.size8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.lockOutline,
                        size: MySize.size24,
                        color: themeData.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Text("Security",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: themeData.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: MySize.size8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.faceAgent,
                        size: MySize.size24,
                        color: themeData.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Text("Help \& Support",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: MySize.size24,
                        color: themeData.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: MySize.size8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.helpCircleOutline,
                        size: 24, color: themeData.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Text("About",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 600)),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: MySize.size24,
                        color: themeData.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
          ],
        ));
  }
}
