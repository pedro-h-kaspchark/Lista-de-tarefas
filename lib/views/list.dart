import 'package:flutter/material.dart';
import 'package:project_test/models/task_model.dart';
import 'package:project_test/service/task_service.dart';
import 'package:project_test/views/form.dart';

class ListViewTasks extends StatefulWidget {
  const ListViewTasks({super.key});

  @override
  State<ListViewTasks> createState() => _ListViewTasksState();
}

class _ListViewTasksState extends State<ListViewTasks> {
  TaskService taskService = TaskService();
  List<Task> tasks = [];

  getAllTasks() async{
    tasks = await taskService.getTasks();
    setState(() {});
  }

  @override
  void initState() {
    getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas "),
        backgroundColor: Color.fromARGB(255, 71, 84, 231),
      ),
      body: ListView.builder(
        itemCount: tasks.length, 
        itemBuilder: (context, index){
          return
          Card(
            color: Colors.grey[200],
            child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((tasks[index].title.toString()), style: TextStyle(fontSize: 22), ),
                    Radio(value: true, groupValue: tasks[index].isDone, onChanged: (value) {
                      if(value != null){
                        taskService.editTask(index,
                        tasks[index].title.toString(),
                        tasks[index].description.toString());
                      }
                    })
                  ]),
                Text(tasks[index].description.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                                    onPressed: () async {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormViewTasks(
                                                          task: tasks[index],
                                                          index: index
                                                          )))
                                          .then((value) => getAllTasks());
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    )),
                    IconButton(onPressed: () async {
                      await taskService.deleteTasks(index);
                      getAllTasks();
                      }, 
                      icon: Icon(Icons.delete, color: Colors.red,))
                    ],
                
          )])));
    }));
  }
}