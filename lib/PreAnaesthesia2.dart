import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'MainActivity.dart';

import 'Session.dart';
import 'ViewPatientDetails.dart';
class PreAnaesthesia2 extends StatefulWidget {
  //final String text;
  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  String profileMasterId;
  var patientName,opdNo,ipdNo,prnNo,preAnesthesia1Id;
  final Data data;

  PreAnaesthesia2(
      {this.data, this.profileMasterId, this.patientName, this.prnNo, this.opdNo,this.ipdNo,this.preAnesthesia1Id});

 // PreAnaesthesia2(this.text);

  @override
  _PreAnaesthesia2 createState() => _PreAnaesthesia2();
}

class _PreAnaesthesia2 extends State<PreAnaesthesia2> {
  int _counter = 0;
  bool _isPlanChecked1 = false;
  String _isPlanchck = "N",
      _isfitChck = "N",
      _isPostponeChck = "N";
  bool _isfitChecked = false;
  bool _isPostponeChecked2 = false;
  String encircleSurgery = 'Yes';
  String encSurgeryString = "Y";
  String encircleASA = 'Yes';
  String encASAString = "Y";
  var mentoDistance, jawTMDistance, neckMovement, neckGirth, riskFactor1,
      riskFactor2, drugsInduction, drugMaintain, fromNBM, valFBS,
      preAnesMedi1, preAnesMedi2, preAnesMedi3, preAnesMedi4, preAnesMedi5,
      preAnesMedi6, preAnesMedi7, preAnesMedi8, preAnesMedi9,
      specialInstruction, specialMonitor, anticipatedPostAnes, anesName, pulse,
      valRR, valBP, valECG, maintainDrug, valOthers, anesName1;

  final TextEditingController _patientName1 = new TextEditingController();
  final TextEditingController _prnNo = new TextEditingController();
  final TextEditingController _opdNo = new TextEditingController();
  final TextEditingController _ipdNo = new TextEditingController();

  List <String> surgeryDecision = [
    'Yes',
    'No'
  ];

  String okForSurgery1 = 'Yes';
  List<String> surgeryDecision1 = [
    'Yes', 'No'];

  String anestheticSurgeryString = 'Yes',
      anesSurgery = "Y";
  List<String> anestheticsurgeryList = [
    'Yes', 'No'];

  String anestheticRiskString = 'Yes',
      anesRisk = "Y",
      anesRiskDis = "Y";
  List<String> anestheticRiskList = [
    'Yes', 'No'];

  String anestheticTechString = 'Yes',
      anesTech = "Y";
  List<String> anestheticTechList = [
    'Yes', 'No'];

  String regionalLocalString = 'Yes',
      regLocal = "Y";
  List<String> regionalLocalList = [
    'Yes', 'No'];

  bool _islooseChecked = false;
  String _isLooseChckString = "N",
      _isCrownChckString = "N",
      _isdentureChckString = "N",
      _isfalseChckString = "N",
      _ismisChckString = "N",
      _isChckBoxChckString = "N";
  bool _iscrownedChecked = false;
  bool _isdentureChecked = false;
  bool _isflaseChecked = false;
  bool _ismissingChecked = false;
  bool _ischeckboxChecked = false;

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

