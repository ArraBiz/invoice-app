import 'package:flutter/material.dart';
import 'package:invoice/AppTheme.dart';
import 'package:invoice/SizeConfig.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomerView extends StatefulWidget {
  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();

    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: Text("Customer Details",
              style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                  fontWeight: 600)),
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Customer Name",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600),
                ),
                Text("Shantanu Rajan Singh",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 500)),
              ],
            ),
            Divider(
              thickness: .2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Mobile Number",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600),
                ),
                Text("+91 8238508418",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 500)),
              ],
            ),
            Divider(
              thickness: .2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Customer Email",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600),
                ),
                Text("shantanusingh0308@gmail.com",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        fontWeight: 500)),
              ],
            ),
            Divider(
              thickness: .2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Billing Address",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      fontWeight: 600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("J2-1702, The Meadows",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500,
                            height: 1.4)),
                    Text("Adani Shantigram",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500,
                            height: 1.4)),
                    Text("Ahmedabad - 382421",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500,
                            height: 1.4)),
                    Text("Gujarat, India",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 500,
                            height: 1.4)),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size12)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.primaryColor.withAlpha(24),
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: MySize.size24),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: themeData.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MySize.size12)),
                      padding: EdgeInsets.only(
                          top: MySize.size16, bottom: MySize.size16),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit".toUpperCase(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 600,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size12)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.errorColor.withAlpha(24),
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: MySize.size24),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: themeData.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MySize.size12)),
                      padding: EdgeInsets.only(
                          top: MySize.size16, bottom: MySize.size16),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Delete".toUpperCase(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 600,
                          color: customAppTheme.onError,
                          letterSpacing: 0.5),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
