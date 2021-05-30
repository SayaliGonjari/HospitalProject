import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:ot_project/MainActivity.dart';
import 'package:ot_project/ViewPatientDetails.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'Session.dart';
import 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';

class OTBooking extends StatefulWidget {
  /*final String text;
  final String text1;*/

 // var usernameController, patientName, prnNo, opdNo, ipdNo;

  final Data data;
  final String profileMasterId;
  var patientName,opdNo,ipdNo,prnNo;

  OTBooking({this.data, this.profileMasterId,this.patientName, this.prnNo, this.opdNo,this.ipdNo});

  //OTBooking(this.text, this.text1);
  //OTBooking(this.usernameController, this.patientName,this.prnNo,this.opdNo,this.ipdNo,{Key key, Data Data}): super(key: key);

  @override
  _OTBooking createState() => _OTBooking();
}

class _OTBooking extends State<OTBooking> {
  /* TextEditingController usernameController = new TextEditingController();*/
  final TextEditingController _OTRegistrationid = new TextEditingController();
  final TextEditingController _Profilemasterid = new TextEditingController();
  TextEditingController _Daignosis = new TextEditingController();
  final TextEditingController _Surgery = new TextEditingController();
  final TextEditingController _Surgeryplanneddate = new TextEditingController();
  final TextEditingController _PhysicianFitnesstest =
      new TextEditingController();
  final TextEditingController _PreAnesthesiacheckup =
      new TextEditingController();
  final TextEditingController _Lab = new TextEditingController();
  final TextEditingController _Imaging = new TextEditingController();
  final TextEditingController _ImplantRequired = new TextEditingController();
  final TextEditingController _ImplantDate = new TextEditingController();
  final TextEditingController _Implantdetails = new TextEditingController();
  final TextEditingController _NoofBloodBagsrequired =
      new TextEditingController();
  final TextEditingController _Reqforbloodwithsamplesent =
      new TextEditingController();
  final TextEditingController _PostOPbedrequiredin =
      new TextEditingController();
  final TextEditingController _Specialinstrumentreq =
      new TextEditingController();
  final TextEditingController _Anesthetist = new TextEditingController();
  final TextEditingController _OTRegisterSRNo = new TextEditingController();
  final TextEditingController _SurgeryNotes = new TextEditingController();
  final TextEditingController _OTDt = new TextEditingController();
  final _surgeryPlanDt = TextEditingController();
  TextEditingController _patientName1 = new TextEditingController();
  final TextEditingController _prnNo = new TextEditingController();
  final TextEditingController _opdNo = new TextEditingController();
  final TextEditingController _ipdNo = new TextEditingController();

  String additonalInfo = 'Reconstruction';
  String labInfoString = 'Requisition given';
  String imageInfoString = 'Requisition given';
  String implantInfoString = 'Yes, Inform OT Mgr';
  String bloodBagInfoString = '0';
  String bloodSampleInfoString = 'Yes';
 // String recoveryInfoString = 'Recovery';
  String postOPBedString = 'Recovery';
  String patientTypeString = 'Insurance';
  String advancePaidString = 'Pre-Auth received';
  String surgeonString = 'surgeon';
  String residentString = 'Resident';
  String OTStaffString = 'OT Staff';
  String OTBookedNoString = '1';

