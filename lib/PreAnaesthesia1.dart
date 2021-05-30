import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'MainActivity.dart';
import 'PreAnaesthesia2.dart';
import 'Session.dart';
import 'ViewPatientDetails.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PreAnaesthesia1 extends StatefulWidget {
    String profileMasterId;
    var patientName,opdNo,ipdNo,prnNo;
  final Data data;

  PreAnaesthesia1(
      {this.data, this.profileMasterId, this.patientName, this.prnNo, this.opdNo,this.ipdNo});

  // PreAnaesthesia1(this.text);

  @override
  _PreAnaesthesia1 createState() => _PreAnaesthesia1();
}

class _PreAnaesthesia1 extends State<PreAnaesthesia1> {
  String GetSessions =
      'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
  var GetPreAnesthesiaData =
      "http://ot.ekatm.co.in/api/OTAPI/GetDataAnesthesiapart1";
  final TextEditingController _patientName1 = new TextEditingController();
  final TextEditingController _prnNo = new TextEditingController();
  final TextEditingController _opdNo = new TextEditingController();
  final TextEditingController _ipdNo = new TextEditingController();
  final TextEditingController _ReferringSurgeon = new TextEditingController();
  final TextEditingController _PreOperativeDiagnosis = new TextEditingController();
  final TextEditingController _SurgeryPlanned = new TextEditingController();
  final TextEditingController _PhyassdonebyDr = new TextEditingController();
  final TextEditingController _allergies = new TextEditingController();
  final TextEditingController _DMSince = new TextEditingController();
  final TextEditingController _HTSince = new TextEditingController();
  final TextEditingController _IHDSince = new TextEditingController();
  final TextEditingController _AsthmaCOPDSince = new TextEditingController();
  final TextEditingController _OthersSince = new TextEditingController();
  final TextEditingController _UrineRM = new TextEditingController();
  final TextEditingController _BloodGroup = new TextEditingController();
  final TextEditingController _CXR = new TextEditingController();
  final TextEditingController _OtherInvestigation = new TextEditingController();
  final TextEditingController _ECG = new TextEditingController();
  final TextEditingController _TwoDEcho = new TextEditingController();
  final TextEditingController _Additionalinvestigation =
      new TextEditingController();
  final TextEditingController _Familyhistory = new TextEditingController();
  final TextEditingController _HBDate = new TextEditingController();
  final TextEditingController _HBResult = new TextEditingController();
  final TextEditingController _TLCDate = new TextEditingController();
  final TextEditingController _TLCResult = new TextEditingController();
  final TextEditingController _DLCDate = new TextEditingController();
  final TextEditingController _DLCResult = new TextEditingController();
  final TextEditingController _ESRDate = new TextEditingController();
  final TextEditingController _ESRResult = new TextEditingController();
  final TextEditingController _PltDate = new TextEditingController();
  final TextEditingController _PltResult = new TextEditingController();
  final TextEditingController _BTDate = new TextEditingController();
  final TextEditingController _BTResult = new TextEditingController();
  final TextEditingController _CTDate = new TextEditingController();
  final TextEditingController _CTResult = new TextEditingController();
  final TextEditingController _PTDate = new TextEditingController();
  final TextEditingController _PTResult = new TextEditingController();
  final TextEditingController _PTTDate = new TextEditingController();
  final TextEditingController _PTTResult = new TextEditingController();
  final TextEditingController _SugarFDate = new TextEditingController();
  final TextEditingController _SugarFResult = new TextEditingController();
  final TextEditingController _SugarPPDate = new TextEditingController();
  final TextEditingController _SugarPPResult = new TextEditingController();
  final TextEditingController _UreaDate = new TextEditingController();
  final TextEditingController _UreaResult = new TextEditingController();
  final TextEditingController _CreatineDate = new TextEditingController();
  final TextEditingController _CreatineResult = new TextEditingController();
  final TextEditingController _NaDate = new TextEditingController();
  final TextEditingController _NaResult = new TextEditingController();
  final TextEditingController _KDate = new TextEditingController();
  final TextEditingController _KResult = new TextEditingController();
  final TextEditingController _ClDate = new TextEditingController();
  final TextEditingController _ClResult = new TextEditingController();
  final TextEditingController _SurgeryDate1 = new TextEditingController();
  final TextEditingController _SurgeryProcedure1 = new TextEditingController();
  final TextEditingController _Surgery1 = new TextEditingController();
  final TextEditingController _SurgeryDate2 = new TextEditingController();
  final TextEditingController _SurgeryProcedure2 = new TextEditingController();
  final TextEditingController _Surgery2 = new TextEditingController();
  final TextEditingController _SurgeryDate3 = new TextEditingController();
  final TextEditingController _SurgeryProcedure3 = new TextEditingController();
  final TextEditingController _Surgery3 = new TextEditingController();

  bool _islooseChecked = false;
  String _isLooseChckString = "N",
      _isCrownChckString = "N",
      _isdentureChckString = "N",
      _isfalseChckString = "N",
      _ismisChckString = "N",
      _isChckBoxChckString = "N";
  bool _iscrownedChecked = false;
  bool _isdentureChecked = false;