  DateTime now;
  DateTime _date = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');

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

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('PreAnesthesia2'),
      ),
      body: Center(
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
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Image.asset('assests/userph.png',
                        width: 80.0,
                        height: 80.0,
                        alignment: Alignment.center,
                        fit: BoxFit.cover)),
                Flexible(
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .black)))))),
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
                                                          color: Colors
                                                              .black)))))),
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
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .black)))))),
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
                                                  controller:_ipdNo,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .black)))))),
                                ],
                              )),
                        ],
                      ),
                    ))
              ],),
              Container(
                  child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                      child: Container(
                        height: 1.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        color: Colors.black,
                      ))),
              Container(
                  child: Flexible(child: SingleChildScrollView(
                      child: Flexible(child: Column(children: <Widget>[
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
                            child: Text(
                                'Pre-Anesthesia Check up & Pre-Induction Check up',
                                style: TextStyle(
                                  fontSize: 15.00,
                                  color: Colors.black,
                                ))
                        ),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  //margin: EdgeInsets.all(2),
                                  //padding: new EdgeInsets.all(2),
                                  child: Text(' Surgery (Encircle) : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: encircleSurgery,
                                      hint: Text(''),
                                      items: surgeryDecision.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String data) {
                                        setState(() {
                                          encircleSurgery = data;
                                          if (data == true) {
                                            encSurgeryString = "Y";
                                          } else {
                                            encSurgeryString = "N";
                                          }
                                          // print("Selected: ${okForSurgery}");
                                        });
                                      },
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
                                  child: Text(' ASA Grade (Enircle)  ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: encircleASA,
                                      hint: Text(''),
                                      items: surgeryDecision1.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String data) {
                                        setState(() {
                                          encircleASA = data;
                                          if (data == true) {
                                            encASAString = "Y";
                                          } else {
                                            encASAString = "N";
                                          }
                                          //print("Selected: ${okForSurgery1}");
                                        });
                                      },
                                    ))

                              ],
                            )),
                        Container(
                            alignment: AlignmentDirectional.centerStart,
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
                            child: Text('Airways - Teeth :',
                                style: TextStyle(
                                  fontSize: 15.00,
                                  color: Colors.black,
                                ))
                        ),
                        //CheckBox
                        Container(
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            height: 30.0,
                            //width: MediaQuery.of(context).size.width ,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: 150.0,
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
                                        activeColor: Colors.blue,
                                        title: Text('Loose'),

                                        controlAffinity: ListTileControlAffinity
                                            .leading,)),
                                  Container(
                                      width: 150.0,
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

                                        controlAffinity: ListTileControlAffinity
                                            .leading,))
                                ])),
                        Container(
                            height: 30.0,
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            // width: MediaQuery.of(context).size.width ,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: 150.0,
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
                                        title: Text('Denture'),

                                        controlAffinity: ListTileControlAffinity
                                            .leading,)),
                                  Container(
                                      width: 150.0,
                                      child: CheckboxListTile(
                                        dense: true,
                                        value: _isflaseChecked,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _isflaseChecked = value;
                                            if (value) {
                                              _isfalseChckString = "Y";
                                            } else {
                                              _isfalseChckString = "N";
                                            }
                                            print("Selected$_isflaseChecked");
                                          });
                                        },
                                        // checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        title: Text('False'),

                                        controlAffinity: ListTileControlAffinity
                                            .leading,))
                                ])),
                        Container(
                          // height : 50.0,
                            height: 30.0,
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                            padding: EdgeInsets.all(0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      width: 150.0,
                                      child: CheckboxListTile(

                                        dense: true,
                                        value: _ismissingChecked,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _ismissingChecked = value;
                                            if (value) {
                                              _ismisChckString = "Y";
                                            } else {
                                              _ismisChckString = "N";
                                            }
                                            print("Selected$_ismissingChecked");
                                          });
                                        },
                                        // checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        title: Text('Missing'),

                                        controlAffinity: ListTileControlAffinity
                                            .leading,)),
                                  Container(
                                      width: 150.0,
                                      child: CheckboxListTile(
                                        dense: true,
                                        value: _ischeckboxChecked,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _ischeckboxChecked = value;
                                            if (value) {
                                              _isChckBoxChckString = "Y";
                                            } else {
                                              _isChckBoxChckString = "N";
                                            }
                                            print(
                                                "Selected$_ischeckboxChecked");
                                          });
                                        },
                                        // checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        title: Text('CheckBox'),

                                        controlAffinity: ListTileControlAffinity
                                            .leading,))
                                ])),
                        /******************************************/
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Mento-hyoid distance : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      mentoDistance = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Jaw-TM distance : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      jawTMDistance = text;
                                    },),
                                ),),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Neck Movements : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      neckMovement = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Neck Girth : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      75.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      neckGirth = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            child: Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 1.0),
                                child: Container(
                                  height: 1.0,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Colors.black,
                                ))),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  //margin: EdgeInsets.all(2),
                                  //padding: new EdgeInsets.all(2),
                                  child: Text(' Anesthetic Risk (Enircle) ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: anestheticSurgeryString,
                                      hint: Text(''),
                                      items: anestheticsurgeryList.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String data) {
                                        setState(() {
                                          anestheticSurgeryString = data;
                                          if (data == true) {
                                            anesSurgery = "Y";
                                          } else {
                                            anesSurgery = "N";
                                          }
                                          //  print("Selected: ${anestheticSurgeryString}");
                                        });
                                      },
                                    ))
                              ],
                            )),
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
                                        " Risk Factors : ",
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
                                        maxLines: 3, textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          riskFactor1 = text;
                                        },))

                                ])),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  //margin: EdgeInsets.all(2),
                                  //padding: new EdgeInsets.all(2),
                                  child: Text(' Anesthetic Risk Discussed ? ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: anestheticRiskString,
                                      hint: Text(''),
                                      items: anestheticRiskList.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String data) {
                                        setState(() {
                                          anestheticRiskString = data;
                                          if (data == true) {
                                            anesRiskDis = "Y";
                                          } else {
                                            anesRiskDis = "N";
                                          }
                                          print(
                                              "Selected: ${anestheticRiskString}");
                                        });
                                      },
                                    ))

                              ],
                            )),
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
                                        " Risk Factors : ",
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
                                        maxLines: 3, textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          riskFactor2 = text;
                                        },))

                                ])),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Drugs for Induction : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      drugsInduction = text;
                                    },),
                                )),

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
                                  child: Text(' Anesthetic Technique ? ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: anestheticTechString,
                                      hint: Text(''),
                                      items: anestheticTechList.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String value) {
                                        setState(() {
                                          anestheticTechString = value;
                                          if (value == true) {
                                            anesTech = "Y";
                                          } else {
                                            anesTech = "N";
                                          }
                                          print(
                                              "Selected: ${anestheticTechString}");
                                        });
                                      },
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
                                  child: Text(
                                      ' If Regional/Local (Encircle) : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 15,
                                          letterSpacing: 0.2,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.normal)),),
                                Container(
                                    child: new DropdownButton<String>(
                                      value: regionalLocalString,
                                      hint: Text(''),
                                      items: regionalLocalList.map<
                                          DropdownMenuItem<String>>((
                                          String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),

                                      onChanged: (String data) {
                                        setState(() {
                                          regionalLocalString = data;
                                          if (data == true) {
                                            regLocal = "Y";
                                          } else {
                                            regLocal = "N";
                                          }
                                          print(
                                              "Selected: ${regionalLocalString}");
                                        });
                                      },
                                    ))

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Drugs for Maintainance : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      drugMaintain = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            child: Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 1.0),
                                child: Container(
                                  height: 1.0,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Colors.black,
                                ))),
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
                            child: Text(
                                'Pre-Operative Preparation/Instructions :',
                                style: TextStyle(
                                  fontSize: 15.00,
                                  color: Colors.black,
                                ))
                        ),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' NBM from : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      fromNBM = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' FBS : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      45.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      valFBS = text;
                                    },),
                                )),

                              ],
                            )),
                        //Table
                        Container(
                          //width: MediaQuery.of(context).size.width - 50.0,
                            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
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

                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Row(
                                          children: <Widget>[
                                            DataTable(
                                              columns: <DataColumn>[
                                                DataColumn(
                                                    label: Text(
                                                      'Sr No',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                          fontFamily: 'Roboto'

                                                      ),
                                                    )),
                                                DataColumn(
                                                    label: Text(
                                                      'Pre Anesthetic Medications',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold,
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    )
                                                )
                                              ],
                                              rows: <DataRow>[
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '1',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                      decoration: new InputDecoration(
                                                        hintText: '-',
                                                        border: InputBorder
                                                            .none,
                                                        focusedBorder: InputBorder
                                                            .none,),
                                                      onChanged: (text) {
                                                        preAnesMedi1 = text;
                                                      },),
                                                  )
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '2',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                      TextField(
                                                          decoration: new InputDecoration(
                                                            hintText: '-',
                                                            border: InputBorder
                                                                .none,
                                                            focusedBorder: InputBorder
                                                                .none,),
                                                          onChanged: (text) {
                                                            preAnesMedi2 = text;
                                                          })),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '3',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                      decoration: new InputDecoration(
                                                        hintText: '-',
                                                        border: InputBorder
                                                            .none,
                                                        focusedBorder: InputBorder
                                                            .none,),
                                                      onChanged: (text) {
                                                        preAnesMedi3 = text;
                                                      },
                                                    ),
                                                  )
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '4',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi4 = text;
                                                        }),
                                                  ),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '5',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi5 = text;
                                                        }),
                                                  ),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '6',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi6 = text;
                                                        }),
                                                  ),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '7',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi7 = text;
                                                        }),
                                                  ),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '8',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi8 = text;
                                                        }),
                                                  ),
                                                ]),
                                                DataRow(cells: <DataCell>[
                                                  DataCell(
                                                    Text(
                                                      '9',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontFamily: 'Roboto'
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextField(
                                                        decoration: new InputDecoration(
                                                          hintText: '-',
                                                          border: InputBorder
                                                              .none,
                                                          focusedBorder: InputBorder
                                                              .none,),
                                                        onChanged: (text) {
                                                          preAnesMedi9 = text;
                                                        }),
                                                  ),
                                                ])
                                              ],
                                            )

                                          ]
                                      )
                                  )
                                ]
                            )
                        ),
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
                                        " Special Instructions : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          specialInstruction = text;
                                        },))

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
                                        " Special monitoring requirements , if any : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          specialMonitor = text;
                                        },))

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
                                        " Anticipated post-anesthesia care : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          anticipatedPostAnes = text;
                                        },))

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
                                        " Name of the Anesthesiologist : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(
                                        textAlign: TextAlign.start,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: new EdgeInsets
                                                .symmetric(
                                                vertical: 7.0, horizontal: 3.0),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0))),
                                        onChanged: (text) {
                                          anesName = text;
                                        },))

                                ])),
                        Container(
                            child: Padding(
                                padding:
                                EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 1.0),
                                child: Container(
                                  height: 1.0,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  color: Colors.black,
                                ))),
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
                            child: Text('Pre-Induction Assessment :',
                                style: TextStyle(
                                  fontSize: 15.00,
                                  color: Colors.black,
                                ))
                        ),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Pulse : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      isDense: true,
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
                                    ),
                                    onChanged: (text) {
                                      pulse = text;
                                    },),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' RR : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      20.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        /*prefixIcon: const Icon(
  Icons.search,
  color: Colors.black,
  textDirection: TextDirection.ltr,
),*/
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 3.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0)),
                                      )),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' BP : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      20.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        /*prefixIcon: const Icon(
  Icons.search,
  color: Colors.black,
  textDirection: TextDirection.ltr,
),*/
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 3.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0)),
                                      )),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                Flexible(child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      12.0, 2.0, 2.0, 2.0),
                                  child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        isDense: true,

                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 3.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0)),
                                      )),
                                )),

                              ],
                            )),
                        Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                      ' Drugs for Maintainance : ',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.2,
                                        fontSize: 15,
                                      ),
                                    )),
                                Flexible(child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: TextField(
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        /*prefixIcon: const Icon(
  Icons.search,
  color: Colors.black,
  textDirection: TextDirection.ltr,
),*/
                                        contentPadding: new EdgeInsets
                                            .symmetric(
                                            vertical: 7.0, horizontal: 3.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0)),
                                      )),
                                )),

                              ],
                            )),
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
                                        " Other : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(maxLines: 3,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: new EdgeInsets
                                                  .symmetric(vertical: 7.0,
                                                  horizontal: 3.0),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0)))))

                                ])),
                        Container(
                            height: 30.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: CheckboxListTile(value: _isfitChecked,
                              onChanged: (bool value) {
                                setState(() {
                                  _isfitChecked = value;
                                  if (value) {
                                    _isfitChck = "Y";
                                  } else {
                                    _isfitChck = "N";
                                  }
                                  print("Selected$_isfitChecked");
                                });
                              },
                              // checkColor: Colors.white,
                              activeColor: Colors.blue,
                              title: Text(
                                  'Fit to get anesthetized as per plan'),
                              controlAffinity: ListTileControlAffinity
                                  .leading,)),
                        Container(
                            height: 30.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: CheckboxListTile(value: _isPlanChecked1,
                              onChanged: (bool value) {
                                setState(() {
                                  _isPlanChecked1 = value;
                                  if (value) {
                                    _isPlanchck = "Y";
                                  } else {
                                    _isPlanchck = "N";
                                  }
                                  print("Selected$_isPlanChecked1");
                                });
                              },
                              // checkColor: Colors.white,
                              activeColor: Colors.blue,
                              title: Text('Change of plan required'),
                              controlAffinity: ListTileControlAffinity
                                  .leading,)),
                        Container(
                            height: 30.0,
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: CheckboxListTile(
                              value: _isPostponeChecked2,
                              onChanged: (bool value) {
                                setState(() {
                                  _isPostponeChecked2 = value;
                                  if (value) {
                                    _isPostponeChck = "Y";
                                  } else {
                                    _isPostponeChck = "N";
                                  }
                                  print("Selected$_isPostponeChecked2");
                                });
                              },
                              // checkColor: Colors.white,
                              activeColor: Colors.blue,
                              title: Text('Not Fit Postpone the procedure'),
                              controlAffinity: ListTileControlAffinity
                                  .leading,)),
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
                                        " Name of the Anesthesiologist : ",
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
                                          7.0, 2.0, 10.0, 2.0),
                                      child: TextField(
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: new EdgeInsets
                                                  .symmetric(vertical: 7.0,
                                                  horizontal: 3.0),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0)))))

                                ])),

                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(children: <Widget>[
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
                                    if(widget.data != null) {
                                      PostSaveContents(widget.preAnesthesia1Id);
                                    }else{
                                      PostSaveContents("");
                                    }
                                  },
                                )),
                            Container(
                                width: 150.0,
                                height: 40.0,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(2.0),
                                // decoration: new BoxDecoration(color: Colors.red),
                                child: new RaisedButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  elevation: 5.00,
                                  splashColor: Colors.blue,
                                  child: Text('Back'),
                                  onPressed: () {},
                                ))
                          ],),)


                      ]))))
              ),

            ]))


        /*Checkbox(

          value:_isChecked,
          onChanged: (bool value){
            setState(() {
              _isChecked = value;
            });
          },
        )*/,

      ),
    );
  }

  PostSaveContents(preAnesthesia1Id) async {
    var id = preAnesthesia1Id;

    var split_date = _date.toString().split(" ");
    String _dateVal = split_date[0];

    var body = jsonEncode({
      'preanesthesiapart1id':preAnesthesia1Id,
      //'PreAnesPart1id': preAnesthesia1Id,
      'SurEncir': encSurgeryString,
      'ASAGraEncir': encASAString,
      'Loose': _isLooseChckString,
      'Crowned': _isCrownChckString,
      'Denture': _isdentureChckString,
      'False': _isfalseChckString,
      'Missing': _ismisChckString,
      'ModiMallGra': mentoDistance,
      'Menthyodist': mentoDistance,
      'JawTMdist': jawTMDistance,
      'NeckMov': neckMovement,
      'NeckGir': neckGirth,
      'AnesthRiskEnc': anesRisk,
      'RiskFactors': riskFactor1,
      'AnesthRiskDisc': anesRiskDis,
      'RiskFactorsDisc': riskFactor2,
      'AnesthTechni': anesTech,
      'IfRegLocEncir': regLocal,
      'DrugsforInduc': drugsInduction,
      'DrugsforMaint': drugMaintain,
      'NBMfrom': fromNBM,
      'FBS': valFBS,
      'PreAnesthMedica1': preAnesMedi1,
      'PreAnesthMedica2': preAnesMedi2,
      'PreAnesthMedica3': preAnesMedi3,
      'PreAnesthMedica4': preAnesMedi4,
      'PreAnesthMedica5': preAnesMedi5,
      'SpecInstruc': specialInstruction,
      'Specmonitrequ': specialMonitor,
      'Anticpostanescare': anticipatedPostAnes,
      'NameoftheAnesthePreOpe': anesName,
      'DatedPreOpe': '2021/01/08',
      'TimePreOpe': '06:45 PM',
      'Pulse': pulse,
      'RR': valRR,
      'BP': valBP,
      'ECG': valECG,
      'Other': valOthers,
      'Fittogetanesth': _isfitChck,
      'Changofplanreq': _isPlanchck,
      'NotfitPosttheproce': _isPostponeChck,
      'NameoftheAnesthePreInd': anesName1,
      'DatedPreInd': '2021/01/08',
      'TimePreInd': '06:45 PM'
    });

    String PostAnesthesiapart2 = 'http://ot.ekatm.co.in/api/otAPI/PostAnesthesiapart2';
    //Session().get(GetSessions, body, PostAnesthesiapart2);
    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';

    // Session().get(GetSessions, body, PostAnesthesiapart1);
    String res;
    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response =
      await http.post(PostAnesthesiapart2, body: body, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      if(jsonDecode(response.body) == "true"){
        Fluttertoast.showToast(
            msg: "Data save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>MainActivity('')));
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