  List<String> additionalInfoDecision = [
    'Reconstruction',
    'K Wire',
    'Craneatomy',
    'Vertibro Plasty',
    'VP Shunt',
    'Spine Instrumentation',
    'Cross Finger Flap',
    'Abdominal Flap'
  ];
  List<String> labInfoList = ['Requisition given', 'Not Reqd'];
  List<String> imageInfoList = ['Requisition given', 'Not Reqd'];
  List<String> implantInfoList = ['Yes, Inform OT Mgr', 'No'];
  List<String> bloodBagInfoList = ['0', '1', '2', '3', '4', '5', '6'];
  List<String> bloodSampleInfoList = ['Yes', 'No'];
  List<String> recoveryInfoList = ['Recovery', 'ICU', 'Ward'];
  List<String> patientTypeList = ['Insurance', 'Cash Paying'];
  List<String> advancePaidList = ['Pre-Auth received', 'Advance Paid'];
  List<String> surgeonList = ['surgeon', 'Nilesh', 'Siddharrth', 'Sainath'];
  List<String> residentList = ['Resident', 'Shubham', 'Nikhil', 'Sayali'];
  List<String> OTStaffList = ['OT Staff', 'Jitendra', 'Poonam', 'Rambha'];
  List<String> OTBookedNoList = ['1', '2', '3', '4', '5', '6'];

  var diagnosis,
      physicianTest,
      preAnesChkUp,
      implantTextVal,
      specialInstrument,
      anestheticString,
      registerOT,
      surgeryNote;

  DateTime now;
  DateTime _date = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');

  //2021/01/08
  String formatted="";
  Future<Null> SurgeryPlannedDate(BuildContext context) async {



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
        var outputFormat = DateFormat('dd-MM-yyyy');
        var outputDate = outputFormat.format(inputDate); // <-- Desired date
        print(outputDate); // 12/31/2000 11:59 PM﻿

        _surgeryPlanDt.text = formatted;

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

  Future<Null> OTDate(BuildContext context) async {



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
        var outputFormat = DateFormat('dd-MM-yyyy');
        var outputDate = outputFormat.format(inputDate); // <-- Desired date
        print(outputDate); // 12/31/2000 11:59 PM﻿

        _OTDt.text = formatted;

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

   TextEditingController patientNameController = TextEditingController();
   TextEditingController prnNoController = TextEditingController();
   TextEditingController opdNoController = TextEditingController();
   TextEditingController ipdNoController = TextEditingController();
  String GetSessions =
      'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
  var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataOTRegistration";

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get(GetSessions, "text", uri);
  }*/

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Future<Map> get(String url1, dynamic data, String url2) async {
    var res;
    url2 = uri + "?OTRegistrationId=" + data;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);

      _OTRegistrationid.text =
          jsonDecode(response.body)[0]['OTRegistrationid'].toString();
      _Profilemasterid.text =
          jsonDecode(response.body)[0]['Profilemasterid'].toString();
      _Daignosis.text = jsonDecode(response.body)[0]['Daignosis'].toString();
      _Surgery.text = jsonDecode(response.body)[0]['Surgery'].toString();
      _surgeryPlanDt.text =
          jsonDecode(response.body)[0]['Surgeryplanneddate'].toString();
      _PhysicianFitnesstest.text =
          jsonDecode(response.body)[0]['PhysicianFitnesstest'].toString();
      _PreAnesthesiacheckup.text =
          jsonDecode(response.body)[0]['PreAnesthesiacheckup'].toString();
      _Lab.text = jsonDecode(response.body)[0]['Lab'].toString();
      _Imaging.text = jsonDecode(response.body)[0]['Imaging'].toString();
      _ImplantRequired.text =
          jsonDecode(response.body)[0]['ImplantRequired'].toString();
      _ImplantDate.text =
          jsonDecode(response.body)[0]['ImplantDate'].toString();
      _Implantdetails.text = jsonDecode(response.body)[0]['Implantdetails'].toString();
      _NoofBloodBagsrequired.text =
          jsonDecode(response.body)[0]['NoofBloodBagsrequired'].toString();
      _Reqforbloodwithsamplesent.text =
          jsonDecode(response.body)[0]['Reqforbloodwithsamplesent'].toString();
      _PostOPbedrequiredin.text =
          jsonDecode(response.body)[0]['PostOPbedrequiredin'].toString();
      _Specialinstrumentreq.text =
          jsonDecode(response.body)[0]['Specialinstrumentreq'].toString();
      _Anesthetist.text =
          jsonDecode(response.body)[0]['Anesthetist'].toString();
      _OTRegisterSRNo.text =
          jsonDecode(response.body)[0]['OTRegisterSRNo'].toString();
      _SurgeryNotes.text = jsonDecode(response.body)[0]['SurgeryNotes'].toString();
      _OTDt.text = jsonDecode(response.body)[0]['OTDate'].toString();

      /*  "Specialinstrumentreq": "N",
    "Patienttype": "Y",
    "Preauthadvancepaid": "bdsb",
    "Surgeon": "bdsb",
    "Resident": "bdsb",
    "OTStaff": "bdsb",
    "Anesthetist": "bdsb",
    "OTBookedNo": "bdsb",
    "OTRegisterSRNo": "bdsb",
    "OTDate": "2021/01/18",
    "OTTime": "9.00 AM",
    "SurgeryNotes": "bdsb",
    "OTManager": "bdsb",*/

    }

