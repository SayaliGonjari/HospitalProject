import 'package:flutter/material.dart';
import 'package:ot_project/OTBooking.dart';
import 'package:ot_project/OTRegistration.dart';
import 'package:ot_project/PhysicalFitness.dart';
import 'package:ot_project/PhysicalFitnessForm.dart';
import 'package:ot_project/PreAnaesthesia.dart';
import 'package:ot_project/PreAnaesthesia1.dart';
import 'package:ot_project/Profile.dart';
import 'package:ot_project/Usermaster.dart';
import 'package:ot_project/ViewPatientDetails.dart';
import 'package:ot_project/Demo.dart';

import 'EnquiryForm.dart';
import 'Login.dart';

void main() {
  runApp(MyApp1());
}



class MyApp1 extends StatelessWidget {
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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isChecked = false;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('OT Management'),
      ),
      body: SingleChildScrollView(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        // margin: new EdgeInsets.symmetric(horizontal: 7.0),
        // color: Colors.white,

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 602.0,
          margin: new EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
          child: Container(
            width: 350.0,
            height: 500.0,
            margin: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
                        child: Image.asset(
                          'assests/sthescope.png',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ))),

                /* Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: Text('SAINATH HOSPITAL',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent)))),*/
                Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Text('Assuring Quality Care',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan)))),
                Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Text(
                            'Center of Excellence for Trauma and Joint Replacement Surgery',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigoAccent)))),
                //enquiry
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('Enquiry'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EnquiryForm('Enquiry Form')));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => PhysicalFitnessForm('Physical Fitness Form')));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OTBooking('OT Booking')));
                      },
                    )),
                //new  Patient Details
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('New Patient Registration'),
                      onPressed: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile('Profile')));
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Usermaster('UserMaster')));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login('Login')));
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => PreAnaesthesia1('PreAnaesthesia1')));
                       //   Navigator.push(context, MaterialPageRoute(builder: (context) => Demo('Demo')));
                      },
                    )),
                //View Patient Details
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('View Patient Details'),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ViewPatientDetails('View Patients Details')));
                     //   Navigator.push(context, MaterialPageRoute(builder: (context) => Demo('Demo')));
                        /* context,
                            MaterialPageRoute(
                                builder: (context) => ViewPatientDetials()));*/
                      },
                    )),
                //Conduct physical fitness checkup
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('Conduct Physical Fitness checkup'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PhysicalFitness('Physical Fitness')));
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => PhysicalFitnessForm('Physical Fitness Form')));
                      },
                    )),
                //pre anesthesia
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('Conduct Pre Anesthesia checkup'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PreAnaesthesia('PreAnesthesia')));
                      },
                    )),
                //OT Registration
                new Container(
                    width: 300.0,
                    height: 40.0,
                    margin: EdgeInsets.all(10.0),
                    decoration:
                        new BoxDecoration(color: Colors.lightBlueAccent),
                    child: new RaisedButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      elevation: 5.00,
                      splashColor: Colors.cyan,
                      child: Text('OT Registration'),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OTRegistration('OT Registration')));
                      },
                    )),

             /*   new Center(
                    child: CheckboxListTile(
                  value: _isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                  // checkColor: Colors.white,
                  activeColor: Colors.blue, title: Text('Hello Flutter !!!1'),
                ))*/
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
