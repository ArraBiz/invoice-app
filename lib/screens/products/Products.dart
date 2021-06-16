import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/screens/products/ProductView.dart';
import 'package:invoice/widgets/app_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class SingleProduct {
  String name, amount;

  SingleProduct(this.name, this.amount);
}

class _ProductsState extends State<Products> {
  late List<SingleProduct> _productList;
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
    _productList = [
      SingleProduct("Product One", "₹ 4500.00"),
      SingleProduct("Product Two", "₹ 4500.00"),
      SingleProduct("Product Three", "₹ 4500.00"),
      SingleProduct("Product Four", "₹ 4500.00"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        backgroundColor: customAppTheme.bgLayer1,
        body: Container(
          padding: Spacing.only(top: 48),
          child: Column(
            children: [
              ABAppBar(title: "Products"),
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
                                    hintText: "Search products",
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
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: _productList.length,
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
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductView()));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 24.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Text(_productList[index].name,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1!,
                                                fontWeight: 600)),
                                        Text(_productList[index].amount,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText2!,
                                                fontWeight: 500)),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.2,
                              height: 0,
                            )
                          ],
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
