import 'package:dio/dio.dart';
import 'package:project/models/user_model.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/todos" ;

  Future<List<UserModel>> getUser () async {
    List<UserModel> users = [];
    Response response = await Dio().get(url);
    var data = response.data ;
    data.forEach((element){
      UserModel user = UserModel.fromJson(element);
      users.add(user);
    });
    return users;
  }
}