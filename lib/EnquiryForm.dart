import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';

class EnquiryForm extends StatefulWidget {
  final String text;

  EnquiryForm(this.text);

  @override
  _EnquiryForm createState() => _EnquiryForm();
}

class _EnquiryForm extends State<EnquiryForm> {
  List<Patients> patientList = [
    Patients(1, 0001, 'Sainath Hospital'),
    Patients(2, 0002, 'XYZ Hospital'),
    Patients(3, 0003, 'ABC Hospital'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Enquiry Form'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(10.00),
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent),
          ),
          child: Flexible(
              child: SingleChildScrollView(
            child: Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.center,
                  color: Color(0xFFE1F5FE),
                  margin: new EdgeInsets.all(1.0),
                  child: Text('Enquiry Form',
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
                            margin: EdgeInsets.all(2),
                            child: TextField(
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  isDense: true,
                                  //hintText: "Enter Patients No",
                                  labelText: "Enter Patients Name",
                                  /*prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                                textDirection: TextDirection.ltr,
                              ),*/
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 3.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0))),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  color: Color(0xFFE1F5FE),
                  padding: new EdgeInsets.all(7.0),
                  margin: new EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 2.0),
                  child: Text('Patients',
                      style: TextStyle(
                        letterSpacing: 0.2,
                        fontSize: 15.00,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    //height: 65.0,
                    //color: Color(0xFFE3F2FD),
                    height: MediaQuery.of(context).size.height,
                    padding: new EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 2.0),
                    child: ListView.builder(
                        itemCount: patientList.length,
                        itemBuilder: (BuildContext context, int index) {
                          mainAxisSize : MainAxisSize.min;

                          return Container(
                              //height: 65.0,
                              child:Flexible(child:Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                elevation: 4,

                                child: Flexible(child:Column(

                                  children: <Widget>[
                                    new ListTile(

                                      dense:true,
                                      contentPadding: EdgeInsets.fromLTRB(0.0, -0.5, 0.0, 0.1),
                                      title: Align(
                                          //heightFactor: 0.0,
                                          alignment: Alignment(-0.9,0),
                                          child: new Text(
                                        patientList[index]
                                            .points
                                            .toString(),textAlign: TextAlign.start, style:TextStyle(fontSize: 13.0)
                                      )),
                                      subtitle: Align(
                                        //heightFactor: 0.0,
                                        child: Text(
                                          patientList[index]
                                              .name,textAlign: TextAlign.start ,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 13.0),
                                        ),alignment: Alignment(-0.9,0),
                                      ),
                                      // alignment: Alignment.bottomCenter) ,
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Profile())),
                                    )
                                  ],
                                )),
                              )));
                        }))
              ],
            )),
          )),
        ));
  }
}

class Patients {
  int id, points;
  String name;

  Patients(this.id, this.points, this.name);

  // Patients(int i,String name1);
}

/*child: Card(
                            child: ListTile(
                                title: Text("$index"),
                                subtitle: Text('Sainath Hospital'),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Profile('Profile')))),
                          )*/
