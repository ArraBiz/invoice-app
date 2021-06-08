import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../AppTheme.dart';
import '../SizeConfig.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<CustomBottomNavigationBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;
  final Color selectedItemOverlayColor;
  final TextStyle textStyle;

  CustomBottomNavigation({
    Key key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onItemSelected,
    this.curve = Curves.linear,
    this.selectedItemOverlayColor = const Color(0xffffffff),
    this.textStyle,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
    assert(curve != null);
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    final bgColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            BoxShadow(
              color: Colors.black.withAlpha(16),
              blurRadius: MySize.size8,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                  selectedOverlayColor: selectedItemOverlayColor,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final CustomBottomNavigationBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;
  final Color selectedOverlayColor;

  const _ItemWidget({
    Key key,
    @required this.item,
    @required this.isSelected,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.itemCornerRadius,
    @required this.iconSize,
    this.curve = Curves.linear,
    @required this.selectedOverlayColor,
  })  : assert(isSelected != null),
        assert(item != null),
        assert(backgroundColor != null),
        assert(animationDuration != null),
        assert(itemCornerRadius != null),
        assert(iconSize != null),
        assert(curve != null),
        assert(selectedOverlayColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 130 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color: isSelected ? selectedOverlayColor : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 130 : 50,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconTheme(
                    data: IconThemeData(
                      size: iconSize,
                      color: isSelected
                          ? item.activeColor.withOpacity(1)
                          : item.inactiveColor == null
                              ? item.activeColor
                              : item.inactiveColor,
                    ),
                    child: isSelected
                        ? (item.activeIcon != null
                            ? item.activeIcon
                            : item.icon)
                        : item.icon,
                  ),
                  if (isSelected)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        item.title,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: item.activeColor,
                            fontWeight: 700,letterSpacing: 0),
                        maxLines: 1,
                        textAlign: item.textAlign,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final Icon icon;
  final String title;
  final Color activeColor;
  final Icon activeIcon;
  final Color inactiveColor;
  final TextAlign textAlign;

  CustomBottomNavigationBarItem({
    @required this.icon,
    @required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.activeIcon,
    this.inactiveColor,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}