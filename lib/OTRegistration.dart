import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ot_project/OTBooking.dart';
import 'package:http/http.dart' as http;
import 'package:ot_project/Profile.dart';

class OTRegistration extends StatefulWidget {
  final String text;

  OTRegistration(this.text);

  @override
  _OTRegistration createState() => _OTRegistration();
}

class _OTRegistration extends State<OTRegistration> {
  List<Patients> patientList = [
    Patients(1, 0001, 'Sainath Hospital'),
    Patients(2, 0002, 'XYZ Hospital'),
    Patients(3, 0003, 'ABC Hospital'),
  ];

  TextEditingController _textController = TextEditingController();
  final TextEditingController _searchQuery = TextEditingController();
  bool _isSearching = false;
  String _error;
  List<OTData> listOtdata = new List();
  /*
  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });*/
  List data = List();
  List names;
  List filteredNames;
  Timer debounceTimer;
  List<OTData> _results = List();
  static List<String> mainDataList = new List();
  static List<OTData> mainDataList1 = new List();

  List<String> newDataList = new List();
  List<OTData> filteredUsers = List();



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
          title: Text('Patients Pending For OT Registration'),
        ),
        body: SingleChildScrollView(
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
                  child: Text('Patients Pending For OT Registration',
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OTBooking(
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

  Future<List<OTData>> _fetchJobs() async {
    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataPending";
    var res;
    String url2;
    url2 = uri + "?type=OTBook";

    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if (response.statusCode == 200) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.length != 0) {
      /*  for (int i = 0; i < jsonResponse.length; i++) {
          var prnno = jsonResponse[i]['prnno'];
          var patientName = jsonResponse[i]['patientname'];
          var profileMasterid = jsonResponse[i]['profileMasterid'];
          var opdno = jsonResponse[i]['opdno'];
          var ipdno = jsonResponse[i]['ipdno'];
          mainDataList.add(jsonResponse[i]['patientname']);
          //OTData data = new OTData();

          mainDataList1.add(new OTData(prnno: prnno,patientname: patientName,profilemasterid: profileMasterid,
              opdno: opdno,ipdno: ipdno));
        }*/

        List<OTData> list = parseUsers(response.body);
        return list;
//        listOtdata = jsonResponse.map((job) => new OTData.fromJson(job)).toList();
//        return jsonResponse.map((job) => new OTData.fromJson(job)).toList();
      }
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  static List<OTData> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<OTData>((json) => OTData.fromJson(json)).toList();
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



class OTData {
   String prnno;
   String patientname;
   String profilemasterid;
   String opdno;
   String ipdno;

/*  "prnno": "fg",
  "patientname": "sgh",
  "profilemasterid": "0c468b1b-0e6b-4c9a-93dc-5ea8406ad1a4",
  "opdno": "sh",
  "ipdno": "gjh"*/

  OTData(
      {this.prnno,
      this.patientname,
      this.profilemasterid,
      this.opdno,
      this.ipdno});

  factory OTData.fromJson(Map<String, dynamic> json) {
    return OTData(
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
