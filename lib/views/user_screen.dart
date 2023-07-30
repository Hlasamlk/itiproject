import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/services/user_service.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users = [];
  bool isLoading = true;
  Future<void> getUsersFromApi() async {
    users = await UserService().getUser();
    isLoading = false ;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsersFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:isLoading ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: users.length ,
       itemBuilder: (BuildContext context, int index){
        return ListTile(title: Text(users[index].name ?? "--"),) ;
       }
       ),
    );
  }
}