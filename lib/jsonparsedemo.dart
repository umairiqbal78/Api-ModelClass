import 'package:apimodelclass/model/user.dart';
import 'package:apimodelclass/service/service.dart';
import 'package:flutter/material.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({Key? key}) : super(key: key);

  @override
  State<JsonParseDemo> createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User>? _users;
  bool loading = true;
  @override
  void initState() {
    super.initState();
    Service.getUsers().then((users) {
      setState(() {
        _users = users;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(loading ? "Loading..." : "JSON parse Demo"),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: null == _users ? 0 : _users!.length,
            itemBuilder: ((context, index) {
              User user = _users![index];
              return ListTile(
                title: Text(user.name.toString()),
                subtitle: Text(user.phone.toString()),
              );
            }),
          ),
        ));
  }
}
