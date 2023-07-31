import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/todo_model.dart';
import 'package:project/services/todo_service.dart';

part 'to_dos_state.dart';

class ToDosCubit extends Cubit<ToDosState> {
  ToDosCubit() : super(ToDosInitial()){
    getToDos();
  }

  List<ToDoModel> todos = [];

  
  getToDos() async {
    try{emit(ToDosLoading());
    todos = await ToDosService().getToDos();
    emit(ToDosSuccess());
    }catch(e){
      print(e.toString());
      emit(ToDosError());
    }
  }
}
