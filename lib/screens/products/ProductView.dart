import 'package:flutter/material.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/core/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

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
          title: Text("Product Details",
              style: AppTheme.getTextStyle(themeData.textTheme.headline6!,
                  fontWeight: 600)),
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Product Name",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                      fontWeight: 600),
                ),
                Text("Product One",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
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
                  "Price",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                      fontWeight: 600),
                ),
                Text("₹ 4500.00",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
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
                  "Unit",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                      fontWeight: 600),
                ),
                Text("pc",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
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
                  "Description",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                      fontWeight: 600),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2!,
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
                        BorderRadius.all(Radius.circular(MySize.size12!)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.primaryColor.withAlpha(24),
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: MySize.size24!),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: themeData.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MySize.size12!)),
                      padding: EdgeInsets.only(
                          top: MySize.size16!, bottom: MySize.size16!),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Edit".toUpperCase(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2!,
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
                        BorderRadius.all(Radius.circular(MySize.size12!)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.errorColor.withAlpha(24),
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: MySize.size24!),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: themeData.errorColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MySize.size12!)),
                      padding: EdgeInsets.only(
                          top: MySize.size16!, bottom: MySize.size16!),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Delete".toUpperCase(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2!,
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
