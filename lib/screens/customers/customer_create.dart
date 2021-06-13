import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/models/customer.dart';
import 'package:invoice/objectbox.g.dart';
import 'package:invoice/repositories/customer_repository.dart';
import 'package:invoice/repositories/database_repository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CustomerCreate extends StatefulWidget {
  final Store store;

  const CustomerCreate({Key? key, required this.store}) : super(key: key);

  @override
  _CustomerCreateState createState() => _CustomerCreateState();
}

class _CustomerCreateState extends State<CustomerCreate> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    themeData = AppTheme.getTheme();
    customAppTheme = AppTheme.getCustomAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customAppTheme.bgLayer1,
      appBar: AppBar(
        backgroundColor: customAppTheme.bgLayer1,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            MdiIcons.chevronLeft,
            color: themeData.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        title: Text("Create customer",
            style: AppTheme.getTextStyle(themeData.textTheme.headline6!,
                fontWeight: 700)),
      ),
      body: ListView(
              padding: EdgeInsets.all(MySize.size16!),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Text("Personal information",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1!,
                          fontWeight: 600,
                          letterSpacing: 0)),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size12!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2!,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.background,
                            isDense: true,
                          ),
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size12!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2!,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.background,
                            isDense: true,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size12!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2!,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.background,
                            isDense: true,
                          ),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!, bottom: 0),
                  child: Text("Billing information",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1!,
                          fontWeight: 600,
                          letterSpacing: 0)),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16!),
                        child: TextFormField(
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle2!,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            hintText: "Address",
                            hintStyle: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2!,
                                letterSpacing: 0,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: themeData.colorScheme.background,
                            isDense: true,
                          ),
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size24!),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size4!)),
                        boxShadow: [
                          BoxShadow(
                            color: themeData.colorScheme.primary.withAlpha(28),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          final customer = Customer(
                              name: "Bittu Patel",
                              email: "bittupatel80@gmail.com",
                              mobile: "8238508418",
                              address: "Ranip");

                          CustomerRepository().create(widget.store, customer);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "SAVE",
                          style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2!,
                                  fontWeight: 600)
                              .merge(TextStyle(
                                  color: themeData.colorScheme.onPrimary)),
                        ),
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(Spacing.xy(16, 0))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
