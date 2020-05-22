import 'package:allinone/main.dart';
import 'package:allinone/neumorphic_expenses/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'categories_row.dart';
import 'pie_chart_view.dart';

class MontlyExpensesView extends StatefulWidget {
  @override
  _MontlyExpensesViewState createState() => _MontlyExpensesViewState();
}

class _MontlyExpensesViewState extends State<MontlyExpensesView> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      checkLoginStatus();
    });
  }

  checkLoginStatus() async {
    pref = await SharedPreferences.getInstance();
    token = pref.getString("token");
    id = pref.getString("id");
    final result = await pekopService.getMontlyTotal(
        "2020-04-29", "2020-05-05", id, token);
    setState(() {
      kCategories = [
        Category('Room', amount: result.data.room),
        Category('Out', amount: result.data.out),
        Category('Restaurant', amount: result.data.restaurant),
      ];
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Income"),
      ),
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: _isLoading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: height * 0.065),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                CategoriesRow(),
                                PieChartView(),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
