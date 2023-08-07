import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios) , onPressed: () {
          Navigator.of(context).pop();
        },),
      ),
      body: Center(
        child: Text(""),
        ),
    );
  }
}