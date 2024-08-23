import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/task_model.dart';

class TaskService{
  //salva as tarefas
  Future<void> saveTask(String title, String description2, bool isDone) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    Task task = Task(title: title, description: description2);
    tasks.add(jsonEncode(task.tojson()));
    await prefs.setStringList('tasks', tasks);
  }
  //recupera as tarefas
  getTasks() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasksString = prefs.getStringList('tasks') ?? [];
    List<Task> tasks = tasksString.map((taskJson) => Task.fromJson(jsonDecode(taskJson))).toList();
    return tasks;
  }

  deleteTasks(int index) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    tasks.removeAt(index);
    await prefs.setStringList('tasks', tasks);
  }

  editTask(int index, String newTitle, String newDescription) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tasks = prefs.getStringList('tasks') ?? [];
    Task updatedTask = Task(description: newDescription, title: newTitle);
    tasks[index] = jsonEncode(updatedTask.tojson());
    await prefs.setStringList('tasks', tasks);
  }

}