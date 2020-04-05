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
    bool goal = false;
    int _checkValue = 0;
    int _distance = 30;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Filters',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Slider Tutorial'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
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
                      ListView(
                        children:<Widget>
                     new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RawChip(
                      label: Text('Custom Chip'),
                      backgroundColor: Colors.grey,
                      selected: goal,
                      selectedColor: Colors.green,
                      onSelected: (bool isSelected) {
                        setState(() {
                          goal = isSelected;
                        });
                      },
                      showCheckmark: true,
                    ),
                      RawChip(
                      label: Text('Custom Chip'),
                      backgroundColor: Colors.grey,
                      selected: goal,
                      selectedColor: Colors.green,
                      onSelected: (bool isSelected) {
                        setState(() {
                          goal = isSelected;
                        });
                      },
                      showCheckmark: true,
                    ),
                     RawChip(
                      label: Text('Custom Chip'),
                      backgroundColor: Colors.grey,
                      selected: goal,
                      selectedColor: Colors.green,
                      onSelected: (bool isSelected) {
                        setState(() {
                          goal = isSelected;
                        });
                      },
                      showCheckmark: true,
                    ),
                      ]),
                      ))
                      ],),
                    ]),
                  ),
              )
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