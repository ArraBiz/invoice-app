import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/screens/profile/Profile.dart';
import 'package:invoice/screens/settings/Settings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ABAppBar extends StatelessWidget {
  final String title;

  const ABAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    CustomAppTheme customAppTheme = AppTheme.getCustomAppTheme();
    var now = new DateTime.now();
    var formatter = new DateFormat('dd MMM, yyyy');
    String formattedNow = formatter.format(now);
    return Container(
      margin: Spacing.fromLTRB(24, 0, 24, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today $formattedNow',
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2!,
                      fontWeight: 400,
                      letterSpacing: 0,
                      color: themeData.colorScheme.onBackground),
                ),
                Container(
                  child: Text(
                    this.title,
                    style: AppTheme.getTextStyle(themeData.textTheme.headline5!,
                        fontSize: 24,
                        fontWeight: 700,
                        letterSpacing: -0.3,
                        color: themeData.colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Container(
              padding: Spacing.all(10),
              decoration: BoxDecoration(
                  color: customAppTheme.bgLayer3,
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.shadowColor,
                        blurRadius: MySize.size4!)
                  ]),
              child: Icon(MdiIcons.briefcaseAccountOutline,
                  color: themeData.colorScheme.primary),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
            child: Container(
              padding: Spacing.all(10),
              decoration: BoxDecoration(
                  color: customAppTheme.bgLayer3,
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                  boxShadow: [
                    BoxShadow(
                        color: customAppTheme.shadowColor,
                        blurRadius: MySize.size4!)
                  ]),
              child: Icon(MdiIcons.cogOutline,
                  color: themeData.colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