  var refSurgeon,
      preOpeDiagnosis,
      surgeryPlan,
      notesByDR,
      date,
      allergy,
      height,
      weight,
      chkSmoke = 'N',
      chkAlcohol = 'N',
      chkTobacco = 'N',
      chkNone = 'N',
      chkOther = 'N',
      otherReason,
      familyHistory,
      urineRM,
      bloodGrp,
      valCXR,
      other,
      ECG,
      echo2D,
      addInvReq,
      addInvReqNote,
      surgical1,
      surgical2,
      surgical3,
      date1,
      date2,
      date3,
      procedure1,
      procedure2,
      procedure3,
      valHBDt,
      valHBResult,
      valTLCDt,
      valTLCResult,
      valDLCDt,
      valDLCResult,
      valESRDt,
      valESRResult,
      valPltDt,
      valPltResult,
      valBTDt,
      valBTResult,
      valCTDt,
      valCTResult,
      valPtDt,
      valPtResult,
      valPTTDt,
      valPTTResult,
      valSugarFDt,
      valSugarFResult,
      valSugarPPDt,
      valSugarPPResult,
      valUreaDt,
      valUreaResult,
      valCreatineDt,
      valCreatineResult,
      valNaDt,
      valNaResult,
      valKDt,
      valKResult,
      valClDt,
      valClResult;

  DateTime now;
  DateTime _date = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');

