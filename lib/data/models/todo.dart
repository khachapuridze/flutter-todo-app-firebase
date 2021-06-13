class Todo {
  String? id;
  String? title;
  String? description;
  bool isDone = false;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      required this.isDone});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['isDone'] = this.isDone;
    return data;
  }
}
