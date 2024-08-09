import 'package:flutter/material.dart';

class FormViewTasks extends StatefulWidget {
  const FormViewTasks({super.key});

  @override
  State<FormViewTasks> createState() => _FormViewTasksState();
}

class _FormViewTasksState extends State<FormViewTasks> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criação de tarefas'),
        backgroundColor: Color.fromARGB(255, 71, 84, 231),
      ),
      body: Column(
        key: _formKey,
        children: [
          Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text('Titulo da tarefa'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              )),
          Padding(
              padding: EdgeInsets.all(12),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                minLines: null,
                decoration: InputDecoration(
                    label: Text('Descrição da tarefa'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              )),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () {
            if(_formKey.currentState!.validate()){
            print('Validou os campos!');
          }}, child: Text('Salvar Tarefa'))
        ],
      ),
    );
  }
}
