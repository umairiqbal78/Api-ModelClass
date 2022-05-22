import 'dart:convert';

import 'package:apimodelclass/model/user.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<List<User>> getUsers() async {
    try {
      final response =
          await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));
      if (200 == response.statusCode) {
        // final List<User> users = jsonDecode(response.body);
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        print("error response");
        return <User>[];
      }
    } catch (e) {
      print("error catch");
      return <User>[];
    }
  }
}