    return jsonDecode(response.body);
  }

  void updateCookie(Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null) {
      get(GetSessions, widget.data.otRegistrationId, uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    patientNameController.text = widget.patientName;
    prnNoController.text = widget.prnNo;
    ipdNoController.text = widget.ipdNo;
    opdNoController.text = widget.opdNo;

    if (widget.data != null) {
      final Data data = widget.data;
      String otReigistrationId = data.otRegistrationId;
      String patientName = data.patient;
      patientNameController.text = data.patient;
      prnNoController.text = data.PRNNo;
      opdNoController.text = data.OPDNo;
      ipdNoController.text = data.IPDNo;
      // get(GetSessions, otReigistrationId, uri);
    }

    /*TextEditingController#eed45(TextEditingValue(text: ┤195f015c-c2a0-4d11-9b94-491077100541├,
    selection: TextSelection(baseOffset: -1, extentOffset: -1,
    affinity: TextAffinity.downstream, isDirectional: false), composing: TextRange(start: -1, end: -1)))*/

    return Scaffold(
        appBar: AppBar(title: Text('Form for OT Booking')),
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 562.00,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(left: 5.0),
                          /* padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
                                      margin: new EdgeInsets.fromLTRB(2, 2, 0, 5),*/
                          child: Image.asset('assests/userph.png',
                              width: 80.0,
                              height: 80.0,
                              alignment: Alignment.center,
                              fit: BoxFit.cover)),
                      Flexible(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.fromLTRB(2.0, 3.0, 1.0, 2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(2.0),
                                        child: Text(
                                          'Patient Name: ',
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
                                      width: 150.0,
                                      height: 30.0,
                                      child: TextFormField(
                                        controller: patientNameController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                        onChanged: (text) {
                                          patientNameController.text = text;
                                        },
                                      ),
                                    )),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(2.0, 3.0, 1.0, 2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(2.0),
                                        child: Text(
                                          'PRN No: ',
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
                                            width: 150.0,
                                            height: 30.0,
                                            margin: EdgeInsets.fromLTRB(
                                                40.0, 2.0, 1.0, 1.0),
                                            child: TextFormField(
                                              controller: prnNoController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              onChanged: (text) {
                                                prnNoController.text = text;
                                              },
                                            ))),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.fromLTRB(2.0, 3.0, 1.0, 2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(2.0),
                                        child: Text(
                                          'OPD No: ',
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
                                            width: 80.0,
                                            height: 30.0,
                                            child: TextFormField(
                                              controller: opdNoController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              onChanged: (text) {
                                                opdNoController.text = text;
                                              },
                                            ))),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            3.0, 2.0, 2.0, 2.0),
                                        child: Text(
                                          ' IPD NO:',
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
                                            width: 80.0,
                                            height: 30.0,
                                            child: TextFormField(
                                              controller: ipdNoController,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              onChanged: (text) {
                                                ipdNoController.text = text;
                                              },
                                            ))),
                                  ],
                                )),
                          ],
                        ),
                      ))
                    ]),
                    Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.0, horizontal: 1.0),
                            child: Container(
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.black,
                            ))),
                    Container(
                        child: Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: AlignmentDirectional.center,
                                //color: Color(0xFFE1F5FE),
                                padding: new EdgeInsets.all(2.0),
                                margin:
                                    new EdgeInsets.fromLTRB(1.0, 2.0, 1.0, 1.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: new Border.all(width: 0.3),
                                    color: Color(0xFFE0F2F1)),
                                /*  decoration: new BoxDecoration(
                                           shape: BoxShape.rectangle,
                                           border: new Border.all(width: 1.0
                                       ))*/
                                child: Text('Form for OT Booking',
                                    style: TextStyle(
                                      fontSize: 15.00,
                                      color: Colors.black,
                                    ))),
                            Container(
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        child: Text(
                                      ' Diagnosis : ',
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
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        //showCursor: true,
                                        controller: _Daignosis,

                                        decoration: InputDecoration(
                                          //labelText: _Daignosis.text,
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
                                         // _Daignosis.text = text;
                                          TextEditingController.fromValue(
                                             new  TextEditingValue(
                                                  text: _Daignosis.text,
                                                  selection: new TextSelection
                                                          .collapsed(
                                                      offset: _Daignosis
                                                          .text.length)));
                                        },
                                      ),
                                    )),
                                  ],
                                )),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(' Surgery',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: additonalInfo,
                                      hint: Text(''),
                                      items: additionalInfoDecision
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          additonalInfo = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(2.0),
                                child: Row(children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 2.0, 2.0),
                                    padding: new EdgeInsets.all(2),
                                    child: Text('Surgery Planned Date',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                  ),

                                  Flexible(
                                      child: Container(alignment: Alignment.centerLeft,
                                          height: 30.0,
                                          width: 150.00,
                                          // DateTime now = DateTime.now();
                                          // margin: EdgeInsets.fromLTRB(1.0, 2.0, 2.0, 2.0),
                                          //  padding: new EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.black12, width: 1.0),
                                          ),
                                          child:GestureDetector(
                                            onTap:(){SurgeryPlannedDate(context); },
                                            child: AbsorbPointer(child: TextFormField(
                                              textAlign: TextAlign.left,
                                              //textAlign: TextAlign.start,
                                              controller: _surgeryPlanDt,
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
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        child: new Flexible(
                                      child: Text(
                                        "Physician's fitness Tests : ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.2,
                                          fontSize: 15,
                                        ),
                                      ),
                                      flex: 1,
                                    )),
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: TextField(
                                        // textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          isDense: true,
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
                                          //physicianTest = text;
                                         // _PhysicianFitnesstest.text = text;
                                          TextEditingController.fromValue(
                                              TextEditingValue(
                                                  text: _PhysicianFitnesstest.text,
                                                  selection: new TextSelection
                                                      .collapsed(
                                                      offset: _PhysicianFitnesstest
                                                          .text.length)));
                                        },
                                      ),
                                    )),

                                    //decoration: new BoxDecoration(color: Colors.green),
                                    Container(
                                        width: 80.0,
                                        height: 30.0,
                                        margin: EdgeInsets.all(2.0),
                                        //decoration: new BoxDecoration(color: Colors.green),
                                        child: new RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.white,
                                          elevation: 5.00,
                                          //  splashColor: Colors.green,
                                          child: Text('View'),
                                          onPressed: () {},
                                        )),
                                  ],
                                )),
                            Container(
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        child: new Flexible(
                                      child: Text(
                                        "Pre-Anesthesia Check-up : ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.2,
                                          fontSize: 15,
                                        ),
                                      ),
                                      flex: 1,
                                    )),
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: TextField(
                                        controller: _PreAnesthesiacheckup,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          isDense: true,
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
                                          //preAnesChkUp = text;
                                          //_PreAnesthesiacheckup.text = text;

                                          TextEditingController.fromValue(
                                              TextEditingValue(
                                                  text: _PreAnesthesiacheckup.text,
                                                  selection: new TextSelection
                                                      .collapsed(
                                                      offset: _PreAnesthesiacheckup
                                                          .text.length)));
                                        },
                                      ),
                                    )),

                                    //decoration: new BoxDecoration(color: Colors.green),
                                    Container(
                                        width: 80.0,
                                        height: 30.0,
                                        margin: EdgeInsets.all(2.0),
                                        //decoration: new BoxDecoration(color: Colors.green),
                                        child: new RaisedButton(
                                          color: Colors.blue,
                                          textColor: Colors.white,
                                          elevation: 5.00,
                                          //  splashColor: Colors.green,
                                          child: Text('View'),
                                          onPressed: () {},
                                        )),
                                  ],
                                )),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text('Lab',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        53.0, 2.0, 2.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: labInfoString,
                                      hint: Text(''),
                                      items: labInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          labInfoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text('Imaging',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        20.0, 0.0, 2.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: imageInfoString,
                                      hint: Text(''),
                                      items: imageInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          imageInfoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text(
                                              'Implant Required and Date',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 1)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        15.0, 2.0, 15.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: implantInfoString,
                                      hint: Text(''),
                                      items: implantInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          implantInfoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                              child: TextField(
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 3.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0)),
                                ),
                                onChanged: (text) {
                                //  _Implantdetails = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: _Implantdetails.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: _Implantdetails
                                                  .text.length)));


                                },
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text(
                                              'No of blood bags required',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 1)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        90.0, 0.0, 10.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: bloodBagInfoString,
                                      hint: Text(''),
                                      items: bloodBagInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          bloodBagInfoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text(
                                              'Requisition for blood with sample sent :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: bloodSampleInfoString,
                                      hint: Text(''),
                                      items: bloodSampleInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          bloodSampleInfoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text(
                                              'Post-OP bed required in :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        85.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: postOPBedString,
                                      hint: Text(''),
                                      items: recoveryInfoList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          postOPBedString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: new Flexible(
                                        child: Text(
                                          'Special Instrument/reuirement : ',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.2,
                                            fontSize: 15,
                                          ),
                                        ),
                                        flex: 1,
                                      ),
                                    ),
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.all(2),
                                      child: TextField(
                                        controller: _Specialinstrumentreq,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          isDense: true,
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
                                          //  specialInstrument = text;
                                        //  _Specialinstrumentreq.text = text;
                                          TextEditingController.fromValue(
                                              TextEditingValue(
                                                  text: _Specialinstrumentreq.text,
                                                  selection: new TextSelection
                                                      .collapsed(
                                                      offset: _Specialinstrumentreq
                                                          .text.length)));
                                        },
                                      ),
                                    )),
                                  ],
                                )),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('Patient Type :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        75.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: patientTypeString,
                                      hint: Text(''),
                                      items: patientTypeList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          patientTypeString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text(
                                              'Pre-authorization / advance paid :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 1)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: advancePaidString,
                                      hint: Text(''),
                                      items: advancePaidList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          advancePaidString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.0, horizontal: 1.0),
                                    child: Container(
                                      height: 1.0,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.black,
                                    ))),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('Surgeon :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: surgeonString,
                                      hint: Text(''),
                                      items: surgeonList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          surgeonString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('Resident :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: residentString,
                                      hint: Text(''),
                                      items: residentList
                                          .map<DropdownMenuItem<String>>(
                                              (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          residentString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('OT Staff :',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: OTStaffString,
                                      hint: Text(''),
                                      items: OTStaffList.map<
                                              DropdownMenuItem<String>>(
                                          (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          OTStaffString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'Anesthetist : ',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.2,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          45.0, 2.0, 2.0, 2.0),
                                      child: TextField(
                                        controller: _Anesthetist,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          isDense: true,
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
                                          //anestheticString = text;
                                       //   _SurgeryNotes.text = text;
                                          TextEditingController.fromValue(
                                            TextEditingValue(text:_Anesthetist.text,
                                                selection: new TextSelection.collapsed(offset: _Anesthetist.text.length)));
                                        },
                                      ),
                                    )),
                                  ],
                                )),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('OT Booked no:',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 2)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        40.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: OTBookedNoString,
                                      hint: Text(''),
                                      items: OTBookedNoList.map<
                                              DropdownMenuItem<String>>(
                                          (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          OTBookedNoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        'OT Register Sr No : ',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.2,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        child: Container(
                                      margin: EdgeInsets.all(2),
                                      child: TextField(
                                        controller: _OTRegisterSRNo,
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                          isDense: true,
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
                                          //  registerOT = text;
                                          //_OTRegisterSRNo.text = text;
                                          TextEditingController.fromValue(TextEditingValue(text: _OTRegisterSRNo.text
                                          ,selection: new TextSelection.collapsed(offset: _OTRegisterSRNo.text.length)));
                                        },
                                      ),
                                    )),
                                  ],
                                )),

                            Container(
                                margin: new EdgeInsets.all(2.0),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                                  Container(
                                    margin: new EdgeInsets.all(2.0),
                                    padding: new EdgeInsets.all(2),
                                    child: Text('Date and Time',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                  ),

                                  Flexible(
                                      child: Container(alignment: Alignment.centerLeft,
                                          height: 30.0,
                                          width: 150.00,
                                          // DateTime now = DateTime.now();
                                          // margin: EdgeInsets.fromLTRB(1.0, 2.0, 2.0, 2.0),
                                          //  padding: new EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.black12, width: 1.0),
                                          ),
                                          child:GestureDetector(
                                            onTap:(){OTDate(context); },
                                            child:AbsorbPointer(
                                           child: TextFormField(
                                              textAlign: TextAlign.start,
                                              controller: _OTDt,
                                              keyboardType: TextInputType.datetime,
                                              decoration: InputDecoration(
                                               // hintText: 'Date of Admission',
                                                prefixIcon: Icon(
                                                  Icons.dialpad,
                                                  color: Colors.white30,
                                                ),
                                              ),
                                            ),))

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
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.all(2),
                                child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              2.0, 2.0, 2.0, 2.0),
                                          //padding: new EdgeInsets.all(2),
                                          child: new Text(
                                            "Surgery note : ",
                                            //  textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.2,
                                              fontSize: 15,
                                            ),
                                          )),
                                      Container(
                                          margin: EdgeInsets.fromLTRB(
                                              8.0, 2.0, 10.0, 2.0),
                                          child: TextField(
                                            controller: _SurgeryNotes,
                                            maxLines: 3,
                                            textAlign: TextAlign.start,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    new EdgeInsets.symmetric(
                                                        vertical: 7.0,
                                                        horizontal: 3.0),
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1.0))),
                                            onChanged: (text) {
                                              // surgeryNote = text;
                                            //  _SurgeryNotes.text = text;
                                              TextEditingController.fromValue(TextEditingValue(text: _SurgeryNotes.text
                                                  ,selection: new TextSelection.collapsed(offset: _SurgeryNotes.text.length)));
                                            },
                                          ))
                                    ])),
                            Container(
                              margin: new EdgeInsets.all(2.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      child: new Flexible(
                                          child: Text('OT Manager Approval:',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 0.2,
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.normal)),
                                          flex: 1)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        15.0, 0.0, 20.0, 2.0),
                                    child: new DropdownButton<String>(
                                      value: OTBookedNoString,
                                      hint: Text(''),
                                      items: OTBookedNoList.map<
                                              DropdownMenuItem<String>>(
                                          (String Value) {
                                        return DropdownMenuItem<String>(
                                          value: Value,
                                          child: Text(Value),
                                        );
                                      }).toList(),
                                      onChanged: (String data) {
                                        setState(() {
                                          OTBookedNoString = data;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      width: 150.0,
                                      height: 40.0,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(2.0),
                                      //decoration: new BoxDecoration(color: Colors.green),
                                      child: new RaisedButton(
                                        color: Colors.green,
                                        textColor: Colors.white,
                                        elevation: 5.00,
                                        //  splashColor: Colors.green,
                                        child: Text('Save'),
                                        onPressed: () {
                                          PostSaveContents(widget.data.profileMasterId);
                                        },
                                      )),
                                  Container(
                                      width: 150.0,
                                      height: 40.0,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(2.0),
                                      // decoration: new BoxDecoration(color: Colors.red),
                                      child: new RaisedButton(
                                        color: Colors.red,
                                        textColor: Colors.white,
                                        elevation: 5.00,
                                        splashColor: Colors.red,
                                        child: Text('Cancel'),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )),
        ));
  }

  Future<void> PostSaveContents(String profileMasterId) async {
   /* DateFormat formatter = DateFormat('yyyy/MM/dd');
    var split_date = _date.toString().split(" ");
    String _dateVal = split_date[0];*/

    var body = jsonEncode({
      'ProfileMasterId': profileMasterId,
      'Diagonosis': _Daignosis.text,
      'Surgery': additonalInfo,
      'SurgeryPlanDt': _surgeryPlanDt.text,
      'PhyFitnessTest': _PhysicianFitnesstest.text,
      'PreAnaethesiaCheckup': _PreAnesthesiacheckup.text,
      'Lab': labInfoString,
      'Imaging': imageInfoString,
      'ImplantReqDt': implantInfoString,
      //details
      'BloodBagReq': bloodBagInfoString,
      'ReqBloodSample': bloodSampleInfoString,
      'PostOPBed': postOPBedString,
      'Instrument': _Specialinstrumentreq.text,
      'PatientType': patientTypeString,
      'AdvancePaid': advancePaidString,
      'Surgeon': surgeonString,
      'Resident': residentString,
      'OTStaff': OTStaffString,
      'Anesthetist': _Anesthetist.text,
      'OTBookNo': OTBookedNoString,
      'OTRegisterNo': _OTRegisterSRNo.text,
      'Date': _OTDt.text,
      'Time': '09:00 AM',
      'SurgeryNotes': _SurgeryNotes.text,
      'OTManagerAppr': OTBookedNoString
    });
    print(body);



    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    //String OTRegistration = 'http://ot.ekatm.co.in/api/otAPI/OTRegistration';
    String OTRegistration = 'http://ot.ekatm.co.in/api/otAPI/PostRegistForm';
    //Session().get(GetSessions, body, OTRegistration);

    String res ;
    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if(jsonDecode(response.body) == true) {
      response = await http.post(OTRegistration, body: body, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      if(jsonDecode(response.body) == "true"){
        Fluttertoast.showToast(
            msg: "Data  save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>MainActivity('')));
      }else{
        Fluttertoast.showToast(
            msg: "Data not save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
      }

    }


  }
}

/* {
      "Diagonosis": "XYZ",
    "Surgery": "XYZ",
    "SurgeryPlanDt": "TSF",
    "PhyFitnessTest": "gfweg",
    "PreAnaethesiaCheckup": "2021/01/08",
    "Lab": "bdsb",
    "Imaging": "156",
    "ImplantReqDt": "25",
    "BloodBagReq": "0",
    "ReqBloodSample": "N",
    "PostOPBed": "Y",
    "Instrument": "N",
    "PatientType": "Y",
    "AdvancePaid": "bdsb",
    "Surgeon": "bdsb",
    "Resident": "bdsb",
    "OTStaff": "bdsb",
    "Anesthetist": "bdsb",
    "OTBookNo": "bdsb",
    "OTRegisterNo": "bdsb",
    "Date": "2021/01/18",
    "Time": "9.00 AM",
    "SurgeryNotes": "bdsb",
    "OTManagerAppr": "bdsb"
  }*/
