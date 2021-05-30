import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ot_project/SearchList.dart';
import 'package:ot_project/TakePictureScreen.dart';

import 'Camera.dart';
import 'Demo.dart';
import 'EnquiryForm.dart';
import 'Login.dart';
import 'OTRegistration.dart';
import 'PhysicalFitness.dart';
import 'PreAnaesthesia.dart';
import 'Profile.dart';
import 'ViewPatientDetails.dart';
import 'flutter_nfc_reader.dart';

class MainActivity extends StatefulWidget {
  String text;

  MainActivity(this.text);

  @override
  _MainActivity createState() => _MainActivity();
}

class _MainActivity extends State<MainActivity> {
  @override
  Widget build(BuildContext context) {
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
          //height: 602.0,
          height: 535.0,
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
               /* new Container(
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
                        //FlutterNfcReader();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchList()));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => PhysicalFitnessForm('Physical Fitness Form')));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OTBooking('OT Booking')));
                      },
                    )),*/
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile()));
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Usermaster('UserMaster')));
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login('Login')));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPatientDetails(
                                    'View Patients Details')));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Demo('Demo')));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhysicalFitness('Physical Fitness')));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OTRegistration('OT Registration')));
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
