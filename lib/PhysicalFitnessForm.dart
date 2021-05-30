import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ot_project/MainActivity.dart';
import 'package:ot_project/Profile.dart';

import 'Session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ViewPatientDetails.dart';

class PhysicalFitnessForm extends StatefulWidget {
  final String profileMasterId;
  final Data data,physicalfitnessformId;
  var patientName,opdNo,ipdNo,prnNo;
  PhysicalFitnessForm({this.data, this.profileMasterId,this.patientName, this.prnNo, this.opdNo,this.ipdNo,this.physicalfitnessformId});

  @override
  _PhysicalFitnessForm createState() => _PhysicalFitnessForm();
}

class _PhysicalFitnessForm extends State<PhysicalFitnessForm> {
  String GetSessions =
      'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
  var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataPhysicalFitness";
 /* String chestPain,palpitation,breathelessness,fever,cough,soreThroat,allergy,HTN,DM,ischemicDisease,cerebrovascularaccident,
      treatment,antiHyoertensive,insulin,anitplatelates,
      transfusionPCV,pulse,BP,RR,JVP,pallor,cynosisClubbing,CVS,RS,CNS,CV,ECG,chestXRay,bloodTest,impPhy,okSurgery,date;*/
  final TextEditingController _ImplantRequired = new TextEditingController();
  TextEditingController _patientName1 = new TextEditingController();
   TextEditingController _prnNo = new TextEditingController();
   TextEditingController _opdNo = new TextEditingController();
   TextEditingController _ipdNo = new TextEditingController();
  String okForSurgery = 'Yes';
  String dropdownValOksurgery = '' ;
  void getDropDownItemforSurgery(){

    setState(() {
      dropdownValOksurgery = okForSurgery ;
    });
  }

  List <String> surgeryDecision = [
   'Yes',
    'No'
  ] ;

  DateTime now;

