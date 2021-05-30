import 'dart:convert';
//import 'dart:io';
import 'dart:io';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:http/io_client.dart';
import 'package:camera/camera.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ot_project/Camera.dart';
import 'package:ot_project/ViewPatientDetails.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'MainActivity.dart';
import 'Session.dart';
import 'package:http_parser/http_parser.dart';



//import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

BuildContext context;

class Profile extends StatefulWidget {
  // String text;

  // Profile(this.text);
  final Data data;
  var imgpath, imgFilename;

  Profile({this.data, this.imgpath, this.imgFilename});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';
  String GetSessions =
      'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
  var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataProfile";
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  static HttpClient httpClient = new HttpClient();


  // Default Drop Down Item.
  String sexdropdownValue = 'Male';
  String warddropdownValue = 'General';
  DateTime now;

  //DateTime _date = DateTime.now();
  DateTime _date = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  DateTime pickedDate;

  String formatted = "";

  //String formatted = formatter.format(_date);
  //String dart1 = formatter.format(now);

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1970),
        lastDate: DateTime(9999));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        formatted = formatter.format(_date);
        // DateTime formatted1 = new DateFormat().add_yMd().format(_date).to;
        print(formatted);
        _date = formatter.parse(formatted);
        var inputFormat = DateFormat('dd-MM-yyyy');
        var inputDate = inputFormat.parse(formatted.toString());
        // <-- Incoming date
        var outputFormat = DateFormat('yyyy-MM-dd');
        var outputDate = outputFormat.format(inputDate); // <-- Desired date
        print(outputDate); // 12/31/2000 11:59 PM﻿
        dateOfAdmission = outputDate;
        _dateofAdmission.text = formatted;

        /*TextEditingController.fromValue(
            TextEditingValue(
                text: dateValue,
                selection: new TextSelection
                    .collapsed(
                    offset: dateValue
                        .length)));*/
      });
    }
  }

  Future<Null> OPDDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1970),
        lastDate: DateTime(9999));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        formatted = formatter.format(_date);
        // DateTime formatted1 = new DateFormat().add_yMd().format(_date).to;
        print(formatted);
        _date = formatter.parse(formatted);
        var inputFormat = DateFormat('dd-MM-yyyy');
        var inputDate = inputFormat.parse(formatted.toString());
        // <-- Incoming date
        var outputFormat = DateFormat('yyyy-MM-dd');
        var outputDate = outputFormat.format(inputDate); // <-- Desired date
        print(outputDate); // 12/31/2000 11:59 PM﻿
        dateOfOpdVisit = outputDate;
        _dateofOPDvisit.text = formatted;

        /*TextEditingController.fromValue(
            TextEditingValue(
                text: dateValue,
                selection: new TextSelection
                    .collapsed(
                    offset: dateValue
                        .length)));*/
      });
    }
  }

  // To show Selected Item in Text.
  String dropdownVal = '';
  String warddownVal = '';
  List<String> genderNames = ['Male', 'Female', 'Other'];

  List<String> wardNames = [
    'General',
    'ICU',
  ];

  void getDropDownItem() {
    setState(() {
      dropdownVal = sexdropdownValue;
    });
  }

  void getDropDownItemWard() {
    setState(() {
      warddownVal = warddropdownValue;
    });
  }

  final patientNameController = TextEditingController();
  final prnNoController = TextEditingController();
  final opdNoController = TextEditingController();
  final ipdNoController = TextEditingController();
  final _OTRegistrationid = TextEditingController();
  final _PRNNo = TextEditingController();
  final _OPDNo = TextEditingController();
  final _IPDNo = TextEditingController();
  final _patientName = TextEditingController();
  final _age = TextEditingController();
  final _sex = TextEditingController();
  final _admittedfor = TextEditingController();
  var _dateofAdmission = TextEditingController();
  final _mobileNo = TextEditingController();
  final _height = TextEditingController();
  final _weight = TextEditingController();
  final _ward = TextEditingController();
  final _bedNo = TextEditingController();
  final _dateofOPDvisit = TextEditingController();
  var dateOfAdmission, dateOfOpdVisit;

  BuildContext context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null) {
      getData(GetSessions, widget.data.otRegistrationId, uri);
    }
  }


  @override
  Widget build(BuildContext context) {

    File img;
    if (widget.imgpath != null) {
      img = new File(widget.imgpath);
    } else {
      img = new File('assests/userph.png');
    }

    /* //File file;
    if(widget.imgpath != null) {
        img = new File(widget.imgpath);


      // UploadImage();

    }else{
      img = new File('assests/userph.png');
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Expanded(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 562.00,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Color(0xFFE1F5FE),
                    margin: new EdgeInsets.fromLTRB(1.0, 3.0, 1.0, 1.0),
                    child: Text('Profile',
                        style: TextStyle(
                            fontSize: 20.00, fontWeight: FontWeight.bold)),
                  ),
                  /* GestureDetector(
                onTap: tmpFunction,
                child: Image.network(
                  'https://flutter-examples.com/wp-content/uploads/2019/09/image_button.png',
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),*/

                  Container(
                    width: 120.0,
                    height: 120.0,
                    padding: const EdgeInsets.all(1.0),

                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle,
                        image: DecorationImage(
                            image: FileImage(img), fit: BoxFit.cover)),
                    child: IconButton(alignment: Alignment.bottomRight,
                        icon: Icon(
                          Icons.camera_alt, color: Colors.black, size: 20.0,),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => CameraScreen('')));
                        }),
                  ),

                  /*   Container(
                  margin: EdgeInsets.only(left: 5.0),
                  */ /* padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
                        margin: new EdgeInsets.fromLTRB(2, 2, 0, 5),*/ /*
                  child: Image.asset('assests/userph.png',
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,)),*/
                  Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('PRN No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  // margin: EdgeInsets.all(2),
                                  margin: new EdgeInsets.fromLTRB(
                                      49.00, 5.0, 5.0, 5.0),
                                  child: TextFormField(
                                    controller: _PRNNo,
                                    //     textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        //labelText: "PRN No",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _PRNNo.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _PRNNo.text.length)));
                                    },
                                  )))
                        ],
                      )),
                  Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('OPD No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  margin: new EdgeInsets.fromLTRB(
                                      49.00, 2.0, 2.0, 2.0),
                                  // margin: EdgeInsets.all(2),
                                  child: TextFormField(
                                      controller: _OPDNo,
                                      //textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          // hintText: "Enter PRN No",
                                          //  labelText: "OPD No",
                                          contentPadding: new EdgeInsets
                                              .symmetric(
                                              vertical: 7.0, horizontal: 5.0),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))),
                                      onChanged: (text) {
                                        TextEditingController.fromValue(
                                            TextEditingValue(
                                                text: _OPDNo.text,
                                                selection: new TextSelection
                                                    .collapsed(
                                                    offset: _OPDNo.text
                                                        .length)));
                                      })))
                        ],
                      )),
                  Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text(' IPD No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  margin: new EdgeInsets.fromLTRB(
                                      49.00, 2.0, 2.0, 2.0),
                                  // margin: EdgeInsets.all(2),
                                  child: TextFormField(
                                    controller: _IPDNo,
                                    //   textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        //   labelText: "IPD No",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _IPDNo.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _IPDNo.text.length)));
                                    },
                                  )))
                        ],
                      )),
                  Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text(' Patient Name',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    controller: _patientName,
                                    //textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        // labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _patientName.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _patientName.text
                                                      .length)));
                                    },
                                  )))
                        ],
                      )),

                  Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text(' Age',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  margin: new EdgeInsets.fromLTRB(
                                      2.0, 0.0, 2.0, 5.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                        width: 80.00,
                                        margin: EdgeInsets.all(2),
                                        child: TextField(
                                          controller: _age,
                                          keyboardType: TextInputType.number,
                                          //textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              // hintText: "Enter PRN No",
                                              // labelText: "Patient Name",
                                              contentPadding: new EdgeInsets
                                                  .symmetric(
                                                  vertical: 7.0,
                                                  horizontal: 5.0),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0))),
                                          onChanged: (text) {
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _age.text,
                                                    selection: new TextSelection
                                                        .collapsed(
                                                        offset: _age.text
                                                            .length)));
                                          },
                                        )),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          10.0, 2.0, 2.0, 2.0),
                                      padding: new EdgeInsets.all(2),
                                      child: Text('Sex',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              letterSpacing: 0.2,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    Flexible(
                                        child: Container(

                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1.0)),
                                            margin: EdgeInsets.fromLTRB(
                                                6.0, 2.0, 1.0, 2.0),
                                            child: new DropdownButton<String>(
                                              value: sexdropdownValue,
                                              hint: Text('Select Gender'),
                                              items: genderNames
                                                  .map<
                                                  DropdownMenuItem<String>>((
                                                  String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String data) {
                                                setState(() {
                                                  sexdropdownValue = data;
                                                });
                                              },
                                            )))
                                  ])))
                        ],
                      )),
                  /*  Container(
                  margin: new EdgeInsets.fromLTRB(2.0,0.0,2.0,5.0),
                  child: Row(children: <Widget>[
                Container(

                  padding: new EdgeInsets.all(2),
                  child: Text('Age',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 0.2,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal)),
                ),
                Flexible(
                    child: Container(
                        width: 80.00,
                        padding: EdgeInsets.all(2),
                        child: TextFormField(
                          controller: _age,
                          // textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: InputDecoration(
                              isDense: true,
                              // hintText: "Enter PRN No",
                              contentPadding: new EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 5.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0))),
                          onChanged: (text) {
                            TextEditingController.fromValue(TextEditingValue(
                                text: _age.text,
                                selection: new TextSelection.collapsed(
                                    offset: _age.text.length)));
                          },
                        ))),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 2.0, 2.0, 2.0),
                  padding: new EdgeInsets.all(2),
                  child: Text('Sex',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          letterSpacing: 0.2,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.normal)),
                ),
                Flexible(
                    child: Container(
                         decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, width: 1.0),)
                        margin: EdgeInsets.fromLTRB(6.0, 2.0, 1.0, 2.0),
                        child: new DropdownButton<String>(
                          value: sexdropdownValue,
                          hint: Text('Select Gender'),
                          items: genderNames
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String data) {
                            setState(() {
                              sexdropdownValue = data;
                            });
                          },
                        )))
              ])),*/
                  Container(
                      margin: new EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('Admitted For',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  //margin: EdgeInsets.all(2),
                                  margin: new EdgeInsets.fromLTRB(
                                      5.00, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    controller: _admittedfor,
                                    // textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        //labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _admittedfor.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _admittedfor.text
                                                      .length)));
                                    },
                                  )))
                        ],
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(2.0, 5.0, 5.0, 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10.0, 5.0, 2.0, 2.0),
                          padding: new EdgeInsets.all(2),
                          child: Text('Date of Admission',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 0.2,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal)),
                        ),

                        Flexible(
                            child: Container(
                                height: 30.0,
                                /*
                            width: 150.00,*/
                                // DateTime now = DateTime.now();
                                // margin: EdgeInsets.fromLTRB(1.0, 2.0, 2.0, 2.0),
                                //  padding: new EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black12, width: 1.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    selectDate(context);
                                  },
                                  child: AbsorbPointer(child: TextFormField(
                                    //textAlign: TextAlign.start,
                                    controller: _dateofAdmission,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: 'Date of Admission',
                                      prefixIcon: Icon(
                                        Icons.dialpad,
                                        color: Colors.white30,
                                      ),
                                    ),
                                  )),)

                              /*Text(
                          _date == null ? DateTime.now() : _date.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 0.2,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal),
                        )*/)),
                      ])),

                  /*   Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.all(5.0),
                    padding: new EdgeInsets.all(2),
                    child: Text('Mobile No     ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0.2,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal)),
                  ),
                  Flexible(
                      child: Container(
                    width: 200.00,
                    //  margin: EdgeInsets.all(2),
                    margin: new EdgeInsets.fromLTRB(5.00, 2.0, 2.0, 2.0),
                    child: TextField(
                      controller: _mobileNo,
                      maxLength: 10,
                      // textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          isDense: true,
                          // hintText: "Enter PRN No",
                          //labelText: "Patient Name",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 5.0),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0))),
                      onChanged: (text) {
                        TextEditingController.fromValue(TextEditingValue(
                            text: _mobileNo.text,
                            selection: new TextSelection.collapsed(
                                offset: _mobileNo.text.length)));
                      },
                    ),
                  ))
                ],
              )),*/

                  Container(
                      margin: new EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Container(

                            padding: new EdgeInsets.all(2),
                            child: Text(' Mobile No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 200.00,
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    controller: _mobileNo,
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    //textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        // labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _mobileNo.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _mobileNo.text
                                                      .length)));
                                    },
                                  )))
                        ],
                      )),

                  Container(
                      margin: new EdgeInsets.all(5.0),
                      child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text(' Height',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 80.00,
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    controller: _height,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    //textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        // labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _height.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _height.text
                                                      .length)));
                                    },
                                  ))),
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text(' Weight',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 80.00,
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    controller: _weight,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    //textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        // labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _weight.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _weight.text
                                                      .length)));
                                    },
                                  ))),
                        ],
                      )),

                  Container(
                      margin: new EdgeInsets.all(5.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('Bed No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 0.2,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Container(
                                  width: 100.00,
                                  //margin: EdgeInsets.all(2),
                                  margin: new EdgeInsets.fromLTRB(
                                      15.00, 2.0, 2.0, 5.0),
                                  child: TextField(
                                    controller: _bedNo,
                                    //  textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        //labelText: "Patient Name",
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0))),
                                    onChanged: (text) {
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: _bedNo.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: _bedNo.text.length)));
                                    },
                                  )))
                        ],
                      )),

                  Container(
                      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Row(children: <Widget>[
                        Container(
                          margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          padding: new EdgeInsets.all(2),
                          child: Text('Date of OPD Visit',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 0.2,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal)),
                        ),

                        Flexible(
                            child: Container(
                                height: 30.0,
                                width: 150.00,
                                // DateTime now = DateTime.now();
                                // margin: EdgeInsets.fromLTRB(1.0, 2.0, 2.0, 2.0),
                                //  padding: new EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black12, width: 1.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    OPDDate(context);
                                  },
                                  child: AbsorbPointer(child: TextFormField(
                                    //textAlign: TextAlign.start,
                                    controller: _dateofOPDvisit,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      hintText: 'Date of Admission',
                                      prefixIcon: Icon(
                                        Icons.dialpad,
                                        color: Colors.white30,
                                      ),
                                    ),
                                  )),)

                              /*Text(
                          _date == null ? DateTime.now() : _date.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 0.2,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal),
                        )*/)),
                      ])),

                  Container(
                      margin: EdgeInsets.all(5.0),
                      child: Row(children: <Widget>[
                        Container(
                          margin: new EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          padding: new EdgeInsets.all(2),
                          child: Text('Ward',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 0.2,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal)),
                        ),
                        Flexible(
                            child: Container(
                              /* decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, width: 1.0),)*/
                                margin: EdgeInsets.fromLTRB(5.0, 2.0, 1.0, 2.0),
                                child: new DropdownButton<String>(
                                  value: warddropdownValue,
                                  //hint: Text('Select Gender'),
                                  items: wardNames
                                      .map<DropdownMenuItem<String>>((
                                      String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),

                                  onChanged: (String data) {
                                    setState(() {
                                      warddropdownValue = data;
                                    });
                                  },
                                )))
                      ])),
                  Container(
                      width: 150.0,
                      height: 40.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: new BoxDecoration(color: Colors.green),
                      child: new RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        elevation: 5.00,
                        splashColor: Colors.green,
                        child: Text('Save'),
                        onPressed: () {
                          String img1 = img.path
                              .split('/')
                              .last;
                          PostSaveContents(img1, img);
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainActivity('MainActivity')));
                        },
                      )),
