import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/views/cubit/cubit/to_dos_cubit.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ToDosCubit(),
        child: BlocConsumer<ToDosCubit, ToDosState>(
            listener: (context, state) {
              if(state is ToDosLoading){
                print("loading");
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return state is ToDosLoading ? Center(child: CircularProgressIndicator()
              ): state is ToDosSuccess ?
              ListView.builder(
                  itemCount: context.watch<ToDosCubit>().todos.length ,
                  itemBuilder: (BuildContext context, int index){
                  return ListTile(title: Text(context.watch<ToDosCubit>().todos[index].title ?? "--")) ;
                  }
              ): Center(child: Text("error"),
                );
            },
          )
        ),
      );
  }
}