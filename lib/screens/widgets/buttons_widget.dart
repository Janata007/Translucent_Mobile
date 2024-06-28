import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translucent_mobile/screens/calendar_screen.dart';
import 'package:translucent_mobile/screens/home_screen.dart';
import 'package:translucent_mobile/screens/profile_screen.dart';
import 'package:translucent_mobile/screens/tasks_screen.dart';
import 'package:translucent_mobile/utils/notification_api.dart';

import '../../constants.dart';
import '../login_screen.dart';

Widget myButtons(BuildContext context) {
  onLogout(){
    arrangementList.clear();
    userToken="";
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Home",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskScreen()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Tasks",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Container(
                  decoration: const BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Profile",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async => {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => CalendarScreen()))
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "My Calendar",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
          TextButton(
              onPressed: () async => {
                NotificationApi.showNotification(
                    title: 'User',
                    body: 'Logging out',
                    payload: 'notification'),
                onLogout,
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => LoginScreen()))
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Log out",
                    style: TextStyle(color: lightBlue, fontSize: 15),
                  ))),
        ],
      )
    ],
  );
}
