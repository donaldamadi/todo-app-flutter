import 'package:flutter/material.dart';
import 'style.dart';

void main() => runApp (MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Raised Button',
  home: MyStatefulWidget(),
));


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
  
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {



  String input = "";
  List list = List();

  @override
  void initState() {
    super.initState();
    list.add("Eat");
    list.add("Sleep");
    list.add("Code");
    list.add("Repeat");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataStyle,
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("ToDos"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(list[index]),
            child: ListTile(
              title: Text(list[index])
            ),
            onDismissed: (direction){
              setState(() {
                list.removeAt(index);
              });
            },
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                title: Text("Add ToDo"),
                content: TextField(
                  onChanged: (String value){
                    input = value;
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Add"),
                    onPressed: (){
                      setState(() {
                        list.add(input);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ]
                );
            }
            );
        } ,
      ),
      ),
    );
  }
}