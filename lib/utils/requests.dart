import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:translucent_mobile/constants.dart';
import 'package:translucent_mobile/utils/Arrangement.dart';
import 'package:translucent_mobile/utils/task.dart';
import 'package:translucent_mobile/utils/user.dart';

class HttpService {
  final String baseURL = "http://10.0.2.2:9002/";
  final String baseURL_work = "http://10.0.2.2:9007/";
  // final String baseURL = "http://192.168.0.7:9002/";

//parameters required: username, password
  Future<String> authenticateUser(String username, String password) async {
    loggedUsername = username;
    String url = baseURL + "users/authenticate";
    var mainUrl = Uri.parse(url);
    var response = await http.post(
      mainUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );
    try{
    Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      userToken = decodedResponse.values.first.toString();
      return userToken;}
    catch(err){return "";}
  }

  Future<void> getUserInfoByUsername(String username) async {
    String url = baseURL + "users/user?username=" + loggedUsername;
    var mainUrl = Uri.parse(url);
    var response = await http.get(mainUrl,
        headers: <String, String>{'Authorization': 'Bearer ' + userToken});
    var decodedResponse =
    jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    userId = decodedResponse.values.first.toString();
    profileData = User.fromJson(decodedResponse);
  }

  Future<void> getArrangementsForUser(String username) async {
    String url = baseURL + "arrangements/all/username/" + username;
    var mainUrl = Uri.parse(url);
    var response = await http.get(mainUrl,
        headers: <String, String>{'Authorization': 'Bearer ' + userToken});
    var decodedResponse = jsonDecode(response.body) as List<dynamic>;
    arrangementList = decodedResponse
        .map((e) => Arrangement.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  Future<void> getTasksForUser(String username) async {
    await this.getUserInfoByUsername(username);
    String url = baseURL_work + "work/tasks/" + profileData.id.toString();
    var mainUrl = Uri.parse(url);
    var response = await http.get(mainUrl,
        headers: <String, String>{'Authorization': 'Bearer ' + userToken});
    var decodedResponse = jsonDecode(response.body) as List<dynamic>;
    taskList = decodedResponse
        .map((e) => Task.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
