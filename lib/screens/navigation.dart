import 'package:allinone/neumorphic_expenses/monthly_expenses_view.dart';
import 'package:allinone/screens/date_table.dart';
import 'package:allinone/screens/point_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'main_dashboard.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();

  final MontlyExpensesView _montlyExpensesView = MontlyExpensesView();
  final Dashboard _dashboard = new Dashboard();
  final PointLineChart _pointLineChart = new PointLineChart();
  final DateTable _dateTable = new DateTable();

  Widget _showPage = new MontlyExpensesView();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _montlyExpensesView;
        break;
      case 1:
        return _dashboard;
        break;
      case 2:
        return _pointLineChart;
        break;
      case 3:
        return _dateTable;
        break;
      default:
        return new Container(
            child: new Center(child: new Text('No page Found')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _page,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
            // child: Column(
            //   children: <Widget>[
            //     Text(_page.toString(), textScaleFactor: 10.0),
            //     RaisedButton(
            //       child: Text('Go To Page of index 1'),
            //       onPressed: () {
            //         final CurvedNavigationBarState navBarState =
            //             _bottomNavigationKey.currentState;
            //         navBarState.setPage(1);
            //       },
            //     )
            //   ],
            // ),
          ),
        ));
  }
}
