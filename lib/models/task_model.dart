class Task{
  String? title;
  String? description;
  bool? isDone;

  Task({required this.title,  required description, this.isDone});

  Map tojson(){
    return{'title': title, 'description': description, 'isDone': isDone};
  }

  Task.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    isDone = json['isDone'];
  }
}