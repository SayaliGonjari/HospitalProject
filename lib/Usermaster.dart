import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Usermaster extends StatefulWidget {
  String text;

  Usermaster(this.text);



  @override
  _Usermaster createState() => _Usermaster();
}

class _Usermaster extends State<Usermaster> {
  String sexdropdownValue = 'Male';
  String deptdropdownValue = 'General';
  String dropdownVal = '';
  String deptDropDownVal = '';

  String implantInfoString = 'General';
  String designationInfoString = 'Surgeon';

  List<String> genderNames = ['Male', 'Female', 'Other'];
  List<String> implantInfoList = ['General', 'ICU', 'Other'];
  List<String> designationInfoList = ['Surgeon', 'Ortho', 'Medicine'];


  List<String> departmentNames = ['Gender', 'ICU', 'Other'];

  void getDropDownItem() {
    setState(() {
      dropdownVal = sexdropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Usermaster'),
      ),
      body: Center(
        child: Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                // height: 562.00,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFFE1F5FE),
                        margin: new EdgeInsets.fromLTRB(1.0, 3.0, 1.0, 1.0),
                        child: Text('UserMaster',
                            style: TextStyle(
                                fontSize: 20.00, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 5.0),
                          /* padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 2.0),
                                  margin: new EdgeInsets.fromLTRB(2, 2, 0, 5),*/
                          child: Image.asset('assests/userph.png',
                              width: 80.0,
                              height: 80.0,
                              alignment: Alignment.center,
                              fit: BoxFit.cover)),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('User Id',
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
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          // hintText: "Enter PRN No",
                                          //labelText: "PRN No",
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 7.0,
                                                  horizontal: 5.0),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))))))
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('UserName',
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
                                      25.00, 5.0, 5.0, 5.0),
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          // hintText: "Enter PRN No",
                                          //labelText: "PRN No",
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 7.0,
                                                  horizontal: 5.0),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))))))
                        ],
                      )),
                      Container(
                          child: Row(children: <Widget>[
                        Container(
                          margin: new EdgeInsets.all(5.0),
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
                                margin: EdgeInsets.all(2),
                                padding: EdgeInsets.all(2),
                                child: TextFormField(
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        // hintText: "Enter PRN No",
                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 5.0),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0)))))),
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
                                /* decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, width: 1.0),)*/
                                margin: EdgeInsets.fromLTRB(6.0, 2.0, 1.0, 2.0),
                                child: new DropdownButton<String>(
                                  value: sexdropdownValue,
                                  hint: Text('Select Gender'),
                                  items: genderNames
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                      ])),
                      Container(
                        margin: new EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: new Flexible(
                                    child: Text('Department',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                    flex: 1)),
                            Container(
                              margin: EdgeInsets.fromLTRB(30.0, 2.0, 15.0, 2.0),
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
                        margin: new EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                child: new Flexible(
                                    child: Text('Designation',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 0.2,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.normal)),
                                    flex: 1)),
                            Container(
                              margin: EdgeInsets.fromLTRB(30.0, 2.0, 15.0, 2.0),
                              child: new DropdownButton<String>(
                                value: designationInfoString,
                                hint: Text(''),
                                items: designationInfoList
                                    .map<DropdownMenuItem<String>>(
                                        (String Value) {
                                  return DropdownMenuItem<String>(
                                    value: Value,
                                    child: Text(Value),
                                  );
                                }).toList(),
                                onChanged: (String data) {
                                  setState(() {
                                    designationInfoString = data;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('Mobile No',
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
                                      25.00, 5.0, 5.0, 5.0),
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          // hintText: "Enter PRN No",
                                          //labelText: "PRN No",
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 7.0,
                                                  horizontal: 5.0),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))))))
                        ],
                      )),
                      Container(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.all(5.0),
                            padding: new EdgeInsets.all(2),
                            child: Text('Email Id',
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
                                  width: 225.00,
                                  // margin: EdgeInsets.all(2),
                                  margin: new EdgeInsets.fromLTRB(
                                      40.00, 5.0, 5.0, 5.0),
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          // hintText: "Enter PRN No",
                                          //labelText: "PRN No",
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 7.0,
                                                  horizontal: 5.0),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))))))
                        ],
                      )),
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
                              getData();
                            },
                          ))
                    ])))),
      ),
    );
  }
}

void getData() async{
 Response response = await
 get('http://c207.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=c207&UserLoginId=admin&UserPwd=123&PlantId=1');
 print(response.reasonPhrase);
 Fluttertoast.showToast(
     msg: response.reasonPhrase,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     textColor: Colors.black,
     fontSize: 16.0
 );
}
