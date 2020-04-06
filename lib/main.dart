  import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
	
  void main(){ 
    runApp(FiltersApp()); 
  }
  
  class FiltersApp extends StatefulWidget {

    @override	
    _FiltersAppState createState() {
      return _FiltersAppState();
    }
  } 
	List<String> selectedChoices = List();
    List<String> reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil"
    ];
     var data = ['Google', 'Microsoft', 'Apple'];
  var selected = [];
    List<Widget> choices = List();
  class _FiltersAppState extends State {
    var _value = RangeValues(18, 27);
    bool goal_cricket = false;
    bool goal_basketball = false;
    bool goal_football = false;
    int _checkValue = 0;
    int _distance = 30;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Filters',
        theme: ThemeData(
        primaryColor: Colors.white,
        ),
        home: Scaffold(
          appBar: filtersAppBar(),
          body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.max,
                children:<Widget>[
                  /*----Age-----*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        new Text("Age Range"),
                        new Text("${_value.start.round()} - ${_value.end.round()}"),
                        ],
                      ),
                      Row(
                    children:[
                    new Expanded(
                    child: RangeSlider(
                    min: 18,
                    max: 100,
                    //divisions: 10,
                    labels: RangeLabels(
                        '${_value.start}', '${_value.end}'),
                    values: _value,
                    onChanged: (RangeValues value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  ),]),
                    ]),
                    Container(
                    margin: EdgeInsets.all(10),

                    ),
                    /*------Gender---------*/
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                        new Text("Show Me"),
                        ],
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _checkValue,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          'Both',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: _checkValue,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          'Male',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: _checkValue,
                          onChanged: _handleRadioValueChange1,
                        ),
                        new Text(
                          'Female',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    ]),
                    Container(
                    margin: EdgeInsets.all(10),
                    ),//This container is for giving space between the widgets.
                    /*----------Distance--------*/
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        new Text("Max Distance"),
                        new Text("${_distance.round()}kms"),
                        ],
                      ),
                      Row(
                    children:[
                    new Expanded(
                    child: Slider(
                        value: _distance.toDouble(),
                        min: 0.0,
                        max: 100.0,
                        //divisions: 10,
                        //activeColor: Colors.red,
                        //inactiveColor: Colors.black,
                        label: '${_distance.round()}',
                        onChanged: (double newDistance) {
                          setState(() {
                            _distance = newDistance.round();
                          });
                        },
                        semanticFormatterCallback: (double newDistance) {
                          return '${newDistance.round()} dollars';
                        }
                    )
                  ),]),
                    ]),
                  Container(
                    margin: EdgeInsets.all(10),
                    ),
                    /*-------Goals------*/
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                        new Text("Show Me"),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                    
                     new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      RawChip(
                        label: Text('Cricket'),
                        backgroundColor: Colors.black12,
                        avatarBorder: CircleBorder(),
                        selected: goal_cricket,
                        selectedColor: Colors.blueAccent,
                        onSelected: (bool isSelected) {
                        setState(() {
                            goal_cricket = isSelected;
                          });
                        },
                        showCheckmark: false,
                        ),
                      new Container(
                        margin: EdgeInsets.only(right:5),
                      ),
                      RawChip(
                        label: Text('Football'),
                        backgroundColor: Colors.black12,
                        selected: goal_football,
                        selectedColor: Colors.blueAccent,
                        onSelected: (bool isSelected) {
                          setState(() {
                            goal_football = isSelected;
                          });
                        },
                         showCheckmark: false,
                       ),
                      new Container(
                        margin: EdgeInsets.only(right:5),
                      ),
                      RawChip(
                       label: Text('Basketball'),
                       backgroundColor: Colors.black12,
                       selected: goal_basketball,
                       selectedColor: Colors.blueAccent,
                       onSelected: (bool isSelected) {
                         setState(() {
                           goal_basketball = isSelected;
                         });
                       },
                       showCheckmark: false,
                       ),
                       new Container(
                        margin: EdgeInsets.only(right:5),
                      ),
                     ]),
                    ]),
                   ]),
                  ]),
                  ),
              )
          )
      );
    }
  Widget filtersAppBar() {
  return new AppBar(
             title:Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                   Column(
                     children: <Widget>[
                       Row(
                       children: [
                         Container(
                           margin: EdgeInsets.all(5),
                           child:new Text("Filters",
                           style: TextStyle(
                             fontSize: 20,
                             color: Colors.black,
                           ),
                          ),
                        ),
                       ],
                     ),
                    ],
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                  new Container(
                //margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.close, color: Colors.black38),
                  //onPressed: () => _handleSubmitted(_textController.text)),
                       ),
                   ),
                       ]),
                ],
              ),
            );
      }
     void _handleRadioValueChange1(int value) {
    setState(() {
      _checkValue = value;
    });
  }
  void onSelectionChanged(selectedList) {
        setState(() {
            //selectedReportList = selectedList;
            print("hwy");
        });
    }
  }