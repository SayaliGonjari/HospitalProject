import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ot_project/PhysicalFitnessForm.dart';
import 'package:ot_project/PreAnaesthesia1.dart';
import 'package:ot_project/Profile.dart';

import 'OTBooking.dart';

class ViewPatientDetails extends StatefulWidget {
  final String text;

  ViewPatientDetails(this.text);

  @override
  _ViewPatientDetails createState() => _ViewPatientDetails();
}

class _ViewPatientDetails extends State<ViewPatientDetails> {
  Future<Album> futureAlbum;
  final TextEditingController _IPDNoController = new TextEditingController();
  final TextEditingController _wardController = new TextEditingController();
  final TextEditingController _bedNoController = new TextEditingController();
  final TextEditingController _patientController = new TextEditingController();
  final TextEditingController _otRegistrationId = new TextEditingController();
  final TextEditingController _profilemasterId = new TextEditingController();
  final TextEditingController _OPDNo = new TextEditingController();
  final TextEditingController _PRNNo = new TextEditingController();
  final TextEditingController _PhysicalFitnessId = new TextEditingController();
  final TextEditingController _PreAnesthesiaPart1Id = new TextEditingController();

//  var uri= "http://ot.ekatm.co.in/api/otAPI/Getdataexitpatient?prnno=13654";
  var uri = "http://ot.ekatm.co.in/api/otAPI/Getdataexitpatient";
  String GetSessions =
      'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';

  var _myIPDNO;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //String dropdownValue = 'One';
    List<String> spinnerItems = ['General', 'ICU', 'Shared'];

    var dropdownValue = 'General';

