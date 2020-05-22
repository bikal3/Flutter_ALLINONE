import 'package:allinone/model/api_response.dart';
import 'package:allinone/model/income_model.dart';
import 'package:allinone/services/pekop_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}

class _DashboardState extends State<Dashboard> {
  double total;
  SharedPreferences pref;
  String token, id;
  PekopService get pekopService => GetIt.instance<PekopService>();
  List<Color> colorlist = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
  ];
  // Future<APIResponse<IncomeModel>> result;
  List<ChartData> chartData;

  Map<String, double> dataMap = new Map();

  @override
  void initState() {
    // TODO: implement initState
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    id = pref.getString("id");
    final result = await pekopService.getMontlyTotal(
        "2020-04-29", "2020-05-05", id, token);
    setState(() {
      total = result.data.total;
      // final results = await pekopService.getMontlyTotal(
      //     "2020-04-29", "2020-05-05", id, token);
      // String text = results.data.creator.toString();
      chartData = [
        ChartData('David', result.data.room, Color.fromRGBO(9, 0, 136, 1)),
        ChartData(
            'Steve', result.data.restaurant, Color.fromRGBO(147, 0, 119, 1)),
        ChartData('Jack', result.data.out, Color.fromRGBO(228, 0, 124, 1)),
        ChartData('Others', 5000, Color.fromRGBO(255, 189, 57, 1))
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chart"),
        ),
        body: Container(
          height: 250.0,
          width: 250.0,
          alignment: Alignment.topRight,
          child: Container(
              alignment: Alignment.topRight,
              child: SfCircularChart(
                  tooltipBehavior: TooltipBehavior(
                      enable: true, tooltipPosition: TooltipPosition.pointer),
                  annotations: <CircularChartAnnotation>[
                    CircularChartAnnotation(
                        widget: Container(
                            alignment: Alignment.topRight,
                            child: PhysicalModel(
                                child: Container(),
                                shape: BoxShape.circle,
                                elevation: 10,
                                shadowColor: Colors.black,
                                color:
                                    const Color.fromRGBO(230, 230, 230, 1)))),
                    CircularChartAnnotation(
                        widget: Container(
                            child: Text("$total",
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 25))))
                  ],
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        // Radius of doughnut
                        innerRadius: '70%',
                        radius: '40%')
                  ])),
        ));
  }
}
