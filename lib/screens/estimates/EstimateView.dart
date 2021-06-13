import 'package:flutter/material.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/core/size_config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EstimateView extends StatefulWidget {
  const EstimateView({Key? key}) : super(key: key);

  @override
  _EstimateViewState createState() => _EstimateViewState();
}

class _EstimateViewState extends State<EstimateView> {
  List<bool> _dataExpansionPanel = [true, false, false, true];
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
          title: Text("Estimate Details",
              style: AppTheme.getTextStyle(themeData.textTheme.headline6!,
                  fontWeight: 600)),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              icon: Icon(MdiIcons.dotsVertical),
            )
          ],
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Estimate Number",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              fontWeight: 600),
                        ),
                        Text("# EST-0004",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1!,
                                fontWeight: 500)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Reference Number",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              fontWeight: 600),
                        ),
                        Text("# REF-2502",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1!,
                                fontWeight: 500)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Estimate Date",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              fontWeight: 600),
                        ),
                        Text("23 Feb 2021",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1!,
                                fontWeight: 500)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Expiry Date",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              fontWeight: 600),
                        ),
                        Text("28 Feb 2021",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1!,
                                fontWeight: 500)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _dataExpansionPanel[index] = !isExpanded;
                        });
                      },
                      animationDuration: Duration(milliseconds: 500),
                      children: <ExpansionPanel>[
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Personal Information",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1!,
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0)));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            MdiIcons.account,
                                            size: MySize.size20,
                                            color:
                                                themeData.colorScheme.primary,
                                          ),
                                        ),
                                        Text("Mr. Shantanu Singh",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2!,
                                                height: 1.4,
                                                fontWeight: 500)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            MdiIcons.email,
                                            size: MySize.size20,
                                            color:
                                                themeData.colorScheme.primary,
                                          ),
                                        ),
                                        Text("shantanusingh0308@gmail.com",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2!,
                                                height: 1.4,
                                                fontWeight: 500,
                                                letterSpacing: 0.3)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            MdiIcons.phone,
                                            size: MySize.size20,
                                            color:
                                                themeData.colorScheme.primary,
                                          ),
                                        ),
                                        Text("9687942759",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle2!,
                                                fontWeight: 500,
                                                height: 1.4)),
                                      ],
                                    ),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[0]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Billing Address",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1!,
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0)));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("J2-1702, The Meadows",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2!,
                                            fontWeight: 500,
                                            height: 1.4)),
                                    Text("Adani Shantigram",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2!,
                                            fontWeight: 500,
                                            height: 1.4)),
                                    Text("Ahmedabad - 382421",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2!,
                                            fontWeight: 500,
                                            height: 1.4)),
                                    Text("Gujarat, India",
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle2!,
                                            fontWeight: 500,
                                            height: 1.4)),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[1]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Items",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1!,
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0)));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 16, right: 16),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text("Product Photography",
                                                  style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1!,
                                                    height: 1.4,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("1 * ₹ 200.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 200.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("SGST (9%)",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 18.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("CGST (9%)",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 18.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("AMOUNT",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 236.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1!,
                                                      color:
                                                          themeData.accentColor,
                                                      fontWeight: 600,
                                                      height: 1.4)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Text("Event Photography",
                                                  style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1!,
                                                    height: 1.4,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("1 * ₹ 4000.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 4000.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("SGST (9%)",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 360.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("CGST (9%)",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 360.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      height: 1.4)),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("AMOUNT",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.caption!,
                                                      xMuted: true)),
                                              Text("₹ 4720.00",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1!,
                                                      color:
                                                          themeData.accentColor,
                                                      fontWeight: 600,
                                                      height: 1.4)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[2]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text("Summary",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1!,
                                          fontWeight: isExpanded ? 700 : 600,
                                          letterSpacing: 0)));
                            },
                            body: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    bottom: 16, top: 0, left: 16, right: 16),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("SUBTOTAL",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption!,
                                                xMuted: true)),
                                        Text("₹ 4200.00",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1!)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("DISCOUNT",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  xMuted: true)),
                                          Text("₹ 0.00",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1!,
                                                  fontWeight: 500)),
                                        ],
                                      ),
                                    ),
                                    Divider(thickness: 0.2),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("SGST (9%)",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  xMuted: true)),
                                          Text("₹ 378.00",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1!,
                                                  fontWeight: 500)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("CGST (9%)",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  xMuted: true)),
                                          Text("₹ 378.00",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1!,
                                                  fontWeight: 500)),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("TOTAL AMOUNT",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  fontWeight: 600,
                                                  xMuted: true)),
                                          Text("₹ 4956.00",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.subtitle1!,
                                                  color: themeData.primaryColor,
                                                  fontWeight: 800)),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[3])
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: customAppTheme.bgLayer1,
            child: Padding(
              padding: EdgeInsets.all(MySize.size0!),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text("ACTIONS",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.caption!,
                            fontWeight: 600)),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(MdiIcons.twitterRetweet,
                        color: themeData.colorScheme.primary),
                    title: Text("Convert to Invoice",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1!,
                            color: themeData.colorScheme.primary,
                            fontWeight: 600)),
                  ),
                  ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.emailOutline,
                          color: themeData.colorScheme.primary),
                      title: Text("Send Estimate",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1!,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600))),
                  ListTile(
                      dense: true,
                      leading: Icon(MdiIcons.whatsapp,
                          color: themeData.colorScheme.primary),
                      title: Text("Share on Whatsapp",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1!,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600))),
                  ListTile(
                      dense: true,
                      leading: Icon(
                        MdiIcons.deleteOutline,
                        color: themeData.colorScheme.error,
                      ),
                      title: Text("Delete",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1!,
                              color: themeData.colorScheme.error,
                              fontWeight: 600))),
                ],
              ),
            ),
          );
        });
  }
}
