import 'dart:convert';

import 'package:allinone/model/api_response.dart';
import 'package:allinone/model/formModel/login_model.dart';
import 'package:allinone/model/income_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PekopService {
  static const API = "http://10.0.2.2:7777/api";
  String token;
  String creators;
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    creators = prefs.getString("id");
  }

  Future<APIResponse> signin(LoginModel login) async {
    return http.post(API + '/sign-in', body: login.toJson()).then((data) {
      final jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        return APIResponse(data: APIResponse.fromJson(jsonData));
      }
      return APIResponse(success: false, data: APIResponse.fromJson(jsonData));
    }).catchError((_) {
      return APIResponse(success: false, catchError: "An error occured");
    });
  }

  Future<APIResponse<IncomeModel>> getMontlyTotal(
      String startDate, String endDate, String creator, String tokens) async {
    // startDate = "2020-04-029";
    // endDate = "2020-05-05";
    // creator = "{$creators}";
    return http.get(
      API + '/income/month/' + startDate + '/' + endDate + '/' + creator,
      headers: {
        'Authorization': 'Bearer $tokens',
      },
    ).then((data) {
      final jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        return APIResponse<IncomeModel>(data: IncomeModel.fromJson(jsonData));
      }
      return APIResponse<IncomeModel>(
          success: false, data: IncomeModel.fromJson(jsonData));
    }).catchError((_) {
      return APIResponse<IncomeModel>(
          success: false, catchError: "An error occured");
    });
  }
}