  Future<Null> selectDate(BuildContext context) async {
    String formatted = formatter.format(_date);
    print(formatted);
    _date = formatter.parse(formatted);

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1970),
        lastDate: DateTime(9999));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }

  var additonalInfo = 'Yes';
  String patientName, prnNo, OPDNo, IPDNo;

  List<String> additionalInfoDecision = ['Yes', 'No'];

  @override
  void initState() {
    // TODO: implement initState

    if (widget.data != null) {
      getData(GetSessions, widget.data.otRegistrationId, GetPreAnesthesiaData);
    }
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _patientName1.text = widget.patientName;
    _prnNo.text = widget.prnNo;
    _opdNo.text = widget.opdNo;
    _ipdNo.text = widget.ipdNo;

    if (widget.data != null) {
      final Data data = widget.data;
      String otReigistrationId = data.otRegistrationId;
      String patientName = data.patient;
      _patientName1.text = data.patient;
      _prnNo.text = data.PRNNo;
      _ipdNo.text = data.OPDNo;
      _opdNo.text = data.IPDNo;
      // get(GetSessions, otReigistrationId, uri);
    }
        // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Pre-Anesthesia')),
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
                 child: Column(children: <Widget>[
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
                                          controller: _patientName1,
                                          /*onChanged: (text) {
                                            patientName = text;
                                          },*/
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)))))),
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
                                          controller:_prnNo,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                        onChanged: (text) {
                                          prnNo = text;
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
                                          controller: _opdNo,
                                          onChanged: (text) {
                                            OPDNo = text;
                                          },
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)))))),
                              Container(
                                  margin:
                                      EdgeInsets.fromLTRB(3.0, 2.0, 2.0, 2.0),
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
                                          controller:_ipdNo,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                        onChanged: (text) {
                                          IPDNo = text;
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
                      padding:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                      child: Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ))),
              Container(
                  child: Flexible(
                      child: SingleChildScrollView(
                          child: Flexible(
                              child: Column(children: <Widget>[
                Container(
                    alignment: AlignmentDirectional.center,
                    //color: Color(0xFFE1F5FE),
                    padding: new EdgeInsets.all(2.0),
                    margin: new EdgeInsets.fromLTRB(1.0, 2.0, 1.0, 1.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: new Border.all(width: 0.3),
                        color: Color(0xFFE0F2F1)),
                    /*  decoration: new BoxDecoration(
                                           shape: BoxShape.rectangle,
                                           border: new Border.all(width: 1.0
                                       ))*/
                    child:
                        Text('Pre-Anesthesia Check up & Pre-Induction Check up',
                            style: TextStyle(
                              fontSize: 15.00,
                              color: Colors.black,
                            ))),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: new Flexible(
                          child: Text(
                            'Referring Surgeon : ',
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
                          margin: EdgeInsets.fromLTRB(35.0, 2.0, 2.0, 2.0),
                          child: TextField(
                            controller: _ReferringSurgeon,
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
                              //   _ReferringSurgeon = text;

                              TextEditingController.fromValue(TextEditingValue(
                                  text: _ReferringSurgeon.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _ReferringSurgeon.text.length)));
                            },
                          ),
                        )),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: new Flexible(
                          child: Text(
                            'Pre-Operative diagnosis : ',
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
                          // margin: EdgeInsets.all(2),
                          child: TextField(
                            controller: _PreOperativeDiagnosis,
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
                              //  preOpeDiagnosis = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _PreOperativeDiagnosis.text,
                                  selection: new TextSelection.collapsed(
                                      offset:
                                          _PreOperativeDiagnosis.text.length)));
                            },
                          ),
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
                            'Surgery Planned : ',
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
                          //  width: 800.0,
                          margin: EdgeInsets.fromLTRB(45.0, 2.0, 2.0, 2.0),
                          child: TextField(
                            controller: _SurgeryPlanned,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding:
                                  new EdgeInsets.symmetric(vertical: 7.0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0)),
                            ),
                            onChanged: (text) {
                              // surgeryPlan = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _SurgeryPlanned.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _SurgeryPlanned.text.length)));
                            },
                          ),
                        )),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(3.0, 2.0, 2.0, 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Container(
                        new Flexible(
                            child: new Text(
                              "Noted Physician's  assessment done by  DR.: ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                letterSpacing: 0.2,
                                fontSize: 15,
                              ),
                            ),
                            flex: 1), //),
                        Flexible(
                            child: Container(
                          alignment: Alignment.center,
                          //margin: EdgeInsets.fromLTRB(1.0,2.0,2.0,2.0),
                          child: TextField(
                            controller: _PhyassdonebyDr,
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
                              // notesByDR = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _PhyassdonebyDr.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _PhyassdonebyDr.text.length)));
                            },
                          ),
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
                            "Allergies: ",
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
                        Container(
                          width: 200.0,
                          // margin: EdgeInsets.fromLTRB(4.0, 2.0, 2.0, 2.0),
                          child: TextField(
                            controller: _allergies,
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
                              //  allergy = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _allergies.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _allergies.text.length)));
                            },
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Flexible(
                            child: new Text(
                              "Height : ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                letterSpacing: 0.2,
                                fontSize: 15,
                              ),
                            ),
                            flex: 1),
                        Flexible(
                            child: Container(
                          width: 100.0,
                          margin: EdgeInsets.fromLTRB(7.0, 2.0, 2.0, 2.0),
                          child: TextField(
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
                              height = text;
                            },
                          ),
                        )),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Flexible(
                            child: new Text(
                              "Weight : ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto',
                                letterSpacing: 0.2,
                                fontSize: 15,
                              ),
                            ),
                            flex: 1),
                        Flexible(
                            child: Container(
                          //margin: EdgeInsets.all(2),
                          width: 100.0,
                          margin: EdgeInsets.fromLTRB(6.0, 2.0, 2.0, 2.0),
                          child: TextField(
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
                              weight = text;
                            },
                          ),
                        )),
                      ],
                    )),

                //History
                Container(
                    //width: MediaQuery.of(context).size.width - 50.0,
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      // color: Colors.black,
                      color: Color(0xFFE0F2F1),
                      /* gradient: LinearGradient(
                                      colors: [Color(0xFFE0F2F1),Color(0xFFE0F7FA)],
                                        // colors: [Color(0xffebac38), Color(0xffde4d2a)],
                                        // begin: Alignment.center,
                                        // end: Alignment(-1.0, -1.0)), //Gradient
                                     )*/
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                              child: Text(
                                'History',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(children: <Widget>[
                                DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'Medical',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Since',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    ))
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'DM',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _DMSince,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //DMVal = text;
                                            TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: _DMSince.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _DMSince
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'HT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _HTSince,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  _HTSince = text;
                                            TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: _HTSince.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _HTSince
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'IHD',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _IHDSince,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  IHDVal = text;
                                            TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: _IHDSince.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _IHDSince
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Asthama/COPD',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _AsthmaCOPDSince,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // asthmaVal = text;
                                            TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: _AsthmaCOPDSince.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _AsthmaCOPDSince
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Others',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _OthersSince,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //otherVal = text;
                                            TextEditingController.fromValue(
                                                new TextEditingValue(
                                                    text: _OthersSince.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _OthersSince
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                    ])
                                  ],
                                )
                              ]))
                        ])),
                Container(
                    width: MediaQuery.of(context).size.width * 1.6,
                    // margin: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      // color: Colors.black,
                      color: Color(0xFFE0F2F1),
                      /* gradient: LinearGradient(
                                      colors: [Color(0xFFE0F2F1),Color(0xFFE0F7FA)],
                                        // colors: [Color(0xffebac38), Color(0xffde4d2a)],
                                        // begin: Alignment.center,
                                        // end: Alignment(-1.0, -1.0)), //Gradient
                                     )*/
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(children: <Widget>[
                                DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'Surgical',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Date',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Procedure',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(Container(
                                        width: 30,
                                        //margin: new EdgeInsets.only(top: 60.0),
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: TextField(
                                          controller: _Surgery1,
                                          textAlign: TextAlign.start,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  surgical1 = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _Surgery1.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _Surgery1
                                                            .text.length)));
                                          },
                                        ),
                                      )),
                                      DataCell(Container(
                                        width: 50,
                                        child: TextField(
                                          controller: _SurgeryDate1,
                                          textAlign: TextAlign.start,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //date1 = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _SurgeryDate1.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _SurgeryDate1
                                                            .text.length)));
                                          },
                                        ),
                                      )),
                                      DataCell(Container(
                                        width: 50,
                                        child: TextField(
                                          controller: _SurgeryProcedure1,
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //procedure1 = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text:
                                                        _SurgeryProcedure1.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset:
                                                            _SurgeryProcedure1
                                                                .text.length)));
                                          },
                                        ),
                                      ))
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Container(
                                            width: 30,
                                            //margin: new EdgeInsets.only(top: 60.0),
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: TextField(
                                                controller: _Surgery2,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  // surgical2 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _Surgery2.text,
                                                          selection:
                                                              new TextSelection
                                                                      .collapsed(
                                                                  offset: _Surgery2
                                                                      .text
                                                                      .length)));
                                                })),
                                      ),
                                      DataCell(
                                        Container(
                                            width: 50,
                                            child: TextField(
                                                controller: _SurgeryDate2,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  // date2 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _SurgeryDate2
                                                              .text,
                                                          selection: new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _SurgeryDate2
                                                                      .text
                                                                      .length)));
                                                })),
                                      ),
                                      DataCell(
                                        Container(
                                            width: 50,
                                            child: TextField(
                                                controller: _SurgeryProcedure2,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  // procedure2 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _SurgeryProcedure2
                                                              .text,
                                                          selection: new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _SurgeryProcedure2
                                                                      .text
                                                                      .length)));
                                                })),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Container(
                                            width: 50,
                                            child: TextField(
                                                controller: _Surgery3,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  //   surgical3 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _Surgery3.text,
                                                          selection:
                                                              new TextSelection
                                                                      .collapsed(
                                                                  offset: _Surgery3
                                                                      .text
                                                                      .length)));
                                                })),
                                      ),
                                      DataCell(
                                        Container(
                                            width: 50,
                                            child: TextField(
                                                controller: _SurgeryDate3,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  // date3 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _SurgeryDate3
                                                              .text,
                                                          selection: new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _SurgeryDate3
                                                                      .text
                                                                      .length)));
                                                })),
                                      ),
                                      DataCell(
                                        Container(
                                            width: 50,
                                            child: TextField(
                                                controller: _SurgeryProcedure3,
                                                decoration: new InputDecoration(
                                                  hintText: '-',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  // procedure3 = text;
                                                  TextEditingController.fromValue(
                                                      TextEditingValue(
                                                          text: _SurgeryProcedure3
                                                              .text,
                                                          selection: new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _SurgeryProcedure3
                                                                      .text
                                                                      .length)));
                                                })),
                                      )
                                    ]),
                                  ],
                                )
                              ]))
                        ])),

                /*Container(
                                    height : 30.0,
                                    margin: EdgeInsets.all(0),
                                    padding: EdgeInsets.all(0),
                                    // width: MediaQuery.of(context).size.width ,
                                    child:Expanded(child:Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              width: 150.0,
                                              child:CheckboxListTile(

                                                dense: true,
                                              ///  value: _isdentureChecked,
                                                onChanged: (bool value){
                                                  setState(() {
                                                 //   _isdentureChecked = value;
                                                    if(value){
                                                   //   _isdentureChckString = "Y";
                                                    }else{
                                                    //  _isdentureChckString = "N";
                                                    }
                                                   // print("Selected$_isdentureChecked");
                                                  });
                                                },
                                                // checkColor: Colors.white,
                                                activeColor: Colors.blue,title: Text('Smoking'),

                                                controlAffinity: ListTileControlAffinity.leading,)),
                                          Container(
                                              width: 150.0,
                                              child:CheckboxListTile(
                                                dense: true,
                                               // value: _isflaseChecked,
                                                onChanged: (bool value){
                                                  setState(() {
                                                   // _isflaseChecked = value;
                                                    if(value){
                                                    //  _isfalseChckString = "Y";
                                                    }else{
                                                     // _isfalseChckString = "N";
                                                    }
                                                 //   print("Selected$_isflaseChecked");
                                                  });
                                                },
                                                // checkColor: Colors.white,
                                                activeColor: Colors.blue,title: Text('Alcohol'),

                                                controlAffinity: ListTileControlAffinity.leading,))
                                        ]))),*/

                //Family History
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' Family History : ',
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
                            controller: _Familyhistory,
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
                              // familyHistory = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _Familyhistory.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _Familyhistory.text.length)));
                            },
                          ),
                        ))
                      ],
                    )),
                Container(
                    //width: MediaQuery.of(context).size.width - 50.0,
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      // color: Colors.black,
                      color: Color(0xFFE0F2F1),
                      /* gradient: LinearGradient(
                                      colors: [Color(0xFFE0F2F1),Color(0xFFE0F7FA)],
                                        // colors: [Color(0xffebac38), Color(0xffde4d2a)],
                                        // begin: Alignment.center,
                                        // end: Alignment(-1.0, -1.0)), //Gradient
                                     )*/
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(children: <Widget>[
                                DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'SR No.',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Physical Findings',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    ))
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        Text('BP',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto')),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        Text('Pulse',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto')),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '3',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        Text('Airway',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto')),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '4',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        Text('RS',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto')),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '5',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        Text('CVS',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Roboto')),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '6',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            decoration: new InputDecoration(
                                          hintText: '-',
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        )),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '7',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            decoration: new InputDecoration(
                                          hintText: '-',
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        )),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '8',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            decoration: new InputDecoration(
                                          hintText: '-',
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        )),
                                      ),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          '9',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            decoration: new InputDecoration(
                                          hintText: '-',
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        )),
                                      ),
                                    ])
                                  ],
                                )
                              ]))
                        ])),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      // color: Colors.black,
                      color: Color(0xFFE0F2F1),
                      /* gradient: LinearGradient(
                                      colors: [Color(0xFFE0F2F1),Color(0xFFE0F7FA)],
                                        // colors: [Color(0xffebac38), Color(0xffde4d2a)],
                                        // begin: Alignment.center,
                                        // end: Alignment(-1.0, -1.0)), //Gradient
                                     )*/
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                              child: Text(
                                'Investigations taken in consideration',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Row(children: <Widget>[
                                DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(
                                        label: Text(
                                      'Inv',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      'Result',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontFamily: 'Roboto'),
                                    )),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'HB',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _HBDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valHBDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _HBDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _HBDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _HBResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valHBResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _HBResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _HBResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'TLC',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _TLCDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valTLCDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _TLCDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _TLCDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _TLCResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valTLCResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _TLCResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _TLCResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'DLC',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _DLCDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valDLCDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _DLCDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _DLCDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _DLCResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  valDLCResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _DLCResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _DLCResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'ESR',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _ESRDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valESRDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _ESRDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _ESRDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _ESRResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valESRResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _ESRResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _ESRResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Plt',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _PltDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valPltDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _PltDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _PltDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _PltResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valPltResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _PltResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _PltResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'BT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _BTDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valBTDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _BTDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _BTDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _BTResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valBTResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _BTResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _BTResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'CT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _CTDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valCTDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _CTDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _CTDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _CTResult,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //valCTResult = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _CTResult.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _CTResult
                                                                  .text
                                                                  .length)));
                                            }),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'PT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _PTDate,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //valPtDt = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _PTDate.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _PTDate
                                                                  .text
                                                                  .length)));
                                            }),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _PTResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valPtResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _PTResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _PTResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'PTT',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _PTTDate,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //valPTTDt = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _PTTDate.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _PTTDate
                                                                  .text
                                                                  .length)));
                                            }),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _PTTResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valPTTResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _PTTResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _PTTResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Sugar F',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _SugarFDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valSugarFDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _SugarFDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _SugarFDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _SugarFResult,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //valSugarFResult = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _SugarFResult.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _SugarFResult
                                                                      .text
                                                                      .length)));
                                            }),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'SugarPP',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _SugarPPDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  valSugarPPDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _SugarPPDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _SugarPPDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _SugarPPResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valSugarPPResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _SugarPPResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _SugarPPResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Urea',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _UreaDate,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //  valUreaDt = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _UreaDate.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _UreaDate
                                                                  .text
                                                                  .length)));
                                            }),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _UreaResult,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              // valUreaResult = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _UreaResult.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _UreaResult
                                                                  .text
                                                                  .length)));
                                            }),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Creatine',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _CreatineDate,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              // valCreatineDt = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _CreatineDate.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset:
                                                                  _CreatineDate
                                                                      .text
                                                                      .length)));
                                            }),
                                      ),
                                      DataCell(TextField(
                                          controller: _CreatineResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //  valCreatineResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _CreatineResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _CreatineResult
                                                            .text.length)));
                                          }))
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Na+',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _NaDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valNaDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _NaDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _NaDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _NaResult,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            // valNaResult = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _NaResult.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _NaResult
                                                            .text.length)));
                                          },
                                        ),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'K+',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _KDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valKDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _KDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _KDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _KResult,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //valKResult = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _KResult.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _KResult
                                                                  .text
                                                                  .length)));
                                            }),
                                      )
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          'Cl-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                          controller: _ClDate,
                                          decoration: new InputDecoration(
                                            hintText: '-',
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                          ),
                                          onChanged: (text) {
                                            //valClDt = text;
                                            TextEditingController.fromValue(
                                                TextEditingValue(
                                                    text: _ClDate.text,
                                                    selection: new TextSelection
                                                            .collapsed(
                                                        offset: _ClDate
                                                            .text.length)));
                                          },
                                        ),
                                      ),
                                      DataCell(
                                        TextField(
                                            controller: _ClResult,
                                            decoration: new InputDecoration(
                                              hintText: '-',
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                            onChanged: (text) {
                                              //  valClResult = text;
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: _ClResult.text,
                                                      selection:
                                                          new TextSelection
                                                                  .collapsed(
                                                              offset: _ClResult
                                                                  .text
                                                                  .length)));
                                            }),
                                      )
                                    ]),
                                  ],
                                )
                              ]))
                        ])),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          '  Urine R/M : ',
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
                          margin: EdgeInsets.fromLTRB(15.0, 2.0, 2.0, 2.0),
                          child: TextField(
                              controller: _UrineRM,
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
                                //  urineRM = text;
                                TextEditingController.fromValue(
                                    TextEditingValue(
                                        text: _UrineRM.text,
                                        selection: new TextSelection.collapsed(
                                            offset: _UrineRM.text.length)));
                              }),
                        ))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' Blood Group : ',
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
                              controller: _BloodGroup,
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
                                //bloodGrp = text;
                                TextEditingController.fromValue(
                                    TextEditingValue(
                                        text: _BloodGroup.text,
                                        selection: new TextSelection.collapsed(
                                            offset: _BloodGroup.text.length)));
                              }),
                        ))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' CXR : ',
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
                          margin: EdgeInsets.fromLTRB(57.0, 2.0, 2.0, 2.0),
                          child: TextField(
                              controller: _CXR,
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
                                //   valCXR = text;
                                TextEditingController.fromValue(
                                    TextEditingValue(
                                        text: _CXR.text,
                                        selection: new TextSelection.collapsed(
                                            offset: _CXR.text.length)));
                              }),
                        ))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' Other : ',
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
                          margin: EdgeInsets.fromLTRB(48.0, 2.0, 2.0, 2.0),
                          child: TextField(
                            controller: _OtherInvestigation,
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
                              // other = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _OtherInvestigation.text,
                                  selection: new TextSelection.collapsed(
                                      offset:
                                          _OtherInvestigation.text.length)));
                            },
                          ),
                        ))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    //margin: EdgeInsets.fromLTRB(20.0, 2.0, 2.0, 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' ECG : ',
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
                          margin: EdgeInsets.fromLTRB(55.0, 2.0, 10.0, 2.0),
                          child: TextField(
                              controller: _ECG,
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
                                // ECG = text;
                                TextEditingController.fromValue(
                                    TextEditingValue(
                                        text: _ECG.text,
                                        selection: new TextSelection.collapsed(
                                            offset: _ECG.text.length)));
                              }),
                        ))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Text(
                          ' 2D Echo : ',
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
                          margin: EdgeInsets.fromLTRB(32.0, 2.0, 2.0, 2.0),
                          child: TextField(
                            controller: _TwoDEcho,
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
                              //   echo2D = text;
                              TextEditingController.fromValue(TextEditingValue(
                                  text: _TwoDEcho.text,
                                  selection: new TextSelection.collapsed(
                                      offset: _TwoDEcho.text.length)));
                            },
                          ),
                        ))
                      ],
                    )),

                Container(
                    margin: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            //margin: EdgeInsets.all(2),
                            //padding: new EdgeInsets.all(2),
                            child: new Text(
                          " Additional investigations required : ",
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
                                /* decoration: BoxDecoration(
                                               border: Border.all(
                                               color: Colors.black, width: 1.0),)*/
                                margin:
                                    EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 6.0),
                                child: new DropdownButton<String>(
                                  value: additonalInfo,
                                  hint: Text(''),
                                  items: additionalInfoDecision
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String data) {
                                    setState(() {
                                      additonalInfo = data;
                                    });
                                  },
                                )))
                      ],
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                  child: TextField(
                    controller: _Additionalinvestigation,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 3.0),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0)),
                    ),
                    onChanged: (text) {
                      addInvReqNote = text;
                    },
                  ),
                ),
                Container(
                    width: 150.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 5.0),
                    //decoration: new BoxDecoration(color: Colors.green),
                    child: new RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      elevation: 5.00,
                      //  splashColor: Colors.green,
                      child: Text('Save'),
                      onPressed: () {
                        if(widget.data != null) {
                          PostSaveContents(widget.data.profileMasterId,context,widget.data);
                        }else{

                          final data1 = Data(
                              patient : _patientName1.text,
                              PRNNo : _prnNo.text,
                              OPDNo : _opdNo.text,
                              IPDNo : _ipdNo.text);

                          PostSaveContents("",context,data1);
                        }

                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PreAnaesthesia2('PreAnesthesia2')));*/
                      },
                    )),

                /*Container(
                    margin: EdgeInsets.fromLTRB(1.0,5.0,1.0,5.0),
                    padding: EdgeInsets.all(0),
                    height: 30.0,
                    //width: MediaQuery.of(context).size.width ,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 100.0,
                              child: CheckboxListTile(
                                dense: true,
                                value: _islooseChecked,
                                onChanged: (bool value) {
                                  setState(() {
                                    _islooseChecked = value;
                                    if (value) {
                                      _isLooseChckString = "Y";
                                    } else {
                                      _isLooseChckString = "N";
                                    }
                                    print("Selected$_islooseChecked");
                                  });
                                },
                                // checkColor: Colors.white,
                                activeColor: Colors.blue, title: Text('Loose'),

                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              )),
                          Container(
                              width: 100.0,
                              child: CheckboxListTile(
                                dense: true,
                                value: _iscrownedChecked,
                                onChanged: (bool value) {
                                  setState(() {
                                    _iscrownedChecked = value;
                                    if (value) {
                                      _isCrownChckString = "Y";
                                    } else {
                                      _isCrownChckString = "N";
                                    }
                                    print("Selected$_iscrownedChecked");
                                  });
                                },
                                // checkColor: Colors.white,
                                activeColor: Colors.blue,
                                title: Text('Crowned'),

                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              )),
                          Container(
                              width: 100.0,
                              child: CheckboxListTile(
                                dense: true,
                                value: _isdentureChecked,
                                onChanged: (bool value) {
                                  setState(() {
                                    _isdentureChecked = value;
                                    if (value) {
                                      _isdentureChckString = "Y";
                                    } else {
                                      _isdentureChckString = "N";
                                    }
                                    print("Selected$_isdentureChecked");
                                  });
                                },
                                // checkColor: Colors.white,
                                activeColor: Colors.blue,
                                title: Text('Tobacco'),

                                controlAffinity:
                                ListTileControlAffinity.leading,
                              ))
                        ]))*/
              ]))))),
            ])),
      )),
    );
  }

  void PostSaveContents(String profileMasterId, BuildContext context1, Data data) async {
    String additionalVal;
    if (additonalInfo == 'yes') {
      additionalVal = 'Y';
    } else {
      additionalVal = 'N';
    }

    var split_date = _date.toString().split(" ");
    String _dateVal = split_date[0];
    var body = jsonEncode({
      'ProfileMasterId': profileMasterId,
      'ReferringSurgeon': _ReferringSurgeon.text,
      'PreOperativeDiagnosis': _PreOperativeDiagnosis.text,
      'SurgeryPlanned': _SurgeryPlanned.text,
      'PhyassdonebyDr': _PhyassdonebyDr.text,
      'Phyassdate:': _dateVal,
      'Allergies': _allergies.text,
      // 'Height': height,
      // 'Weight': weight,
      'Smoking': chkSmoke,
      'Alcohol': chkAlcohol,
      'Tobacco': chkTobacco,
      'None': chkNone,
      'Otherifany': 'Y',
      'FamilyHistory': _Familyhistory.text,
      'OtherAny': chkOther,
      'OtherReason': 'test',

      'UrineRM': _UrineRM.text,
      'BloodGroup': _BloodGroup.text,
      'CXR': _CXR.text,
      'Other': _OtherInvestigation.text,
      'ECG': _ECG.text,
      'TwoDEcho': _TwoDEcho.text,
      'Additionalinvestigationrequired': additionalVal,
      'Additionalinvestigation': _Additionalinvestigation.text,
      'DMTreatment': 'DM',
      // 'DMSince': DMVal,
      'DMSince': _dateVal,
      'HTTreatment': 'HT',
      //'HTSince': HTVal,
      'HTSince': _dateVal,
      'IHDTreatment': 'IHD',
      //'IHDSince': IHDVal,
      'IHDSince': _dateVal,
      'AsthmaCOPDTreatment': 'Ashthama/COPD',
      // 'AsthmaCOPDSince': asthmaVal,
      'AsthmaCOPDSince': _dateVal,
      'OthersTreatment': 'Others',
      // 'OthersSince': otherVal,
      'OthersSince': _dateVal,
      'BPPhysicalfinding': 'N',
      'PulsePhysicalfinding': 'Y',
      'AirwayPhysicalfinding': 'N',
      'RSPhysicalfinding': 'Y',
      'CVSPhysicalfinding ': 'N',
   /*   'Addedtby': '1001',
      'Modifiedby': '1001',
      'Addedt': '2021-01-09',
      'ModifiedDt': '2021-01-09',
      'IsDeleted': 'N',*/
      'Surgery': [
        {'Surgical': _Surgery1.text, 'Date': _dateVal, 'Procedure': _SurgeryProcedure1.text},
        {'Surgical': _Surgery2.text, 'Date': _dateVal, 'Procedure':  _SurgeryProcedure2.text},
        {'Surgical': _Surgery3.text, 'Date': _dateVal, 'Procedure':  _SurgeryProcedure3.text}
      ],

      //'Investigation': [{'INV': '','Date': _dateVal,'Result': ''}]
    });

    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    String PostAnesthesiapart1 =
        'http://ot.ekatm.co.in/api/otAPI/PostAnesthesiapart1';
   // Session().get(GetSessions, body, PostAnesthesiapart1);
    String res ;
    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if(jsonDecode(response.body) == true) {
      response = await http.post(PostAnesthesiapart1, body: body, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      if(jsonDecode(response.body) != "false"){
        Fluttertoast.showToast(
            msg: "Data  save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
        Navigator.of(context1).pushReplacement(MaterialPageRoute(builder: (context1) =>
            PreAnaesthesia2(preAnesthesia1Id: jsonDecode(response.body),data: data),));
      //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>MainActivity('')));
      }else{
        Fluttertoast.showToast(
            msg: "Data not save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
      }
    }else{
      Fluttertoast.showToast(
          msg: "Unable to start session",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
          timeInSecForIosWeb: 1
      );
    }
  }

  Future<Map> getData(String url1, String data, String url2) async {
    var res;
    url2 = GetPreAnesthesiaData + "?PreAnsthesiaPart1id=" + data;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);

      //    List<String> attempts;
      //   attempts=(jsonDecode(response.body)['Anesthesiapart'])

      _ReferringSurgeon.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['ReferringSurgeon']
          .toString();
      _PreOperativeDiagnosis.text = jsonDecode(response.body)['Anesthesiapart']
              [0]['PreOperativeDiagnosis']
          .toString();
      _SurgeryPlanned.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['SurgeryPlanned']
          .toString();
      _PhyassdonebyDr.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['PhyassdonebyDr']
          .toString();
      _allergies.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['Allergies']
          .toString();
      _DMSince.text =
          jsonDecode(response.body)['Anesthesiapart'][0]['DMSince'].toString();
      _HTSince.text =
          jsonDecode(response.body)['Anesthesiapart'][0]['HTSince'].toString();
      _IHDSince.text =
          jsonDecode(response.body)['Anesthesiapart'][0]['IHDSince'].toString();
      _AsthmaCOPDSince.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['AsthmaCOPDSince']
          .toString();
      _OthersSince.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['OthersSince']
          .toString();
      _UrineRM.text =
          jsonDecode(response.body)['Anesthesiapart'][0]['UrineRM'].toString();
      _BloodGroup.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['BloodGroup']
          .toString();
      _CXR.text =
          jsonDecode(response.body)['Anesthesiapart'][0]['CXR'].toString();
      _OtherInvestigation.text = jsonDecode(response.body)['Anesthesiapart'][0]
              ['OtherInvestigation']
          .toString();

      if (jsonDecode(response.body)['Anesthesiapart'][0]['ECG'].toString() !=
          "null") {
        _ECG.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['ECG'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['TwoDEcho']
              .toString() !=
          "null") {
        _TwoDEcho.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['TwoDEcho']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]
                  ['Additionalinvestigation']
              .toString() !=
          "null") {
        _Additionalinvestigation.text =
            jsonDecode(response.body)['Anesthesiapart'][0]
                    ['Additionalinvestigation']
                .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['Familyhistory']
              .toString() !=
          "null") {
        _Familyhistory.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['Familyhistory']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['HBDate'].toString() !=
          "null") {
        _HBDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['HBDate'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['HBResult']
              .toString() !=
          "null") {
        _HBResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['HBResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['TLCDate']
              .toString() !=
          "null") {
        _TLCDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['TLCDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['TLCResult']
              .toString() !=
          "null") {
        _TLCResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['TLCResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['DLCDate']
              .toString() !=
          "null") {
        _DLCDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['DLCDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['DLCResult']
              .toString() !=
          "null") {
        _DLCResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['DLCResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['ESRDate']
              .toString() !=
          "null") {
        _ESRDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['ESRDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['ESRResult']
              .toString() !=
          "null") {
        _ESRResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['ESRResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PltDate']
              .toString() !=
          "null") {
        _PltDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['PltDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PltResult']
              .toString() !=
          "null") {
        _PltResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['PltResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['BTDate'].toString() !=
          "null") {
        _BTDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['BTDate'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['BTResult']
              .toString() !=
          "null") {
        _BTResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['BTResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['CTDate'].toString() !=
          "null") {
        _CTDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['CTDate'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['CTResult']
              .toString() !=
          "null") {
        _CTResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['CTResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PTDate'].toString() !=
          "null") {
        _PTDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['PTDate'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PTResult']
              .toString() !=
          "null") {
        _PTResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['PTResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PTTDate']
              .toString() !=
          "null") {
        _PTTDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['PTTDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['PTTResult']
              .toString() !=
          "null") {
        _PTTResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['PTTResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['SugarFDate']
              .toString() !=
          "null") {
        _SugarFDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['SugarFDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['SugarFResult']
              .toString() !=
          "null") {
        _SugarFResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['SugarFResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['SugarPPDate']
              .toString() !=
          "null") {
        _SugarPPDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['SugarPPDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['SugarPPResult']
              .toString() !=
          "null") {
        _SugarPPResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['SugarPPResult']
            .toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['UreaDate']
              .toString() !=
          "null") {
        _UreaDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['UreaDate']
            .toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['UreaResult']
              .toString() !=
          "null") {
        _UreaResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['UreaResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['CreatineDate']
              .toString() !=
          "null") {
        _CreatineDate.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['CreatineDate']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['CreatineResult']
              .toString() !=
          "null") {
        _CreatineResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['CreatineResult']
            .toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['NaDate'].toString() !=
          "null") {
        _NaDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['NaDate'].toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['NaResult']
              .toString() !=
          "null") {
        _NaResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['NaResult']
            .toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['KDate'].toString() !=
          "null") {
        _KDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['KDate'].toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['KResult']
              .toString() !=
          "null") {
        _KResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['KResult']
            .toString();
      }

      if (jsonDecode(response.body)['Anesthesiapart'][0]['ClDate'].toString() !=
          "null") {
        _ClDate.text =
            jsonDecode(response.body)['Anesthesiapart'][0]['ClDate'].toString();
      }
      if (jsonDecode(response.body)['Anesthesiapart'][0]['ClResult']
              .toString() !=
          "null") {
        _ClResult.text = jsonDecode(response.body)['Anesthesiapart'][0]
                ['ClResult']
            .toString();
      }

      if(jsonDecode(response.body)['Anesthesiapart'][0]['Additionalinvestigationrequired'] == "N"){
        additonalInfo = 'No';
      }else {
        additonalInfo = 'Yes';
      }
      if (jsonDecode(response.body)['SurgicalHistory'][0]['SurgeryDate'] !=
          "null") {
        var date = jsonDecode(response.body)['SurgicalHistory'][0]
                ['SurgeryDate']
            .toString()
            .split("T");
        _SurgeryDate1.text = date[0];
      }
      if (jsonDecode(response.body)['SurgicalHistory'][0]['SurgeryProcedure'] !=
          "null") {
        _SurgeryProcedure1.text = jsonDecode(response.body)['SurgicalHistory']
                [0]['SurgeryProcedure']
            .toString();
      }

      if (jsonDecode(response.body)['SurgicalHistory'][0]['Surgery'] !=
          "null") {
        _Surgery1.text = jsonDecode(response.body)['SurgicalHistory'][0]
                ['Surgery']
            .toString();
      }

      if (jsonDecode(response.body)['SurgicalHistory'][1]['SurgeryDate'] !=
          "null") {
        var date = jsonDecode(response.body)['SurgicalHistory'][1]
                ['SurgeryDate']
            .toString()
            .split("T");
        _SurgeryDate2.text = date[0];
      }
      if (jsonDecode(response.body)['SurgicalHistory'][1]['SurgeryProcedure'] !=
          "null") {
        _SurgeryProcedure2.text = jsonDecode(response.body)['SurgicalHistory']
                [1]['SurgeryProcedure']
            .toString();
      }

      if (jsonDecode(response.body)['SurgicalHistory'][1]['Surgery'] !=
          "null") {
        _Surgery2.text = jsonDecode(response.body)['SurgicalHistory'][1]
                ['Surgery']
            .toString();
      }

      if (jsonDecode(response.body)['SurgicalHistory'][2]['SurgeryDate'] !=
          "null") {
        var date = jsonDecode(response.body)['SurgicalHistory'][2]
                ['SurgeryDate']
            .toString()
            .split("T");
        _SurgeryDate3.text = date[0];
      }
      if (jsonDecode(response.body)['SurgicalHistory'][2]['SurgeryProcedure'] !=
          "null") {
        _SurgeryProcedure3.text = jsonDecode(response.body)['SurgicalHistory']
                [2]['SurgeryProcedure']
            .toString();
      }

      if (jsonDecode(response.body)['SurgicalHistory'][2]['Surgery'] !=
          "null") {
        _Surgery3.text = jsonDecode(response.body)['SurgicalHistory'][2]
                ['Surgery']
            .toString();
      }




      /* if (additonalInfo == 'yes') {
      additionalVal = 'Y';
    } else {
      additionalVal = 'N';
    }*/


      //  _ClResult.text = jsonDecode(response.body)['SurgicalHistory'][0]['ClResult'].toString();
      //  _ClResult.text = jsonDecode(response.body)['Anesthesiapart'][0]['ClResult'].toString();

      /*   "SurgicalHistory": [{
    "SurgeryDate": "2021-01-21T00:00:00",
    "SurgeryProcedure": "eth",
    "Surgery": "g"
    },*/
    }

    return jsonDecode(response.body);
  }

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  void updateCookie(Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