    return Scaffold(
      appBar: AppBar(
        title: Text('View Patient Details'),
      ),
      body: SingleChildScrollView(
        child: Flexible(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: 562.0,
          margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Expanded(
              child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 2.0),
                  margin: new EdgeInsets.fromLTRB(0, 2, 0, 5),
                  child: Image.asset('assests/sthescope.png',
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.center,
                      fit: BoxFit.cover)),
              Container(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                      child: Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ))),
              Container(
                alignment: AlignmentDirectional.center,
                color: Color(0xFFE1F5FE),
                margin: new EdgeInsets.all(1.0),
                child: Text('View Patient Details',
                    style: TextStyle(
                      fontSize: 20.00,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(2),
                child: Flexible(
                    child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(
                          'PRN No  : ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            letterSpacing: 0.2,
                            fontSize: 15,
                          ),
                        )),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(2),
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: "Enter PRN No",
                              // labelText: "PRN No",
                              /*prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                textDirection: TextDirection.ltr,
                              ),*/
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 3.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                          onChanged: (text) {
                            _PRNNo.text = text;
                            get(GetSessions, text, uri);
                            //    s().get(GetSessions, text, text);
                          },
                        ),
                      ),
                    ),
                    Flexible(
                        child: Container(
                            /*padding: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
        margin: new EdgeInsets.fromLTRB(7, 2, 1, 2),*/
                            child: Image.asset('assests/barcode.png',
                                width: 40.0,
                                height: 20.0,
                                alignment: Alignment.center,
                                fit: BoxFit.cover)))
                  ],
                )),
              ),
              Container(
                  margin: EdgeInsets.all(2),
                  child: Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                        Flexible(
                            child: Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                child: Expanded(
                                    child: Column(
                                  children: <Widget>[
                                    Container(
                                        child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          'IPD No  : ',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.2,
                                            fontSize: 15,
                                          ),
                                        )),
                                        Flexible(
                                            child: Container(
                                          margin: EdgeInsets.all(2),
                                          child: TextField(
                                            readOnly: true,
                                            controller: _IPDNoController,
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText: "Enter IPD No",
                                              //  labelText: _myIPDNO ,
                                              contentPadding:
                                                  new EdgeInsets.symmetric(
                                                      vertical: 7.0,
                                                      horizontal: 3.0),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0)),
                                            ),
                                            onChanged: (text) {
                                              _setRatingAsOne(text);
                                            },
                                          ),
                                        )),
                                      ],
                                    )),
                                    Container(
                                        child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          'Ward     : ',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.2,
                                            fontSize: 15,
                                          ),
                                        )),
                                        Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(2),
                                                child: TextField(
                                                  readOnly: true,
                                                  controller: _wardController,
                                                  textAlign: TextAlign.start,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    //  hintText: "Enter Ward",
                                                    //labelText: "Ward",
                                                    contentPadding:
                                                        new EdgeInsets
                                                                .symmetric(
                                                            vertical: 7.0,
                                                            horizontal: 3.0),
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black,
                                                            width: 1.0)),
                                                  ),
                                                  onChanged: (text) {},
                                                ))),
                                        /* Flexible(child: Container(
                                          width: 100.00,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all( width: 1.0,)
                                          ),
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            icon: Icon(Icons.arrow_drop_down),
                                            iconSize: 12,
                                            elevation: 12,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),


                                            onChanged: (String data) {
                                              setState(() {
                                                dropdownValue = data;
                                              });
                                            },
                                            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        )),*/
                                      ],
                                    )),
                                    Container(
                                        child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Text(
                                          'Bed No  : ',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.2,
                                            fontSize: 15,
                                          ),
                                        )),
                                        Flexible(
                                            child: Container(
                                                margin: EdgeInsets.all(2),
                                                child: TextField(
                                                    readOnly: true,
                                                    controller:
                                                        _bedNoController,
                                                    textAlign: TextAlign.start,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      //  hintText: "Enter Bed No",
                                                      //     labelText: "Bed No",
                                                      contentPadding:
                                                          new EdgeInsets
                                                                  .symmetric(
                                                              vertical: 7.0,
                                                              horizontal: 3.0),
                                                      border: OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1.0)),
                                                    )))),
                                      ],
                                    ))
                                  ],
                                )))),
                        Container(
                            margin: EdgeInsets.only(left: 5.0),
                            /* padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
                        margin: new EdgeInsets.fromLTRB(2, 2, 0, 5),*/
                            child: Image.asset('assests/userph.png',
                                width: 80.0,
                                height: 80.0,
                                alignment: Alignment.center,
                                fit: BoxFit.cover))
                      ]))),
              Container(
                margin: EdgeInsets.all(2),
                child: Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text(
                      '  Patient Name : ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                        letterSpacing: 0.2,
                        fontSize: 15,
                      ),
                    )),
                    Flexible(
                        child: Container(
                      margin: EdgeInsets.all(2),
                      child: TextField(
                          readOnly: true,
                          controller: _patientController,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            isDense: true,
                            // hintText: "Enter Patient Name",
                            //labelText: "Patient No",
                            /*prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                textDirection: TextDirection.ltr,
                              ),*/
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 3.0),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0)),
                          )),
                    )),
                  ],
                )),
              ),
              Container(
                  width: 340.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(color: Colors.lightBlueAccent),
                  child: new RaisedButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    elevation: 5.00,
                    splashColor: Colors.cyan,
                    child: Text('Profile Details'),
                    onPressed: () {
                      final data = Data(
                          otRegistrationId: _profilemasterId.text,
                          patient: _patientController.text,
                          PRNNo: _PRNNo.text,
                          OPDNo: _OPDNo.text,
                          IPDNo: _IPDNoController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(data: data)));

                    },
                  )),
              Container(
                  width: 340.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(color: Colors.lightBlueAccent),
                  child: new RaisedButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    elevation: 5.00,
                    splashColor: Colors.cyan,
                    child: Text('Physical Fitness Details'),
                    onPressed: () {
                      final data = Data(
                          otRegistrationId: _PhysicalFitnessId.text,
                          profileMasterId: _profilemasterId.text,
                          patient: _patientController.text,
                          PRNNo: _PRNNo.text,
                          OPDNo: _OPDNo.text,
                          IPDNo: _IPDNoController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhysicalFitnessForm(data: data)));

                    },
                  )),
              Container(
                  width: 340.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(color: Colors.lightBlueAccent),
                  child: new RaisedButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    elevation: 5.00,
                    splashColor: Colors.cyan,
                    child: Text('Pre Anesthesia Details'),
                    onPressed: () {
                      final data = Data(
                          otRegistrationId: _PreAnesthesiaPart1Id.text,
                          profileMasterId: _profilemasterId.text,
                          patient: _patientController.text,
                          PRNNo: _PRNNo.text,
                          OPDNo: _OPDNo.text,
                          IPDNo: _IPDNoController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreAnaesthesia1(data: data)));

                    },
                  )),
              Container(
                  width: 340.0,
                  height: 40.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(color: Colors.lightBlueAccent),
                  child: new RaisedButton(
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    elevation: 5.00,
                    splashColor: Colors.cyan,
                    child: Text('OT Booking Details'),
                    onPressed: () {
                      final data = Data(
                          otRegistrationId: _otRegistrationId.text,
                          profileMasterId: _profilemasterId.text,
                          patient: _patientController.text,
                          PRNNo: _PRNNo.text,
                          OPDNo: _OPDNo.text,
                          IPDNo: _IPDNoController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTBooking(data: data)));
                    },
                  )),
            ],
          )),
        )),
      ),
    );
  }

  void _setRatingAsOne(myIPDNO) {
    setState(() {
      var _rating = myIPDNO;
    });
  }

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Future<Map> get(String url1, dynamic data, String url2) async {
    var res;
    url2 = uri + "?prnno=" + data;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      _myIPDNO = jsonDecode(response.body)[0]['IPDNo'].toString();

      _OPDNo.text = jsonDecode(response.body)[0]['OPDNo'].toString();
      _IPDNoController.text = jsonDecode(response.body)[0]['IPDNo'].toString();
      _patientController.text = jsonDecode(response.body)[0]['PatientName'].toString();
      _wardController.text = jsonDecode(response.body)[0]['ward'].toString();
      //_PRNNo.text = jsonDecode(response.body)[0]['PRNNo'].toString();

      _bedNoController.text = jsonDecode(response.body)[0]['bedno'].toString();
     _PhysicalFitnessId.text = jsonDecode(response.body)[0]['PhysicalFitnessid'].toString();
     _PreAnesthesiaPart1Id.text = jsonDecode(response.body)[0]['PreAnsthesiaPart1id'].toString();
      _otRegistrationId.text = jsonDecode(response.body)[0]['OTRegistrationid'].toString();
      _profilemasterId.text = jsonDecode(response.body)[0]['profilemasterid'].toString();


//      _setRatingAsOne(_myIPDNO);
    }

    return jsonDecode(response.body);
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}

