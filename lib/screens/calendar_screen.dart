import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:translucent_mobile/screens/widgets/buttons_widget.dart';
import 'package:translucent_mobile/utils/requests.dart';

import '../constants.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              "Return to main ->",
              style: TextStyle(fontSize: 17, color: lightGray),
            )
          ],
        ),
        backgroundColor: darkBlue,
        actions: [
          IconButton(
              onPressed: () {
                // redirectToHome();
              },
              icon: Icon(Icons.account_circle_rounded))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(color: Colors.white, width: 4),
          gradient: LinearGradient(
              colors: [semiBlue, darkBlue],
              begin: Alignment(-1, -0.5),
              end: Alignment(2, 2)),
          color: semiBlue,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: getData,
                  child: Text(
                    "Get calendar info",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
              SizedBox(
                height: 20,
              ),
              myButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    await httpService.getTasksForUser(loggedUsername);
    await httpService.getArrangementsForUser(loggedUsername);
    resetState();
  }

  void resetState() {
    setState(() {});
  }
}
