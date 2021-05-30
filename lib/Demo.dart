import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'EnquiryForm.dart';
import 'OTRegistration.dart';
import 'package:camera/camera.dart';
import 'flutter_nfc_reader.dart';

class Demo extends StatefulWidget {
  String text;

  CameraDescription camera;
  Demo(this.text);
  //const Demo({@required this.camera});

/*  const Demo({
    Key key,
    @required this.camera,
  }) : super(key: key);*/

  @override
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;
    bool checkBoxValue = false;
    TextEditingController writerController = TextEditingController();
    writerController.text = "prueba";
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child:Column(
            children: <Widget>[
              TextField(
                controller: writerController,
              ),
              RaisedButton(
                onPressed: () {
                  FlutterNfcReader.read().then((response) {
                    print(
                        response.content);
                  });
                },
                child: Text("Read"),
              ),
              RaisedButton(
                onPressed: (){
                  FlutterNfcReader.write(" ", writerController.text).then((value){
                    print(value.content);
                  });
                },
                child: Text("Write"),
              )
            ],
          ),
        ),
      ),
    );

   /* return Scaffold(
        appBar: AppBar(title: Text('Flutter Apply Search on ListView')),
        body: Center(child: ListSearch()));*/
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(data),
                  onTap: () => print(data),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
