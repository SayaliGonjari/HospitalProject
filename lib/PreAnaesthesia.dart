import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:ot_project/PhysicalFitness.dart';
import 'package:ot_project/PreAnaesthesia1.dart';
import 'package:ot_project/Profile.dart';

import 'ViewPatientDetails.dart';

class PreAnaesthesia extends StatefulWidget {
  final String text;

  PreAnaesthesia(this.text);

  @override
  _PreAnaesthesia createState() => _PreAnaesthesia();
}

class _PreAnaesthesia extends State<PreAnaesthesia> {

  List<Patients> patientList = [
    Patients(1, 0001, 'Sainath Hospital'),
    Patients(2, 0002, 'XYZ Hospital'),
    Patients(3, 0003, 'ABC Hospital'),
  ];

  Data d;
  List<AnesthesisData> listOtdata = new List();
  List<AnesthesisData> filteredUsers = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _fetchJobs();
    _fetchJobs().then((usersFromServer) {
      setState(() {
        listOtdata = usersFromServer;
        filteredUsers = listOtdata;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Patients Pending For Pre Anesthesia'),
        ),
        body:SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10.00),
              decoration: new BoxDecoration(
                border: Border.all(color: Colors.lightBlueAccent),
              ),
              child: Column(children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.center,
                  color: Color(0xFFE1F5FE),
                  margin: new EdgeInsets.all(1.0),
                  child: Text('Patients Pending For Pre Anesthesia',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 18.00,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                  //margin: EdgeInsets.all(2),
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text(
                            'Patients Name : ',
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
                              child: TextField(
                                // controller: _searchQuery,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      hintText: 'Search Here...',
                                      contentPadding: new
                                      EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 3.0),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25.0))),
                                  onChanged: (string) {
                                    setState(() {
                                      filteredUsers = listOtdata
                                          .where((u) => (u.patientname
                                          .toLowerCase()
                                          .contains(string.toLowerCase()) /*||
                              u.prnno.toLowerCase().contains(string.toLowerCase())*/)).toList();
                                    });}
                              ))),

                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: filteredUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(child:Card(
                        child: Padding(

                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                filteredUsers[index].patientname,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                filteredUsers[index].patientname.toLowerCase(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PreAnaesthesia1(
                            profileMasterId: filteredUsers[index].profilemasterid,
                            patientName:filteredUsers[index].patientname,
                            prnNo:filteredUsers[index].prnno,
                            opdNo:filteredUsers[index].opdno,ipdNo: filteredUsers[index].ipdno)));
                      });
                    },
                  ),
                )
              ])),
        ));


  }


  Future<List<AnesthesisData>> _fetchJobs() async {
    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataPending";
/*
    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);*/
    var res;
    String url2;
    url2 = uri + "?type=PreAnsthesia";

    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if (response.statusCode == 200) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new AnesthesisData.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Widget _JobListView(List<AnesthesisData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].patientname, data[index].prnno);
        });
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

Card _tile(String patientname, String subtitle) => Card(
    child: ListTile(
      title: Text(patientname,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          )),
      subtitle: Text(subtitle),
      onTap: () =>
      {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PreAnaesthesia1(profileMasterId: '')))
      })
     /* Navigator.of(context).pushReplacement(
      MaterialPageRoute(
      builder: (context) => GetTestData(),
      ),
      )*/

    //  Navigator.push(context, MaterialPageRoute(builder: (context) => PreAnaesthesia1('text')))
      /* Navigator.push(
          context, MaterialPageRoute(builder: (context) => PreAnaesthesia1('physical Fitness'))),*/
      /*leading: Icon(
    icon,
    color: Colors.blue[500],
  ),*/
    );

class AnesthesisData {
  final String prnno;
  final String patientname;
  final String profilemasterid;
  final String opdno;
  final String ipdno;

/*  "prnno": "fg",
  "patientname": "sgh",
  "profilemasterid": "0c468b1b-0e6b-4c9a-93dc-5ea8406ad1a4",
  "opdno": "sh",
  "ipdno": "gjh"*/

  AnesthesisData(
      {this.prnno,
        this.patientname,
        this.profilemasterid,
        this.opdno,
        this.ipdno});

  factory AnesthesisData.fromJson(Map<String, dynamic> json) {
    return AnesthesisData(
      prnno: json['prnno'],
      patientname: json['patientname'],
      profilemasterid: json['profilemasterid'],
      opdno: json['opdno'],
      ipdno: json['ipdno'],
    );
  }
}

class Patients {

  int id, points;
  String name;

  Patients(this.id, this.points, this.name);
}

