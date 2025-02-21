import 'package:flutter/material.dart';

void main() 
{
  runApp(MainApp());
}

class MainApp extends StatefulWidget 
{
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> 
{
  List<String> taskList = [];

  TextEditingController textControler = TextEditingController();

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('ToDo List App'),
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: textControler,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Enter a task'),
                          ),
                        )),
                  ),
                  MaterialButton(
                    color: Colors.white,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        taskList.add(textControler.text);
                        textControler.clear();
                      });
                    },
                    child: Text(
                      'Add',
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 40,
                              child: Text(taskList[index]),
                            ),
                          ),
                          MaterialButton(
                            child: Icon(
                              Icons.delete,
                              color: Colors.purple,
                            ),
                            onPressed: () {
                              setState(() {
                                taskList.removeAt(index);
                              });
                              
                            },
                          )
                        ],
                      );
                    }),
              )
            ],
          )),
    );
  }
}