  //DateTime _date = DateTime.now();
  DateTime _date = DateTime.now();
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  //String formatted = formatter.format(_date);
  //String dart1 = formatter.format(now);

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
  final TextEditingController physicalFitnessid = new TextEditingController();
  final TextEditingController profilemasterid = new TextEditingController();
  final TextEditingController chestPain = new TextEditingController();
  final TextEditingController palpitation = new TextEditingController();
  final TextEditingController breathelessness = new TextEditingController();
  final TextEditingController fever = new TextEditingController();
  final TextEditingController cough = new TextEditingController();
  final TextEditingController soreThroat = new TextEditingController();
  final TextEditingController allergy = new TextEditingController();
  final TextEditingController HTN = new TextEditingController();
  final TextEditingController DM = new TextEditingController();
  final TextEditingController ischemicDisease = new TextEditingController();
  final TextEditingController cerebrovascularaccident = new TextEditingController();
  final TextEditingController treatment = new TextEditingController();
  final TextEditingController antiHyoertensive = new TextEditingController();
  final TextEditingController insulin = new TextEditingController();
  final TextEditingController anitplatelates = new TextEditingController();
  final TextEditingController transfusionPCV = new TextEditingController();
  final TextEditingController pulse = new TextEditingController();
  final TextEditingController BP = new TextEditingController();
  final TextEditingController RR = new TextEditingController();
  final TextEditingController pallor = new TextEditingController();
  final TextEditingController cynosisClubbing = new TextEditingController();
  final TextEditingController CVS = new TextEditingController();
  final TextEditingController RS = new TextEditingController();
  final TextEditingController CNS = new TextEditingController();
  final TextEditingController CV = new TextEditingController();
  final TextEditingController ECG = new TextEditingController();
  final TextEditingController chestXRay = new TextEditingController();
  final TextEditingController bloodTest = new TextEditingController();
  final TextEditingController impPhy = new TextEditingController();
//  final TextEditingController okSurgery = new TextEditingController();
  final TextEditingController date = new TextEditingController();
  final TextEditingController JVP = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null) {
      get(GetSessions, widget.data.otRegistrationId, uri);
    }
  }
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  Future<Map> get(String url1, dynamic data, String url2) async {
    var res;
    url2 = uri + "?PhysicalFitnessid=" + data;

    http.Response response = await http.get(url1, headers: headers);
    updateCookie(response);
    if (jsonDecode(response.body) == true) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);

      physicalFitnessid.text = jsonDecode(response.body)[0]['PhysicalFitnessid'].toString();
      chestPain.text = jsonDecode(response.body)[0]['Chestpain'].toString();
      palpitation.text = jsonDecode(response.body)[0]['Palapitation'].toString();
      breathelessness.text = jsonDecode(response.body)[0]['Brethlesness'].toString();
      fever.text = jsonDecode(response.body)[0]['Fever'].toString();
      soreThroat.text = jsonDecode(response.body)[0]['SoreThroat'].toString();
      allergy.text = jsonDecode(response.body)[0]['Allergy'].toString();
      HTN.text = jsonDecode(response.body)[0]['HTN'].toString();
      DM.text = jsonDecode(response.body)[0]['DM'].toString();
      ischemicDisease.text = jsonDecode(response.body)[0]['IschemicHeartDisease'].toString();
      cerebrovascularaccident.text = jsonDecode(response.body)[0]['CerebrovascularAccident'].toString();
      treatment.text = jsonDecode(response.body)[0]['Treatment'].toString();
      antiHyoertensive.text = jsonDecode(response.body)[0]['AntiHyoertensive'].toString();
      anitplatelates.text = jsonDecode(response.body)[0]['Antiplatelates'].toString();
      transfusionPCV.text = jsonDecode(response.body)[0]['TranfusionPCVBlood'].toString();
      pulse.text = jsonDecode(response.body)[0]['Pulse'].toString();
      BP.text = jsonDecode(response.body)[0]['BP'].toString();
      RR.text = jsonDecode(response.body)[0]['RR'].toString();
      JVP.text = jsonDecode(response.body)[0]['JVP'].toString();
      pallor.text = jsonDecode(response.body)[0]['Pallor'].toString();
      cynosisClubbing.text = jsonDecode(response.body)[0]['CynosisClubbing'].toString();
      CVS.text = jsonDecode(response.body)[0]['CVS'].toString();
      RS.text = jsonDecode(response.body)[0]['RS'].toString();
      CNS.text = jsonDecode(response.body)[0]['CNS'].toString();
      CV.text = jsonDecode(response.body)[0]['CV'].toString();
      ECG.text = jsonDecode(response.body)[0]['ECG'].toString();
      chestXRay.text = jsonDecode(response.body)[0]['ChestXRAY'].toString();
      bloodTest.text = jsonDecode(response.body)[0]['BloodTest'].toString();
      impPhy.text = jsonDecode(response.body)[0]['ImpressionbyPhysician'].toString();
      okForSurgery = jsonDecode(response.body)[0]['OKforSurgery'].toString();
      if(okForSurgery == "N"){
        okForSurgery="No";
      }else {
        okForSurgery="Yes";
      }
      profilemasterid.text = jsonDecode(response.body)[0]['Profilemasterid'].toString();


      /*[{
	"PhysicalFitnessid": "9ea9e351-527d-4444-9eac-b19ccfb595ac",
	"Chestpain": "fury",
	"Palapitation": "hds",
	"Brethlesness": "xhdhd",
	"Fever": "xhfhdu",
	"SoreThroat": "xgdh",
	"Allergy": "gshdu",
	"HTN": "xgdhd",
	"DM": "xddj",
	"IschemicHeartDisease": "tstsydy",
	"CerebrovascularAccident": "ydy",
	"Treatment": "fgh",
	"AntiHyoertensive": "djdh",
	"Antiplatelates": "gxxh",
	"TranfusionPCVBlood": "afzgs",
	"Pulse": "dhhdzzg",
	"BP": "hdyd",
	"RR": "sgzgy",
	"JVP": "xgdh",
	"Pallor": "syyd7",
	"CynosisClubbing": "fsts",
	"CVS": "agxh",
	"RS": "dgxhdh",
	"CNS": "sfzhdh",
	"CV": "xgxnc",
	"ECG": "sfxhxh",
	"ChestXRAY": "",
	"BloodTest": "zgxhd",
	"ImpressionbyPhysician": "wgxhfj",
	"OKforSurgery": "N",
	"Dated": "2021-01-18T00:00:00",
	"Addedtby": "1001",
	"Addedt": "2021-01-18T15:15:24.413",
	"isdeleted": "N",
	"Modifiedby": "1001",
	"Modifieddt": "2021-01-18T15:15:24.413",
	"Profilemasterid": "630bd975-5861-4e24-85cb-947720604f74"
}]*/


      /*  "OKforSurgery": "N",
        "Dated": "2021-01-18T00:00:00",
        "Addedtby": "1001",
        "Addedt": "2021-01-18T15:15:24.413",
        "isdeleted": "N",
        "Modifiedby": "1001",
        "Modifieddt": "2021-01-18T15:15:24.413",
        "Profilemasterid": "630bd975-5861-4e24-85cb-947720604f74"
      }]*/

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
  Widget build(BuildContext context) {
    _patientName1.text = widget.patientName;
    _prnNo.text = widget.prnNo;
    _ipdNo.text = widget.ipdNo;
    _opdNo.text = widget.opdNo;

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
      appBar: AppBar(title: Text('Physician Fitness Form')),
      body: Container(
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
                                    margin: EdgeInsets.fromLTRB(40.0, 2.0, 1.0, 1.0),
                                    child: TextFormField(
                                        controller: _prnNo,
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
                                                    color: Colors.black)))))),
                            Container(
                                margin: EdgeInsets.fromLTRB(3.0, 2.0, 2.0, 2.0),
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
                                        controller: _ipdNo,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black)))))),
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
                child: Flexible(child:SingleChildScrollView(
                child: Column(children: <Widget>[
                    Container(
                    alignment: AlignmentDirectional.center,
                    color: Color(0xFFE1F5FE),
                    margin: new EdgeInsets.all(1.0),
                    child: Text('Physician Fitness Form',
                          style: TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                      ),)),
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
                      alignment: AlignmentDirectional.centerStart,
                      margin: new EdgeInsets.fromLTRB(5.0, 2.0, 1.0, 1.0),
                      child: Text('1.Symptoms',
                          style: TextStyle(
                            fontSize: 18.00,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(2),
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  child: Text(
                                    ' Chest Pain : ',
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
                                  controller: chestPain,
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
                                onChanged: (text){
                                   //   chestPain.text = text;
                                      TextEditingController.fromValue(
                                          TextEditingValue(
                                              text: chestPain.text,
                                              selection: new TextSelection
                                                  .collapsed(
                                                  offset: chestPain
                                                      .text.length)));
                                }),
                              )),

                  ],
                )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Palpatation  : ',
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
                              controller: palpitation,
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
                                onChanged: (text){
                                 // palpitation.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: palpitation.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: palpitation
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Breathelessness  : ',
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
                              controller: breathelessness,
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
                                onChanged: (text){
                                //  breathelessness.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: breathelessness.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: breathelessness
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Fever  : ',
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
                              controller: fever,
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
                                onChanged: (text){
                                //  fever.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: fever.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: fever
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Cough  : ',
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
                            child: TextFormField(
                              controller: cough,
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

                                   // cough.text = text;
                                    TextEditingController.fromValue(
                                        TextEditingValue(
                                            text: cough.text,
                                            selection: new TextSelection
                                                .collapsed(
                                                offset: cough
                                                    .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Sore Throat  : ',
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
                        height: 25.0,
                        margin: EdgeInsets.all(2),
                        child: TextFormField(
                          textAlignVertical:
                          TextAlignVertical.center,
                          //showCursor: true,
                         // initialValue: soreThroat.text,
                         /* controller: TextEditingController.fromValue(TextEditingValue(
                            text: soreThroat.text,selection: TextSelection.collapsed(offset: soreThroat.text.length)
                          )),*/
controller: soreThroat,
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
                           // soreThroat.text = text;
                           // TextPosition position = soreThroat.text.length as TextPosition;
                            TextEditingController.fromValue(
                               new  TextEditingValue(
                                    text: soreThroat.text,
                                    selection: new TextSelection
                                        .collapsed(
                                        offset: soreThroat.text.length)));
                          },
                        ),
                      )),
                        /*  Flexible(child: Container(
                            margin: EdgeInsets.all(2),
                            child: TextFormField(
                              controller: soreThroat,
                              //  textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  //isDense: true,
                                  *//*prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              textDirection: TextDirection.ltr,
            ),*//*
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 3.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0)),
                                ),
                                onChanged: (text){
                                  soreThroat.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: soreThroat.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: soreThroat
                                                  .text.length)));
                                }),
                          ))*/

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Allergy  : ',
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
                              controller: allergy,
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
                                onChanged: (text){
                                //  allergy.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: allergy.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: allergy
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
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
                    alignment: AlignmentDirectional.centerStart,
                    margin: new EdgeInsets.fromLTRB(5.0, 2.0, 1.0, 1.0),
                    child: Text('2. Past History',
                        style: TextStyle(
                          fontSize: 18.00,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' HTN : ',
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
                              controller: HTN,
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
                                onChanged: (text){
                                 // HTN.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: HTN.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: HTN
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' DM : ',
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
                              controller: DM,
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
                                onChanged: (text){
                                //  DM.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: DM.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: DM
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Ishemic Heart Disease : ',
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
                              controller: ischemicDisease,
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
                                onChanged: (text){
                                 // ischemicDisease.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: ischemicDisease.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: ischemicDisease
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Cerebrovascular accident : ',
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
                              controller: cerebrovascularaccident,
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
                                onChanged: (text){
                                 // cerebrovascularaccident.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: cerebrovascularaccident.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: cerebrovascularaccident
                                                  .text.length)));
                                }),
                          ),
                          ),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Treatment : ',
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
                              controller: treatment,
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
                                onChanged: (text){
                                 // treatment.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: treatment.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: treatment
                                                  .text.length)));
                                }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Anti Hyoertensive : ',
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
                              controller: antiHyoertensive,
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
                            onChanged: (text){
                                 // antiHyoertensive.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: antiHyoertensive.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: antiHyoertensive
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Insulin : ',
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
                              //controller: insulin,
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
                              onChanged: (text){
                                 // insulin.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: insulin.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: insulin
                                                  .text.length)));
                            }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Antiplateles : ',
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
                              controller: anitplatelates,
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
                            onChanged: (text){
                                 // anitplatelates.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: anitplatelates.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: anitplatelates
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Transfusion PVC/Blood : ',
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
                              controller: transfusionPCV,
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
                            onChanged: (text){
                                  //transfusionPCV.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: transfusionPCV.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: transfusionPCV
                                                  .text.length)));
                            }),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
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
                              controller: pulse,
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
                            onChanged: (text){
                                //  pulse.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: pulse.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: pulse
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' B.P : ',
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
                              controller: BP,
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
                            onChanged: (text){
                                //  BP.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: BP.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: BP
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
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
                            margin: EdgeInsets.all(2),
                            child: TextField(
                              controller: RR,
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
                            onChanged: (text){
                             //     RR.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: RR.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: RR
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' JVP : ',
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
                              controller: JVP,
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
                            onChanged: (text){
                                 // JVP.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: JVP.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: JVP
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Pallor : ',
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
                              controller: pallor,
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
                            onChanged: (text){
                                //  pallor.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: pallor.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: pallor
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Cynosis Clubbing : ',
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
                              controller: cynosisClubbing,
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
                            onChanged: (text){
                               //   cynosisClubbing.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: cynosisClubbing.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: cynosisClubbing
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' CVS: ',
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
                              controller: CVS,
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
                            onChanged: (text){
                                //  CVS.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: CVS.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: CVS
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' RS : ',
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
                              controller: RS,
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
                            onChanged: (text){
                               //   RS.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: RS.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: RS
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' CNS : ',
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
                              controller: CNS,
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
                            onChanged: (text){
                               //   CNS.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: CNS.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: CNS
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' CV : ',
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
                              controller: CV,
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
                            onChanged: (text){
                                 // CV.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: CV.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: CV
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
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
                            margin: EdgeInsets.all(2),
                            child: TextField(
                              controller: ECG,
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
                            onChanged: (text){
                                //  ECG.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: ECG.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: ECG
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Chest X-Ray : ',
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
                              controller: chestXRay,
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
                            onChanged: (text){
                                 // chestXRay.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: chestXRay.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: chestXRay
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Blood Test : ',
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
                              controller: bloodTest,
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
                                ),onChanged: (text){
                                //  bloodTest.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: bloodTest.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: bloodTest
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: Text(
                                ' Impression by Physician : ',
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
                              controller: impPhy,
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
                            onChanged: (text){
                               //   impPhy.text = text;
                                  TextEditingController.fromValue(
                                      TextEditingValue(
                                          text: impPhy.text,
                                          selection: new TextSelection
                                              .collapsed(
                                              offset: impPhy
                                                  .text.length)));
                            },),
                          )),

                        ],
                      )),
                    Container(
                      margin: EdgeInsets.all(2),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.all(2),
                            //padding: new EdgeInsets.all(2),
                            child: Text(' Ok For Surgery  ',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 15,
                                letterSpacing: 0.2,fontFamily: 'Roboto',fontWeight: FontWeight.normal)),),
                          Flexible(child:Container(
                            /* decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black, width: 1.0),)*/
                             // margin: EdgeInsets.fromLTRB(6.0, 2.0, 1.0, 2.0),
                              child:new DropdownButton<String>(
                                value: okForSurgery,
                                hint: Text(''),
                                items: surgeryDecision.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),

                                onChanged: (String data) {
                                  setState(() {
                                    okForSurgery = data;
                                  });
                                },
                              )))

                        ],
                      )),
                    Container(
                      alignment: Alignment.center,
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
                                FinalJsonObject(widget.data.profileMasterId);
                              }else{
                                FinalJsonObject("");
                              }
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainActivity('')));

                             // Navigator.push(context,MaterialPageRoute(builder: (context) => MainActivity('MainActivity')));
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
                            onPressed: () {
                            },
                          ))
                    ],),),






            ]))))
          ]),        ),
      ),
    );
  }
  void FinalJsonObject(String profileMasterId) async {
    /*{
	"ChestPain": "","Palpitation": "","Breathelessness": "","Fever": "","Cough": "","SoreThroat": "",
	"Allergy": "","HTN": "","DM": "","IschemicHeartDisease": "","CerebrovascularAccident": "",
	"Treatment": "","AntiHyoertensive": "","Insulin": "",
	"Antiplatelates": "","TransfusionPCV": "",
	"Pulse": "","BP": "","RR": "","JVP": "",
	"Pallor": "","CynosisClubbing": "","CVS": "","RS": "","CNS": "",
	"CV": "","ECG": "","ChestX-Ray": "","BloodTest": "",
	"ImpPhy": "","OKSurgery": "Y",
	"Date": "2020/01/07"
}*/
    var okSurgery;
    if(okForSurgery == 'yes'){
      okSurgery = 'Y';
    }else{
      okSurgery = 'N';
    }

    var split_date = _date.toString().split(" ");
    String _dateVal = split_date[0];

    var body = jsonEncode({ 'ProfileMasterId': profileMasterId,'ChestPain':chestPain.text,'Palpitation':palpitation.text,'Breathelessness':breathelessness.text,
      'Fever':fever.text,'Cough':cough.text,'SoreThroat':soreThroat.text,'Allergy':allergy.text,'HTN':HTN.text,'DM':DM.text,
      'IschemicHeartDisease':ischemicDisease.text,'CerebrovascularAccident':cerebrovascularaccident.text,
      'Treatment':treatment.text,'AntiHyoertensive':antiHyoertensive.text,'Insulin':insulin.text,'Antiplatelates':anitplatelates.text,
      'TransfusionPCV':transfusionPCV.text,'Pulse':pulse.text,'BP':BP.text,'RR':RR.text,'JVP':JVP.text,'Pallor':pallor.text,
      'CynosisClubbing':cynosisClubbing.text,
      'CVS':CVS.text,'RS':RS.text,'CNS':CNS.text,'CV':CV.text,'ECG':ECG.text,'ChestX-Ray':chestXRay.text,
      'BloodTest':bloodTest.text,'ImpPhy':impPhy.text,
      'OKSurgery':okSurgery,'Date':_dateVal});


    String GetSessions = 'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    String PostPhysicalFitness = 'http://ot.ekatm.co.in/api/otAPI/PostPhysicalFitness';
    // Session().get(GetSessions, body,PostPhysicalFitness);
    String res ;
    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if(jsonDecode(response.body) == true) {
      response = await http.post(PostPhysicalFitness, body: body, headers: headers);
      updateCookie(response);
      res = jsonDecode(response.body);
      if(jsonDecode(response.body) == "true"){
        Fluttertoast.showToast(
            msg: "Data  save successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.lightBlueAccent,textColor: Colors.white,
            timeInSecForIosWeb: 1
        );
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>MainActivity('')));
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

}


