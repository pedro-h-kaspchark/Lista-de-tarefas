import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
