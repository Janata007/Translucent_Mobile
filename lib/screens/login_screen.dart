import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translucent_mobile/screens/widgets/custom_button.dart';
import 'package:translucent_mobile/utils/requests.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  HttpService httpService = HttpService();
  String _username = "";
  String _password = "";
  bool _passwordVisible = false;
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final pref = getSharedPreferences();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _restoreUsernameAndPassword();
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: const InputDecoration(hintText: "Username"),
      controller: _usernameTextController,
      validator: (val) => val!.isEmpty ? 'enter username' : null,
      onSaved: (val) => _username = val!,
    );
    final password = TextFormField(
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: darkBlue,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
      ),
      controller: _passwordTextController,
      validator: (val) => val!.isEmpty ? 'enter password' : null,
      onSaved: (val) => _password = val!,
    );

    return Scaffold(
      backgroundColor: semiBlue,
      appBar: AppBar(
        backgroundColor: darkBlue,
      ),
      body: Center(
          child: Form(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[logo]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[logo_text]),
                  username,
                  const SizedBox(height: 8.0),
                  password,
                  const SizedBox(height: 24.0),
                  MyButton(label: "Log in", onPressed: submit),
                ],
              ))),
    );
  }

  void _restoreUsernameAndPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _password = prefs.getString('password') ?? '';
      _usernameTextController.text = _username;
      _passwordTextController.text = _password;
    });
  }

  void submit() {
    _username = _usernameTextController.text;
    _password = _passwordTextController.text;
    if (_username == "" || _password == "") {
      _loginErrorDialog();
    } else {
      _checkUsernameAndPassword();
      //redirectToHome();
    }
  }

  void redirectToHome() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  Future<void> _loginErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          title: const Text('Error while logging in'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Wrong username of password. Please try again',
                  style: TextStyle(color: lightBlue),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: lightBlue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _checkUsernameAndPassword() async {
    //send request to service
    userToken = await httpService.authenticateUser(
        _username.toString(), _password.toString());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    var pass = prefs.getString('password');

    if (userToken.toString().isEmpty) {
      _loginErrorDialog();
    } else {
      redirectToHome();
    }
  }
}
