import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ot_project/MainActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EnquiryForm.dart';
import 'Session.dart';

class Login extends StatelessWidget {
  String text;

  Login(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
/*
  @override
  _Login createState() => _Login();*/

Future<void> main() async {
 // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var loginId = prefs.getString('LoginId');
  var password = prefs.getString('Password');
  var plantId = prefs.getString('PlantId');
  print(loginId);
  runApp(MaterialApp(home: loginId == null && password == null && plantId == null ? Login('Again') : MainActivity('')));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String additonalInfo='ot' ;
  String appEnvMasterId ,plantId,userid,password;
  String plantInfo = 'Pune';

  var envisData;

  List<String> additionalInfoDecision = ['ot'];
  List<String> planInfoDecision = ['Pune', 'Mumbai', 'Punjab'];

  String selectedSpinnerItem = 'Eliseo@gardner.biz';
  List data = List();
  List plantDataList = List();
  Future myFuture;

  String uri = 'http://c207.ekatm.co.in/api/LoginAPI/GetPlants?AppEnvMasterId=ot&PlantId=';
  String GetSessions = 'http://ot.ekatm.co.in/api/LoginAPI/GetSessions';

  //getEnv();

  @override
  void initState() {
    main();
    getEnv();
    getPlant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // getEnv();



    return Scaffold(
        appBar: AppBar(
          title: Text('OT'),
        ),
        body:Container(alignment: Alignment.center,child: SingleChildScrollView(
            child: Flexible(child:Center(
                child: Container(
                    width: 350.0,
                    height: 400.00,
                    alignment: AlignmentDirectional.center,
                    // height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                    child: Column(children: <Widget>[
                      Container(
                        height: 20.0,
                        alignment: AlignmentDirectional.center,
                        color: Color(0xFFE1F5FE),
                        margin: new EdgeInsets.all(10.0),
                        child: Text('Enter Login Details',
                            style: TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 18.00,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                          child: Column(children: <Widget>[

                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                padding:
                                EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),child: DropdownButton(
                              items: data.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item['AppEnvMasterId']),
                                  value: item['AppEnvMasterId'],
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  additonalInfo = newVal;
                                });
                              },
                              value: additonalInfo,
                            )),



                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                padding:
                                EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child:  DropdownButton(
                                  items: plantDataList.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item['PlantName']),
                                      value: item['PlantName'],

                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      plantInfo = newVal;
                                      // plantId = newVal['PlantMasterId'];
                                    });
                                  },
                                  value: plantInfo,
                                )),


                            /* Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0, *//*style: BorderStyle.solid*//*
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      child: new DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: plantInfo,
                        hint: Text(''),
                        items: planInfoDecision
                            .map<DropdownMenuItem<String>>((String Value) {
                          return DropdownMenuItem<String>(
                            value: Value,
                            child: Text(Value),
                          );
                        }).toList(),
                        onChanged: (String data) {
                          setState(() {
                            plantInfo = data;
                          });
                        },
                      )),
                    ),*/
                            Container(
                                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                margin: EdgeInsets.all(2),
                                child: TextField(
                                  onChanged: (text){
                                    userid= text;
                                  },
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      //   hintText: "User Id",
                                      labelText: "User Id",
                                      /*prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                textDirection: TextDirection.ltr,
                              ),*/
                                      contentPadding: new EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 3.0),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0))),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                                margin: EdgeInsets.all(2),
                                child: TextField(
                                  onChanged: (text){
                                    password= text;
                                  },
                                  textAlign: TextAlign.start,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      //  hintText: "Password",
                                      labelText: "Password",
                                      /*prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                textDirection: TextDirection.ltr,
                              ),*/
                                      contentPadding: new EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 3.0),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0))),
                                )),
                            Container(
                                width: 200.0,
                                height: 70.0,
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 0.0),
                                //margin: EdgeInsets.all(2.0),
                                //decoration: new BoxDecoration(color: Colors.green),
                                child: new RaisedButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  elevation: 5.00,
                                  //  splashColor: Colors.green,
                                  child: Text('Login'),
                                  onPressed: () {
                                    LoginValidation();
                                  },
                                ))
                          ]))
                    ]))))),),

        );
  }

  void getEnv() async {
    var statusres;
    Response response =
        await get('http://ot.ekatm.co.in/api/LoginAPI/GetEnvis');
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. res = res.replaceAll("\\\\", "");
      var resBody = json.decode(json.decode(response.body));

      statusres = 'success';
      setState(() {
        //  additonalInfo = resBody[0]['AppEnvMasterId'];
        data = resBody/*[0]['AppEnvMasterId']*/;
       // appEnvMasterId = resBody[0]['AppEnvMasterId']
        print(additonalInfo);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return statusres;
  }
  void getPlant() async {
    var statusres;
    Response response =
        await get(uri);
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. res = res.replaceAll("\\\\", "");
      var resBody = json.decode(json.decode(response.body));

      statusres = 'success';
      setState(() {
        //  additonalInfo = resBody[0]['AppEnvMasterId'];
        plantDataList = resBody/*[0]['AppEnvMasterId']*/;
       // appEnvMasterId = resBody[0]['AppEnvMasterId']
       // print(additonalInfo);
      });
    } else {
      // If the server did not return a 200 OK response,
     /* // then throw an exception.
      String GetSessions = 'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
      String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';
      Session().get(GetSessions, body,PostProfile);*/
    }

    return statusres;
  }
  void LoginValidation() async {
    var statusres;

    Response response =
        await get(GetSessions+'?AppEnvMasterId=ot&UserLoginId='+userid+'&UserPwd='+password+'&PlantId=1');
    print(response.reasonPhrase);
    if (response.body == "true") {
      // If the server did return a 200 OK response,
      // then parse the JSON. res = res.replaceAll("\\\\", "");
      var resBody = response.body;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('LoginId', userid);
      prefs.setString('Password', password);
      prefs.setString('PlantId', '1');

 //     statusres = 'success';
      setState(() {
        //  additonalInfo = resBody[0]['AppEnvMasterId'];
      //  plantDataList = resBody/*[0]['AppEnvMasterId']*/;
       // appEnvMasterId = resBody[0]['AppEnvMasterId']
        //print('Login successful');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainActivity('Main Activity')));
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return statusres;
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginId = prefs.getString('LoginId');
    var password = prefs.getString('Password');
    var plantId = prefs.getString('PlantId');
    print(loginId);
    runApp(MaterialApp(home: loginId == null && password == null && plantId == null ? Login('Again') : MainActivity('')));
  }
}
