class ToDoModel {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    ToDoModel({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

  get name => null;

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };

  void add(ToDoModel todos) {}
}
