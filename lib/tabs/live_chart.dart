import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/cupertino.dart';


class SimpleSeriesLegend extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleSeriesLegend(this.seriesList, {this.animate});

  factory SimpleSeriesLegend.withSampleData() {
    return new SimpleSeriesLegend(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.SeriesLegend()],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('WSP1', 5),
      new OrdinalSales('WSP2', 25),
      new OrdinalSales('WSP3', 80),
      new OrdinalSales('WSP4', 75),
      new OrdinalSales('WSP5', 65),
      new OrdinalSales('WSP6', 55),
      new OrdinalSales('WSP7', 70),
      new OrdinalSales('WSP8', 90),
    ];

    final tabletSalesData = [
      new OrdinalSales('WSP1', 5),
      new OrdinalSales('WSP2', 25),
      new OrdinalSales('WSP3', 85),
      new OrdinalSales('WSP4', 75),
      new OrdinalSales('WSP5', 65),
      new OrdinalSales('WSP6', 55),
      new OrdinalSales('WSP7', 70),
      new OrdinalSales('WSP8', 90),
    ];

    final mobileSalesData = [
      new OrdinalSales('WSP1', 5),
      new OrdinalSales('WSP2', 25),
      new OrdinalSales('WSP3', 95),
      new OrdinalSales('WSP4', 75),
      new OrdinalSales('WSP5', 65),
      new OrdinalSales('WSP6', 55),
      new OrdinalSales('WSP7', 70),
      new OrdinalSales('WSP8', 90),
    ];

    final otherSalesData = [
      new OrdinalSales('WSP1', 5),
      new OrdinalSales('WSP2', 25),
      new OrdinalSales('WSP3', 95),
      new OrdinalSales('WSP4', 75),
      new OrdinalSales('WSP5', 65),
      new OrdinalSales('WSP6', 55),
      new OrdinalSales('WSP7', 70),
      new OrdinalSales('WSP8', 90),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'WZG1',
        domainFn: (OrdinalSales sales, _) => sales.wsp,
        measureFn: (OrdinalSales sales, _) => sales.belastung,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'WZG2',
        domainFn: (OrdinalSales sales, _) => sales.wsp,
        measureFn: (OrdinalSales sales, _) => sales.belastung,
        data: tabletSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'WZG3',
        domainFn: (OrdinalSales sales, _) => sales.wsp,
        measureFn: (OrdinalSales sales, _) => sales.belastung,
        data: mobileSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'WZG4',
        domainFn: (OrdinalSales sales, _) => sales.wsp,
        measureFn: (OrdinalSales sales, _) => sales.belastung,
        data: otherSalesData,
      ),
    ];
  }

}
/// Sample ordinal data type.
class OrdinalSales {
  final String wsp;
  final int belastung;

  OrdinalSales(this.wsp, this.belastung);
}
