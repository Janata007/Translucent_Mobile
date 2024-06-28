import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translucent_mobile/screens/widgets/buttons_widget.dart';

import '../constants.dart';
import '../utils/requests.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen();

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String tasks = "";
  final TextEditingController _taskTextController =
  TextEditingController();
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Tasks",
          style: TextStyle(color: lightBlue),
        ),
        backgroundColor: darkBlue,
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [semiBlue, darkBlue],
                begin: Alignment(-1, -0.5),
                end: Alignment(2, 2)),
            color: semiBlue,
          ),
          child: Column(
            children: [
              TextButton(
                  onPressed: getData,
                  child: Text(
                    "Get tasks",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, int index) {
                    return
                      Scrollbar(child:
                      SingleChildScrollView(
                          child:Card(
                            color: darkBlue,
                            margin: EdgeInsets.all(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                border: Border.all(color: lightBlue, width: 3),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Name:  " + taskList[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Description:  " + taskList[index].description,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Due Date:  " + taskList[index].dateDue.substring(0,10),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Finished:  " + taskList[index].finished.toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          )));
                  },
                  padding: EdgeInsets.all(15),
                ),
              ),
              myButtons(context)
            ],
          )),
    );
  }

  Future<void> getData() async {
    await httpService.getTasksForUser(loggedUsername);
    resetState();
  }

  void resetState() {
    setState(() {
      // jsonData = jsonDecode(arrangements);
      // locationCity = jsonData['location']['name'];
      // locationCountry = jsonData['location']['country'];
      // localTime = jsonData['location']['localtime'];
      // weather = jsonData['current']['condition']['text'];
      // arrangementId = jsonData['current']['temp_c'].toString();
    });
  }

  void setArrangementsInfo() {
    dates.clear();
    tasksJsonData = jsonDecode(tasks);
    List<dynamic> days = tasksJsonData["arrangements"]["arrangement"];
    //todo: map dates correctly based on json
    Map<String, dynamic> day1 = days[0];
    Map<String, dynamic> day2 = days[1];
    Map<String, dynamic> day3 = days[2];
    //   daysDates.add(day1["date"]);
    //   daysDates.add(day2["date"]);
    //   daysDates.add(day3["date"]);
    //
    //   day1Temp = day1["day"]['avgtemp_c'];
    //   day2Temp = day2["day"]['avgtemp_c'];
    //   day3Temp = day3["day"]['avgtemp_c'];
    //   daysTemp.add(day1Temp.toString());
    //   daysTemp.add(day2Temp.toString());
    //   daysTemp.add(day3Temp.toString());
  }
}
