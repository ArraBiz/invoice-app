import 'package:flutter/material.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/widgets/CustomAppBar.dart';
import 'package:invoice/widgets/SalesChart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey _simpleMenuKey = new GlobalKey();
  bool connected = false;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  List<String> _simpleChoice = ["Weekly", "Monthly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        body: Column(
          children: [
            Container(
              child: CustomAppBar(title: "Dashboard"),
              padding: EdgeInsets.only(top: 48, bottom: 12),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size24!, right: MySize.size24!),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "OVERVIEW",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption!,
                              fontWeight: 600),
                        ),
                        PopupMenuButton(
                            padding: EdgeInsets.all(0),
                            key: _simpleMenuKey,
                            itemBuilder: (BuildContext context) {
                              return _simpleChoice.map((String choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Text(choice,
                                      style: TextStyle(letterSpacing: 0.15)
                                          .merge(themeData.textTheme.bodyText2!
                                              .merge(TextStyle(
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  letterSpacing: 0.2)))),
                                );
                              }).toList();
                            },
                            child: InkWell(
                                onTap: () {
                                  dynamic state = _simpleMenuKey.currentState;
                                  state.showButtonMenu();
                                },
                                child: Container(
                                  padding: Spacing.all(4),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size4!)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: customAppTheme.shadowColor,
                                            blurRadius: MySize.size2)
                                      ]),
                                  child: Icon(MdiIcons.filterVariant,
                                      size: MySize.size20,
                                      color: themeData.colorScheme.onPrimary),
                                ))),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MySize.size8!,
                          bottom: MySize.size16!,
                          left: MySize.size24!,
                          right: MySize.size24!),
                      padding: EdgeInsets.all(MySize.size6!),
                      decoration: BoxDecoration(
                        color: customAppTheme.bgLayer3,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8!)),
                        border: Border.all(
                            width: 0.7, color: customAppTheme.bgLayer3),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor!.withAlpha(28),
                              blurRadius: MySize.size4!,
                              offset: Offset.zero),
                        ],
                      ),
                      child: Container(
                          height: 200,
                          child: Center(
                            child: SalesChart.withSampleData(),
                          ))),
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size24!, top: MySize.size16!),
                    child: Text(
                      "DUE INVOICES",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption!,
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MySize.size8!,
                        bottom: MySize.size16!,
                        left: MySize.size24!,
                        right: MySize.size24!),
                    padding: EdgeInsets.all(MySize.size4!),
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer3,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                      border: Border.all(
                          width: 0.7, color: customAppTheme.bgLayer3),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.cardTheme.shadowColor!.withAlpha(28),
                          blurRadius: MySize.size4!,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        _SingleActivity(
                          title: 'Bittu Patel',
                          subtitle: '03 Feb 2021',
                          activity: '₹ 1200.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        _SingleActivity(
                          title: 'Shantanu Singh',
                          subtitle: '18 Feb 2021 ',
                          activity: '₹ 2400.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        _SingleActivity(
                          title: 'Harshil Solanki',
                          subtitle: '23 Feb 2021 ',
                          activity: '₹ 4500.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        Container(
                          child: Center(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide.none,
                                ),
                                onPressed: () {},
                                child: Text("VIEW ALL",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption!,
                                        color: themeData.colorScheme.primary,
                                        letterSpacing: 0.5,
                                        fontWeight: 600))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size24!, top: MySize.size16!),
                    child: Text(
                      "RECENT ESTIMATES",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption!,
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MySize.size8!,
                        bottom: MySize.size16!,
                        left: MySize.size24!,
                        right: MySize.size24!),
                    padding: EdgeInsets.all(MySize.size4!),
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer3,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8!)),
                      border: Border.all(
                        width: 0.7,
                        color: customAppTheme.bgLayer3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.cardTheme.shadowColor!.withAlpha(28),
                          blurRadius: MySize.size4!,
                          offset: Offset.zero,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        _SingleActivity(
                          title: 'Harsh Soni',
                          subtitle: '03 Feb 2021',
                          activity: '₹ 1200.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        _SingleActivity(
                          title: 'Nitin Solanki',
                          subtitle: '18 Feb 2021 ',
                          activity: '₹ 2400.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        _SingleActivity(
                          title: 'Ronak Soni',
                          subtitle: '23 Feb 2021 ',
                          activity: '₹ 4500.00',
                          activityColor: themeData.colorScheme.primary,
                        ),
                        Divider(
                          thickness: 0.2,
                        ),
                        Container(
                          child: Center(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide.none,
                                ),
                                onPressed: () {},
                                child: Text("VIEW ALL",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption!,
                                        color: themeData.colorScheme.primary,
                                        letterSpacing: 0.5,
                                        fontWeight: 600))),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class _SingleActivity extends StatelessWidget {
  final String title, subtitle, activity;
  final Color activityColor;

  const _SingleActivity(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.activity,
      required this.activityColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
          top: MySize.size8!,
          bottom: MySize.size8!,
          left: MySize.size16!,
          right: MySize.size16!),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                      fontWeight: 700)),
              Text(subtitle,
                  style: AppTheme.getTextStyle(themeData.textTheme.caption!,
                      fontWeight: 400)),
            ],
          ),
          Text(activity,
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                  fontWeight: 600, color: activityColor, letterSpacing: 0)),
        ],
      ),
    );
  }
}
