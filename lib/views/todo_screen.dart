import 'package:flutter/material.dart';
import 'package:project/models/todo_model.dart';
import 'package:project/services/todo_service.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<ToDoModel> todos = [];
  bool isLoading = true;
  Future<void> getToDosFromApi() async {
    todos = await ToDoService().getToDos();
    isLoading = false ;
    setState(() {});
  }
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getToDosFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:isLoading ? Center(child: CircularProgressIndicator(),): ListView.builder(
        itemCount: todos.length ,
       itemBuilder: (BuildContext context, int index){
        return ListTile(title: Text(todos[index].title ?? "--"),) ;
       }
       ),
    );
  }
}