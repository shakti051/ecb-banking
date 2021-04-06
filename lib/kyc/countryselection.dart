import 'dart:convert';

import 'package:easymoney/constants/constants.dart';
import 'package:easymoney/kyc/doctype.dart';
import 'package:easymoney/models/countielist.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => new _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
//class Countries extends StatelessWidget {
  List<Country> _countrylist = [];
  List<Country> _searchResult = [];
  int _selectedIndex;
  TextEditingController controller = new TextEditingController();

  void getCountriesLists() async {
    final response = await http.get(BASE_URL + 'countries');
    final responseJson = json.decode(response.body);
    setState(() {
      for (Map country in responseJson['countries']) {
        _countrylist.add(Country.fromJson(country));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCountriesLists();
  }

  // Widget _buildCountryList() {
  //   return FutureBuilder<String>(
  //     future: getCountriesLists(),
  //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(child: Text('Please wait its loading...'));
  //       } else {
  //         if (snapshot.hasError)
  //           return Center(child: Text('Error: ${snapshot.error}'));
  //         else
  //           return Center(
  //               child: new Text(
  //                   '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
  //       }
  //     },
  //   );
  // }

  Widget _buildCountryList() {
    return new ListView.builder(
      itemCount: _countrylist.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new NetworkImage(SITE_URL +
                  'images/flag/' +
                  _countrylist[index].alpha2Code.toLowerCase() +
                  '.png'),
            ),
            title: new Text(_countrylist[index].name.toUpperCase()),
            selected: index == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              _moveNext();
            },
            //_countrylist[index].name.toUpperCase()
            // print(_countrylist[index].name.toUpperCase());
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PayeeAddInternational(
            //             country: _countrylist[index].name.toUpperCase())));
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return new ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, i) {
        return new Card(
          child: new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new NetworkImage(SITE_URL +
                  'images/flag/' +
                  _searchResult[i].alpha2Code.toLowerCase() +
                  '.png'),
            ),
            title: new Text(_searchResult[i].name.toUpperCase()),
            onTap: () {
              _moveNext();
              //print(_searchResult[i].name.toUpperCase());
            },
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Choose country', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Container(color: Colors.blue[800], child: _buildSearchBox()),
        new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? _buildSearchResults()
                : _countrylist.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      )
                    : _buildCountryList()),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _countrylist.forEach((countryDetail) {
      if (countryDetail.name.toUpperCase().contains(text.toUpperCase()))
        _searchResult.add(countryDetail);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        // status bar color
        brightness: Brightness.dark,
        title: Text("Select country"),
        centerTitle: true,
        elevation: 0,
        //automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_outlined),
              alignment: Alignment(-0.5, 0.0), // move icon a bit to the left
            );
          },
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            _moveNext();
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('CONTINUE'),
        ),
      ),
//      resizeToAvoidBottomPadding: true,
    );
  }

  void _moveNext(){
    pushNewScreen(context, screen: Doctype());
  }
}
