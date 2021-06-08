import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart' as Material;
import 'package:flutter/material.dart';
import 'package:invoice/AppTheme.dart';

class SalesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SalesChart(this.seriesList, {this.animate});

  factory SalesChart.withSampleData() {
    return new SalesChart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Material.ThemeData themeData = AppTheme.getTheme();
    return new charts.BarChart(
      seriesList,
      animate: animate,
      domainAxis: charts.OrdinalAxisSpec(
          renderSpec: SmallTickRendererSpec(
              labelStyle: TextStyleSpec(
                  color: Color(
        r: themeData.colorScheme.onBackground.red,
        g: themeData.colorScheme.onBackground.green,
        b: themeData.colorScheme.onBackground.blue,
      )))),
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: SmallTickRendererSpec(
              labelStyle: TextStyleSpec(
                  color: Color(
        r: themeData.colorScheme.onBackground.red,
        g: themeData.colorScheme.onBackground.green,
        b: themeData.colorScheme.onBackground.blue,
      )))),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
      new OrdinalSales('2018', 85),
      new OrdinalSales('2019', 95),
      new OrdinalSales('2020', 35),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.Color.fromHex(code: '#5da695'),
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