//Date


                ]),
              ),
            )),
      ),
    );

  }

  void PostSaveContents(var img1, File image) async {
    String sexVal;

    if (sexdropdownValue == 'Male') {
      sexVal = 'M';
    } else if (sexdropdownValue == 'Female') {
      sexVal = 'F';
    } else {
      sexVal = 'O';
    }

    var body = jsonEncode({
      'PRNNo': _PRNNo.text,
      'IPDNo': _IPDNo.text,
      'OPDNo': _OPDNo.text,
      'PatientName': _patientName.text,
      'Age': _age.text,
      'Sex': sexVal,
      'AdmittedFor': _admittedfor.text,
      'DateOfAdmission': dateOfAdmission,
      'MobileNo': _mobileNo.text,
      'Height': _height.text,
      'Weight': _weight.text,
      'Ward': warddropdownValue,
      'BedNo': _bedNo.text,
      'DtOfOPD': dateOfOpdVisit
    });

    //PostFinalAPI(body);
    String b = body;
    //LoginValidation(body);
    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';
    String UploadFile = 'http://ot.ekatm.co.in/api/UploadFilesAPI/UploadFile?ActivityId=';
    String POSTAttachment = 'http://ot.ekatm.co.in/api/UploadFilesAPI/POSTAttachment';



    var res1;
    http.Response response = await http.get(GetSessions, headers: headers);
      updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.post(PostProfile, body: body, headers: headers);
      updateCookie(response);
      res1 = jsonDecode(response.body);
      if (jsonDecode(response.body) != "false") {
        Fluttertoast.showToast(
            msg: "Data save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
        UploadFile = UploadFile + res1;
        var request = http.MultipartRequest("POST", Uri.parse(UploadFile));

        var pic;
try {
   pic = await http.MultipartFile.fromPath("UploadedImage",
      image.path,
      contentType: MediaType('image', 'png'));
}catch (e) {
  String errorText = 'Error ${e.code} \nError message: ${e.description}';
}
        //add multipart to request
        request.files.add(pic);
        request.headers.addAll(imageHeader);
        //  response = http.post(UploadFile,body:request.send(),headers: imageHeader);
        //  response = (await request.send()) as Response;
        updateCookie1(request, response);
        //Get the response from the server
        var res = await request.send();
        var responseData = await res.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        jsonDecode(responseString).toString().split(".");
        updateCookie1(request, response);

        var postAttachRes;
        if(!responseString.contains("Error")){

          var postAttachmentObj = jsonEncode({
              "fileName": img1,
              "SourceId":res1,
              "AttachGuid":jsonDecode(responseString).toString().split(".")[0],
              "SourceType":"Ot",
              "AttachmentType":"Ot"
                  });
          
          response = await http.post(POSTAttachment,body:postAttachmentObj,headers: headers);
          updateCookie(response);
           postAttachRes =  jsonDecode(response.body);
           if(postAttachRes == ""){
             Fluttertoast.showToast(
                 msg: "File Uploaded successfully",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 1,
                 backgroundColor: Colors.lightBlueAccent,
                 textColor: Colors.white
             );
             Navigator.pop(context);
             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>MainActivity('')));
           }else{
             Fluttertoast.showToast(
                 msg: "Unable to upload file successfully",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.BOTTOM,
                 timeInSecForIosWeb: 1,
                 backgroundColor: Colors.lightBlueAccent,
                 textColor: Colors.white
             );
           }
        }


        /***************************************************************************************/
        File file = new File(
            '/storage/emulated/0/DCIM/Camera/IMG_20181122_181848.jpg');
      }
      else{
        Fluttertoast.showToast(
            msg: "Data not save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
      }
/*******************************************************************************/


    }
  }

  // Session().get(GetSessions, body, PostProfile);
  // String res = Session().get(GetSessions, body,Podst).toString();

  // Session().post(PostProfile, body);


  void LoginValidation(String body) async {
    String GetSessions = 'http://ot.ekatm.co.in/api/LoginAPI/GetSessions';
    String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';

    var statusres;
    Response response = await get(GetSessions +
        '?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1');
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON. res = res.replaceAll("\\\\", "");
      var resBody = response.body;

      statusres = 'success';
      if (resBody == "true") {
        HttpClientRequest request =
        await httpClient.postUrl(Uri.parse(PostProfile));
        request.headers.set('content-type', 'application/json');
        request.headers.set("Accept", "application/json");
        request.headers.set("Content-type", "application/json");
        request.add(utf8.encode(body));

        HttpClientResponse response = await request.close();
        String reply = await response.transform(utf8.decoder).join();
        //int r = response.statusCode;
        String r = response.toString();
        String r1 = response.reasonPhrase;
        print(response.statusCode);

        Response res = await http.post(PostProfile,
            headers: {"Content-Type": "application/json"}, body: body);
        String t = jsonDecode(res.body);
        print(t);
        //PostFinalAPI(body);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

    return statusres;
  }

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"

  };

  Map<String,String> imageHeader={
    "Content-type": "multipart/form-data",
    "Accept": "application/json",


  };

  Future<Map> getData(String url1, String data, String url2) async {
    var res;
    url2 = uri + "?profilemasterId=" + data;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);

      _OTRegistrationid.text =
          jsonDecode(response.body)[0]['OTRegistrationid'].toString();
      _PRNNo.text = jsonDecode(response.body)[0]['PRNNo'].toString();
      _OPDNo.text = jsonDecode(response.body)[0]['OPDNo'].toString();
      _IPDNo.text = jsonDecode(response.body)[0]['IPDNo'].toString();
      _patientName.text =
          jsonDecode(response.body)[0]['PatientName'].toString();
      _age.text = jsonDecode(response.body)[0]['Age'].toString();
      sexdropdownValue = jsonDecode(response.body)[0]['Sex'].toString();

      if (sexdropdownValue == "M") {
        sexdropdownValue = "Male";
      } else if (sexdropdownValue == "F") {
        sexdropdownValue = "Female";
      } else {
        sexdropdownValue = "Other";
      }
      _admittedfor.text =
          jsonDecode(response.body)[0]['Admittedfor'].toString();
      String dateOfAdmission = jsonDecode(response.body)[0]['DateofAdmission']
          .toString();
      var dateofAdd = dateOfAdmission.split("T");

      var inputFormat = DateFormat('yyyy-MM-dd');
      var inputDate = inputFormat.parse(dateofAdd[0]);
      // <-- Incoming date
      var outputFormat = DateFormat('dd-MM-yyyy');
      var outputDate = outputFormat.format(inputDate);

      _dateofAdmission.text = outputDate;
      _mobileNo.text = jsonDecode(response.body)[0]['MobileNo'].toString();
      _height.text = jsonDecode(response.body)[0]['Height'].toString();
      _weight.text = jsonDecode(response.body)[0]['Weight'].toString();
      _ward.text = jsonDecode(response.body)[0]['Ward'].toString();
      _bedNo.text = jsonDecode(response.body)[0]['BedNo'].toString();
      // _dateofOPDvisit.text = jsonDecode(response.body)[0]['DateofOPDvisit'].toString();
      String dateOfopdVisit = jsonDecode(response.body)[0]['DateofOPDvisit']
          .toString();
      var dateofOPD = dateOfopdVisit.split("T");

      var inputFormat1 = DateFormat('yyyy-MM-dd');
      var inputDate1 = inputFormat.parse(dateofOPD[0]);
      // <-- Incoming date
      var outputFormat1 = DateFormat('dd-MM-yyyy');
      var outputDate1 = outputFormat.format(inputDate1);
      _dateofOPDvisit.text = outputDate1;

      warddropdownValue = jsonDecode(response.body)[0]['Ward'].toString();


    }

    return jsonDecode(response.body);
  }

  void updateCookie(Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);

    }
    imageHeader['cookie'] = headers['cookie'];

  }
  void updateCookie1(MultipartRequest response, Response response1) {
    String rawCookie = response1.headers['set-cookie'];
    String rawCookie1 = response.headers['content-type'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      imageHeader['cookie'] =
      (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      String errorText = 'Error ${e.code} \nError message: ${e.description}';
    }

    if (mounted) {
      setState(() {});
    }
  }

  void UploadImage(var res1, File img) async {
    String GetSessions = 'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    //String OTRegistration = 'http://ot.ekatm.co.in/api/otAPI/OTRegistration';
    String UploadFile = 'http://ot.ekatm.co.in/api/UploadFilesAPI/UploadFile?ActivityId=' +
        res1;

    String res;
    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);

    var bytes = img.readAsBytesSync();
    var response1 = await http.post(
        UploadFile,
        headers: { "Content-Type": "multipart/form-data"},
        body: { "lang": "fas", "image": bytes},
        encoding: Encoding.getByName("utf-8")
    );

    // response = await http.post(UploadFile, headers: headers);
    //updateCookie(response);
    //res = jsonDecode(response.body);
    if (jsonDecode(response.body) == true) {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>MainActivity('')));
    }
  }

}

class Session1 {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };
  String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';

  Future<Map> get(String url, dynamic data) async {
    http.Response response = await http.get(url, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.post(PostProfile, body: data, headers: headers);
      updateCookie(response);
      String res = jsonDecode(response.body).toString();
      if (res == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainActivity('Main Activity')));
      }
    }
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

Future<http.Response> PostFinalAPI(String body) async {
  String PostProfile = 'http://ot.ekatm.co.in/api/otAPI/PostProfile';
  //var url ='https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';
  // var body = jsonEncode({ 'data': { 'apikey': '12345678901234567890' } });

  print("Body: " + body);

  Response res = await post(PostProfile,
      headers: {"Content-Type": "application/json"}, body: body);
  String t = jsonDecode(res.body);
  print(t);

  http
      .post(PostProfile,
      headers: ({
        "Content-Type": "application/json",
        "Accept": "application/json"
      }),
      body: body)
      .then((http.Response response) {
    if (response.statusCode == 200) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
      return jsonDecode(response.body);
    }
  });
}


