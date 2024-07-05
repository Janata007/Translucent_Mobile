import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translucent_mobile/utils/Arrangement.dart';
import 'package:translucent_mobile/utils/task.dart';
import 'package:translucent_mobile/utils/user.dart';

const semiBlue = Color.fromRGBO(92, 144, 181, 1);
const lightBlue = Color.fromRGBO(173,216,230, 1);
const lightGray = Color.fromRGBO(219,231,251, 1);
const darkBlue = Color.fromRGBO(16,25,43, 1);

final logo =
Image.asset("assets/logo.png", width: 230, height: 200);
final logo_text =
Image.asset("assets/logo_text.png", width: 230, height:  200);
final pref = getSharedPreferences();
String userToken = "";
String loggedUsername = "";
String userId = "";
List<String> dates = [];
User profileData = User(0,"", "", "", loggedUsername);
List<Arrangement> arrangementList = [];
List<DateTime> arrangementTimes = [];
List<Task> taskList = [];

Map<String, dynamic> jsonData = {
  "location": 'info',
  "condition": 'condition info'
};
Map<String, dynamic> arrangementsJsonData = {
  "arrangements": "",
};
Map<String, dynamic> tasksJsonData = {
  "tasks": "",
};

getSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

const kLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [darkBlue, lightBlue],
);
