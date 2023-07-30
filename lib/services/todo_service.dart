import 'package:dio/dio.dart';
import 'package:project/models/todo_model.dart';

class ToDoService {
  String url = "https://jsonplaceholder.typicode.com/todos" ;

  Future<List<ToDoModel>> getToDos () async {
    List<ToDoModel> todos = [];
    Response response = await Dio().get(url);
    var data = response.data ;
    data.forEach((element){
      ToDoModel todos = ToDoModel.fromJson(element);
      todos.add(todos);
    });
    return todos;
  }
}