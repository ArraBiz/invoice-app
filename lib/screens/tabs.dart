import 'package:flutter/material.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/screens/products/Products.dart';
import 'package:invoice/widgets/bottom_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'customers/customer_list.dart';
import 'dashboard.dart';
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
  late NavigationBarTheme navigationBarTheme;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    themeData = AppTheme.getTheme();
    navigationBarTheme = AppTheme.getNavigationTheme();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: ABBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: navigationBarTheme.selectedOverlayColor!,
        backgroundColor: navigationBarTheme.backgroundColor!,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <ABBottomNavigationBarItem>[
          ABBottomNavigationBarItem(
              title: "Dashboard",
              icon: Icon(MdiIcons.viewDashboardOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.viewDashboard, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          ABBottomNavigationBarItem(
              title: "Estimates",
              icon: Icon(MdiIcons.fileDocumentOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.fileCompare, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          ABBottomNavigationBarItem(
              title: "Invoices",
              icon: Icon(MdiIcons.fileCheckOutline, size: MySize.size22),
              activeIcon: Icon(MdiIcons.fileCheck, size: MySize.size22),
              activeColor: navigationBarTheme.selectedItemColor!,
              inactiveColor: navigationBarTheme.unselectedItemColor!),
          ABBottomNavigationBarItem(
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
          ABBottomNavigationBarItem(
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
    );
  }
}
