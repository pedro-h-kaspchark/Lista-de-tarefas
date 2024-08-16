import 'package:flutter/material.dart';
import 'package:project_test/service/task_service.dart';

class FormViewTasks extends StatefulWidget {
  const FormViewTasks({super.key});

  @override
  State<FormViewTasks> createState() => _FormViewTasksState();
}

class _FormViewTasksState extends State<FormViewTasks> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TaskService TasksService = TaskService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criação de tarefas'),
        backgroundColor: Color.fromARGB(255, 71, 84, 231),
      ),
      body:
      Form (key: _formKey, 
          child:
      Column(
        children: [
          
          Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                  return null;
                },
                onChanged: (value) {
                  print(_titleController.text);
                },
                decoration: InputDecoration(
                    label: Text('Titulo da tarefa'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              )),
          Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                  return null;
                },
                onChanged: (value) {
                  print(_titleController.text);
                },
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                minLines: null,
                decoration: InputDecoration(
                    label: Text('Descrição da tarefa'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              )),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () async {
            if(_formKey.currentState!.validate()){
              String titleNewTask = _titleController.text;
              String descriptionNewTask = _descriptionController.text;
              await TasksService.saveTask(titleNewTask, descriptionNewTask, false);
          }}, child: Text('Salvar Tarefa'))
        ],
      ),
    )
    );
  }
}
