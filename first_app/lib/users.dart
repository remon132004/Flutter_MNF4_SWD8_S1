import 'package:dio/dio.dart';
import 'package:first_app/user_model.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<UserModel> users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final res = await Dio().get("https://jsonplaceholder.typicode.com/users");
    final apiList = res.data as List;
    users = apiList.map((e) => UserModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users from Api")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(users[index].name),
          subtitle: Text(users[index].email),
          trailing: Text(users[index].username),
          leading: Text(users[index].city),
        ),
      ),
    );
  }
}
