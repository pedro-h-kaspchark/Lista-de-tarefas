import 'package:flutter/material.dart';

class ListViewTasks extends StatefulWidget {
  const ListViewTasks({super.key});

  @override
  State<ListViewTasks> createState() => _ListViewTasksState();
}

class _ListViewTasksState extends State<ListViewTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas "),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
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
                    Text("Tarefa 1", style: TextStyle(fontSize: 22), ),
                    Radio(value: "", groupValue: "", onChanged: (value) {})
                  ]),
                Text("Descrição"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){print("Icone de editar pressionado");}, icon: Icon(Icons.edit, color: Colors.blue,)),
                    IconButton(onPressed: (){print("Icone de remover pressionado");}, icon: Icon(Icons.delete, color: Colors.red,))],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}