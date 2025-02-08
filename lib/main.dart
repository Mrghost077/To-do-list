import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  TextEditingController textController = TextEditingController();
  List<String> taskList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do App",
          style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child:Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Task")
                    ),
                  ),
                  ),   
                 ),
                   MaterialButton(
                    onPressed: (){
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                    },
                  child: Text("Add"),
                  height: 50,
                  color:Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
            ),
            ),
              ],
            ),
           

            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index){
                  return  Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Text(taskList[index]),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        taskList.removeAt(index);
                      });
                    },
                    child: Icon(Icons.delete,
                    color: Colors.red,),
                  )
                ],
                );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
