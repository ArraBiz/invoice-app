import 'package:flutter/material.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/screens/invoices/InvoiceView.dart';
import 'package:invoice/widgets/CustomAppBar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  _InvoicesState createState() => _InvoicesState();
}

class SingleInvoice {
  String no, name, date, amount;

  SingleInvoice(this.no, this.name, this.amount, this.date);
}

class _InvoicesState extends State<Invoices> {
  late List<SingleInvoice> _invoiceList;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    _invoiceList = [
      SingleInvoice("INV-0001", "Shantanu Singh", "₹ 4500.00", "23 Feb 2021"),
    ];
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        body: Container(
          padding: Spacing.only(top: 48),
          child: Column(
            children: [
              CustomAppBar(title: "Invoices"),
              Container(
                margin: Spacing.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: customAppTheme.bgLayer3,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
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
                                    hintText: "Search invoices",
                                    hintStyle: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2!,
                                        letterSpacing: 0,
                                        color:
                                            themeData.colorScheme.onBackground,
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(MySize.size4!),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.primary,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8!))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(MySize.size8!),
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
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext buildContext) {
                              return SortBottomSheet();
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: MySize.size16!),
                        decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8!)),
                          boxShadow: [
                            BoxShadow(
                              color: customAppTheme.shadowColor,
                              blurRadius: MySize.size4!,
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(MySize.size8!),
                        child: Icon(
                          MdiIcons.sort,
                          color: themeData.colorScheme.primary,
                          size: MySize.size20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: _invoiceList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: themeData.primaryColor,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.emailOutline,
                              color: themeData.colorScheme.onPrimary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Send Invoice",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2!,
                                      fontWeight: 500,
                                      color: themeData.colorScheme.onPrimary)),
                            )
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        color: themeData.errorColor,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: AlignmentDirectional.centerEnd,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Delete",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2!,
                                    fontWeight: 500,
                                    color: customAppTheme.onError)),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                MdiIcons.deleteOutline,
                                color: customAppTheme.onError,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          setState(() {
                            _invoiceList.removeAt(index);
                            showSnackbarWithFloating("Deleted");
                          });
                        } else {
                          setState(() {
                            _invoiceList.removeAt(index);
                            showSnackbarWithFloating("Invoice Sent");
                          });
                        }
                      },
                      key: UniqueKey(),
                      child: Container(
                        // margin: Spacing.bottom(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: customAppTheme.bgLayer4, width: 1),
                        ),
                        padding:
                            Spacing.symmetric(vertical: 16, horizontal: 24),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InvoiceView()));
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: Spacing.left(0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MySize.size2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _invoiceList[index].name,
                                              style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1!,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500,
                                              ),
                                            ),
                                            Text(
                                              _invoiceList[index].amount,
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1!,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  fontWeight: 700),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: MySize.size2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _invoiceList[index].no,
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  xMuted: true),
                                            ),
                                            Text(
                                              _invoiceList[index].date,
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption!,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  xMuted: true),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void showSnackbarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: themeData.textTheme.subtitle2!
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.size16!),
                topRight: Radius.circular(MySize.size16!))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MySize.size16!,
              left: MySize.size24!,
              right: MySize.size24!,
              bottom: MySize.size16!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MySize.size8!),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 0;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 0;
                              });
                            },
                            groupValue: _radioValue,
                            value: 0,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Date - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2!,
                                  fontWeight: 600)),
                          Text("Newest to Oldest",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2!,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 1;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 1;
                              });
                            },
                            groupValue: _radioValue,
                            value: 1,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text("Date - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2!,
                                  fontWeight: 600)),
                          Text("Oldest to Newest",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2!,
                                  fontWeight: 500)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
