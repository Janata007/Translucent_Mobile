import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translucent_mobile/screens/widgets/buttons_widget.dart';
import 'package:translucent_mobile/utils/requests.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    "Get profile info",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("Name: " + profileData.firstName,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("Surname: " + profileData.lastName,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      color: darkBlue,
                      border: Border.all(color: lightBlue, width: 3)),
                  padding: EdgeInsets.all(20),
                  child: Text("email" + profileData.email,
                      style: TextStyle(fontSize: 15))),
              SizedBox(
                height: 20,
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
    await httpService.getUserInfoByUsername(loggedUsername);
    resetState();
  }

  void resetState() {
    setState(() {});
  }
}
