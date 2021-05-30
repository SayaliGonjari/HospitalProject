import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchList> {
  final FocusNode myFocusNode = new FocusNode();

  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _isSearching = false;
  String _error;
  List<OTData> _results = List();

  Timer debounceTimer;  List data = List();
  List names;
  List filteredNames;


  _SearchState() {
    _searchQuery.addListener(() {
      if (debounceTimer != null) {
        debounceTimer.cancel();
      }
      debounceTimer = Timer(Duration(milliseconds: 500), () {
        if (this.mounted) {
          performSearch(_searchQuery.text);
        }
      });
    });
  }

  void performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _error = null;
        _results = List();
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _error = null;
      _results = List();
    });

    final repos = await Api._fetchJobs();
    if (this._searchQuery.text == query && this.mounted) {
      setState(() {
        _isSearching = false;
        if (repos != null) {
          _results = repos;
        } else {
          _error = 'Error searching repos';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        appBar: AppBar(
          centerTitle: true,
          title: TextField(
            autofocus: true,
            controller: _searchQuery,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(end: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                hintText: "Search repositories...",
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    if (_isSearching) {
      return CenterTitle('Searching Github...');
    } else if (_error != null) {
      return CenterTitle(_error);
    } else if (_searchQuery.text.isEmpty) {
      return CenterTitle('Begin Search by typing on search bar');
    } else {
      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          itemCount: _results.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                    title: Text(_results[index].patientname,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        )),
                    subtitle: Text(_results[index].prnno),
                    onTap: () =>
                    {
                      /*Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OTBooking(
                          profileMasterId: _results[index].profilemasterid,
                          patientName:data[index].patientname,
                          prnNo:data[index].prnno,
                          opdNo:data[index].opdno,ipdNo: data[index].ipdno)))*/
                    })
            );
          });
    }
  }
}



class CenterTitle extends StatelessWidget {
  final String title;

  CenterTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ));
  }
}

class Api {
  List names;

  static final HttpClient _httpClient = HttpClient();
  static final String _url = "api.github.com";

/*  static Future<List<OTData>> getRepositoriesWithSearchQuery(String query) async {
    final uri = Uri.https(_url, '/search/repositories', {
      'q': query,
      'sort': 'stars',
      'order': 'desc',
      'page': '0',
      'per_page': '25'
    });

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['items'] == null) {
      return List();
    }

    return Repo.mapJSONStringToList(jsonResponse['items']);
  }*/

  static Future<List<OTData>> _fetchJobs() async {
    List filteredNames;
    List data = List();
    List names;
    String GetSessions =
        'http://ot.ekatm.co.in/api/LoginAPI/GetSessions?AppEnvMasterId=ot&UserLoginId=1001&UserPwd=123&PlantId=1';
    var uri = "http://ot.ekatm.co.in/api/OTAPI/GetDataPending";
/*
    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);*/
    var res;
    String url2;
    url2 = uri + "?type=OTBook";

    http.Response response = await http.get(GetSessions, headers: headers);
    updateCookie(response);
    if (response.statusCode == 200) {
      response = await http.get(url2, headers: headers);
      updateCookie(response);
      List jsonResponse = json.decode(response.body);
      if(jsonResponse.length != 0){
        for (int i = 0; i < jsonResponse.length; i++) {
          data.add(jsonResponse[i]['patientname']);
        }
        names = data;
        names.shuffle();
        filteredNames = names;
        return jsonResponse.map((job) => new OTData.fromJson(job)).toList();
      }


    } else {
      throw Exception('Failed to load jobs from API');
    }


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
class OTData {
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