import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/task_model.dart';

class TaskService{
  //salva as tarefas
  Future<void> saveTask(String title, String description, bool isDone) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    Task task = Task(title: title, description: description);
    tasks.add(jsonEncode(task.tojson()));
    await prefs.setStringList('tasks', tasks);
    print('Tarefa salva');
  }
  //recupera as tarefas
  getTasks() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksString = prefs.getStringList('tasks') ?? [];
    List<Task> tasks = tasksString.map((taskJson) => Task.fromJson(jsonDecode(taskJson))).toList();
    return tasks;
  }

}