class Data {
  TextEditingController otreg;
  String otRegistrationId, patient, PRNNo, OPDNo, IPDNo,profileMasterId;

  Data(
      {this.otRegistrationId,
      this.patient,
      this.PRNNo,
      this.OPDNo,
      this.IPDNo,this.profileMasterId
      });
}

class s {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  // Map<String, String> headers = { "Content-Type": "application/json", "Accept": "application/json"};
  // String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';
  var _myIPDNO;

//Post API Call
  Future<Map> get(String url1, dynamic data, String url2) async {
    var res;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      _myIPDNO = jsonDecode(response.body)[0]['IPDNo'].toString();
      var _controller;
      _controller.addListener(_myIPDNO);
      //  var _myIPDNO = jsonDecode(response.body)[0]['OPDNo'];
      var _myIPDNO1 = jsonDecode(response.body)[0]['OPDNo'];
      /* Album(jsonDecode(response.body)[0]['OPDNo'],
        jsonDecode(response.body)[0]['IPDNo'],
        jsonDecode(response.body)[0]['PatientName'],
        jsonDecode(response.body)[0]['ward'],
        jsonDecode(response.body)[0]['bedno'],
        jsonDecode(response.body)[0]['PhysicalFitnessid'],
        jsonDecode(response.body)[0]['PreAnsthesiaPart1id'],
        )*/
      // return Album();
    }

    return jsonDecode(response.body);
  }

  void updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}

class Album {
  final String OPDNo;
  final String IPDNo;
  final String PatientName;
  final String ward;
  final String bedno;
  final String PhysicalFitnessid;
  final String PreAnsthesiaPart1id;
  final String OTRegistrationid;
  final String profilemasterId;

  Album(
      {this.OPDNo,
      this.IPDNo,
      this.PatientName,
      this.ward,
      this.bedno,
      this.PhysicalFitnessid,
      this.PreAnsthesiaPart1id,
      this.OTRegistrationid,
      this.profilemasterId});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      OPDNo: json[0]['OPDNo'],
      IPDNo: json['IPDNo'],
      PatientName: json['PatientName'],
      ward: json['ward'],
      bedno: json['bedno'],
      PhysicalFitnessid: json['PhysicalFitnessid'],
      PreAnsthesiaPart1id: json['PreAnsthesiaPart1id'],
      OTRegistrationid: json['OTRegistrationid'],
      profilemasterId: json['profilemasterId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': OPDNo,
        'email': IPDNo,
      };
}
