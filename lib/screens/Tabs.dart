import 'package:flutter/material.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/screens/customers/customer_form.dart';
import 'package:invoice/screens/products/Products.dart';
import 'package:invoice/widgets/CustomBottomNavigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Dashboard.dart';
import 'customers/customer_list.dart';
import 'estimates/Estimates.dart';
import 'invoices/Invoices.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  late ThemeData themeData;
  late PageController _pageController;

  late NavigationBarTheme navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    navigationBarTheme = AppTheme.getNavigationTheme();

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Dashboard(),
            Estimates(),
            Invoices(),
            CustomerList(),
            Products()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: navigationBarTheme.selectedOverlayColor!,
        backgroundColor: navigationBarTheme.backgroundColor!,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
              title: "Dashboard",
              icon: Icon(MdiIcons.viewDashboardOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.viewDashboard, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          CustomBottomNavigationBarItem(
              title: "Estimates",
              icon: Icon(MdiIcons.fileDocumentOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.fileCompare, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          CustomBottomNavigationBarItem(
              title: "Invoices",
              icon: Icon(MdiIcons.fileCheckOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.fileCheck, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          CustomBottomNavigationBarItem(
              title: "Customers",
              icon: Icon(
                MdiIcons.accountMultipleOutline,
                size: MySize.size22,
              ),
              activeIcon: Icon(
                MdiIcons.accountMultiple,
                size: MySize.size22,
              ),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          CustomBottomNavigationBarItem(
              title: "Products",
              icon: Icon(
                MdiIcons.packageVariantClosed,
                size: MySize.size22,
              ),
              activeIcon: Icon(
                MdiIcons.packageVariant,
                size: MySize.size22,
              ),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showBottomSheet(context);
      //   },
      //   child: Icon(
      //     MdiIcons.flashOutline,
      //     size: MySize.size30,
      //     color: themeData.colorScheme.onPrimary,
      //   ),
      // ),
    );
  }

  void _showBottomSheet(context) {
    CustomAppTheme customAppTheme;

    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          customAppTheme = AppTheme.getCustomAppTheme();
          return Container(
            decoration: BoxDecoration(
                color: customAppTheme.bgLayer1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MySize.size16!),
                    topRight: Radius.circular(MySize.size16!))),
            child: Padding(
              padding: EdgeInsets.all(MySize.size16!),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Quick Action",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle1!,
                        fontWeight: 700),
                  ),
                  Divider(),
                  Container(
                    // margin: EdgeInsets.only(top: MySize.size16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _QuickActionWidget(
                              iconData: MdiIcons.fileCompare,
                              actionText: 'Estimate',
                              onTap: () {},
                            ),
                            _QuickActionWidget(
                              iconData: MdiIcons.fileCheckOutline,
                              actionText: 'Invoice',
                              onTap: () {},
                            ),
                            _QuickActionWidget(
                              iconData: MdiIcons.accountPlusOutline,
                              actionText: 'Customer',
                              onTap: () {
                                // Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => CustomerCreate(), fullscreenDialog: true),
                                // );
                              },
                            ),
                            _QuickActionWidget(
                              iconData: MdiIcons.packageVariant,
                              actionText: 'Product',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}

class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;
  final void Function() onTap;

  _QuickActionWidget(
      {Key? key,
      required this.iconData,
      required this.actionText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: MySize.size52,
                    height: MySize.size52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: onTap,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size4!),
            child: Text(
              actionText,
              style: AppTheme.getTextStyle(themeData.textTheme.caption!,
                  fontWeight: 600),
            ),
          )
        ],
      ),
    );
  }
}
