import 'package:flutter/material.dart';
import 'package:invoice/AppTheme.dart';
import 'package:invoice/SizeConfig.dart';
import 'package:invoice/screens/customers/CustomerView.dart';
import 'package:invoice/widgets/CustomAppBar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class SingleCustomer {
  String name, number;

  SingleCustomer(this.name, this.number);
}

class _CustomersState extends State<Customers> {
  List<SingleCustomer> _customerList;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    _customerList = [
      SingleCustomer("Zahra Tate", "+1 987456321"),
      SingleCustomer("Willard Palmer", "+4 154789632"),
      SingleCustomer("Charlotte Small", "+1 521478963"),
      SingleCustomer("Stanley Lindsey", "+18 123654789"),
      SingleCustomer("Ebony Bowman", "+4 987456321"),
      SingleCustomer("Rosa Lloyd", "+91 789456321"),
      SingleCustomer("Shane Roman", "+1 147852369"),
      SingleCustomer("Ashley Cruz", "+14 159632147"),
      SingleCustomer("Elle Mendoza", "+78 697412369"),
      SingleCustomer("Kieron Lucero", "+178 52314569"),
      SingleCustomer("Mitchell Brady", "0291 215496"),
      SingleCustomer("Casey Calderon", "+1 125893478"),
      SingleCustomer("Jodie Caldwell", "+1 147852369"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        body: Container(
      padding: Spacing.only(top: 48),
      color: customAppTheme.bgLayer1,
      child: Column(
        children: [
          CustomAppBar(title: "Customers"),
          Container(
            margin: Spacing.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: customAppTheme.bgLayer3,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8)),
                    ),
                    padding: Spacing.all(6),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: MySize.size16),
                            child: TextFormField(
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  letterSpacing: 0,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              decoration: InputDecoration(
                                hintText: "Search customers",
                                hintStyle: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    letterSpacing: 0,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 500),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8),
                                    ),
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8),
                                    ),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size8),
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
                          padding: EdgeInsets.all(MySize.size4),
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primary,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size8))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(MySize.size8),
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
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: _customerList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    color: themeData.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          MdiIcons.accountEditOutline,
                          color: themeData.colorScheme.onPrimary,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("Edit",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
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
                                themeData.textTheme.bodyText2,
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
                        showSnackbarWithFloating("Deleted");
                      });
                    } else {
                      setState(() {
                        showSnackbarWithFloating("Edited");
                      });
                    }
                  },
                  key: UniqueKey(),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerView()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16, left: 24, right: 24, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            child: Text(_customerList[index].name[0],
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    color: themeData.colorScheme.onSecondary,
                                    fontWeight: 700)),
                            backgroundColor: themeData.colorScheme.secondary,
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                children: <Widget>[
                                  Text(_customerList[index].name,
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600)),
                                  Text(_customerList[index].number,
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          fontWeight: 500)),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
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
          style: themeData.textTheme.subtitle2
              .merge(TextStyle(color: themeData.colorScheme.onPrimary)),
        ),
        backgroundColor: themeData.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
