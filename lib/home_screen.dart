import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  //final String UserName;
  const HomePage({super.key ,
  // required this.UserName
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "" ;

  Future<void> getChachedUserName() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     username = prefs.getString('UserName') ?? "--" ;
     setState(() {
       
     });

  }

  @override
  void initState() {
    super.initState();
    getChachedUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios) , onPressed: () {
          Navigator.of(context).pop();
        },),
      ),
      body: Center(
        child: Text("welcome \n $username"),
        ),
    );
  }
}