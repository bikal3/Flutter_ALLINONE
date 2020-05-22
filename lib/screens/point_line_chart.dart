import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PointLineChart extends StatefulWidget {
  @override
  _PointLineChartState createState() => _PointLineChartState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}

class _PointLineChartState extends State<PointLineChart> {
  final List<SalesData> chartData = [
    SalesData(1, 35),
    SalesData(2, 28),
    SalesData(3, 34),
    SalesData(4, 32),
    SalesData(5, 40),
    SalesData(6, 35),
    SalesData(7, 28),
    SalesData(8, 34),
    SalesData(9, 32),
    SalesData(10, 40),
    SalesData(11, 35),
    SalesData(12, 28),
    SalesData(13, 34),
    SalesData(14, 32),
    SalesData(15, 40),
    SalesData(16, 35),
    SalesData(17, 28),
    SalesData(18, 34),
    SalesData(19, 32),
    SalesData(20, 40),
    SalesData(21, 35),
    SalesData(22, 28),
    SalesData(23, 0),
    SalesData(24, 0),
    SalesData(25, 0),
    SalesData(26, 0),
    SalesData(27, 0),
    SalesData(28, 0),
    SalesData(29, 0),
    SalesData(30, 0),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Container(
          height: height * 0.3,
          child: Container(
              child: SfCartesianChart(
                  primaryYAxis: NumericAxis(minimum: 30, isVisible: false),
                  tooltipBehavior: TooltipBehavior(
                      enable: true, tooltipPosition: TooltipPosition.pointer),
                  series: <ChartSeries>[
                // Renders spline chart
                SplineSeries<SalesData, double>(
                  dataSource: chartData,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  markerSettings: MarkerSettings(isVisible: true),
                  enableTooltip: true,
                )
              ]))),
    ));
  }
}
