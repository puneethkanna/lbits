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

  List<Widget> choices = List();
  class _FiltersAppState extends State {
    var _value = RangeValues(18, 27);
    bool goal_cricket = true;
    bool goal_basketball = false;
    bool goal_football = true;
    int _checkValue = 0;
    int _distance = 30;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Filters',
        theme: ThemeData(
        primaryColor: Colors.white,
        ),
        home: Scaffold(
          appBar: filtersAppBar(),
          body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.max,
                children:<Widget>[
                  /*----Age-----*/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                        new Text("Age Range"),
                        new Text("${_value.start.round()} - ${_value.end.round()}"),
                        ],
                      ),
                   new Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget>[
                    new Expanded(
                    flex: 1,
                    child: RangeSlider(
                    min: 18,
                    max: 65,
                    inactiveColor: Colors.grey[300],
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
//This container is for giving space between the widgets.
                    /*----------Distance--------*/
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                        new Text("Max Distance"),
                        new Text("${_distance.round()}kms"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:<Widget>[
                        new Expanded(
                          flex: 1,
                          child: Slider(
                            value: _distance.toDouble(),
                            min: 0.0,
                            max: 140.0,
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
                        ),
                      ]),
                    ]),
                  Container(
                    margin: EdgeInsets.all(10),
                    ),
                    /*-------Goals------*/
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:[
                        new Text("Show me people with goals\n"),
                        ],
                      ),
                      Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                              //padding: const EdgeInsets.all(8.2),
                              child:Container(
                                height: 32,
                                child: RaisedButton(
                                  //padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Center(
                                      child: Text(
                                        "Cricket",
                                        style: TextStyle(
                                          color: goal_cricket
                                              ? Colors
                                              .white
                                              : Colors.blueAccent,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    elevation: 0.0,
                                    color: goal_cricket
                                    ? Colors.blueAccent
                                    : Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        goal_cricket = !goal_cricket;
                                      });
                                    }
                                ),
                                decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.blueAccent, width: 1.0),
                                  borderRadius: new BorderRadius.circular(30.0),
                                  color: Colors.blueAccent,
                                ),
                              ),  
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                              //padding: const EdgeInsets.all(8.2),
                              child:Container(
                                height: 32,
                                child: RaisedButton(
                                  //padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Center(
                                      child: Text(
                                        "Football",
                                        style: TextStyle(
                                          color: goal_football
                                              ? Colors
                                              .white
                                              : Colors.blueAccent,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    elevation: 0.0,
                                    color: goal_football
                                    ? Colors.blueAccent
                                    : Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        goal_football =!goal_football;
                                      });
                                    }
                                ),
                                decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.blueAccent, width: 1.0),
                                  borderRadius: new BorderRadius.circular(30.0),
                                  color: Colors.blueAccent,
                                ),
                              ),  
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                              //padding: const EdgeInsets.all(8.2),
                              child:Container(
                                height: 32,
                                child: RaisedButton(
                                  //padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Center(
                                      child: Text(
                                        "Basketball",
                                        style: TextStyle(
                                          color: goal_basketball
                                              ? Colors
                                              .white
                                              : Colors.blueAccent,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    elevation: 0.0,
                                    color: goal_basketball
                                    ? Colors.blueAccent
                                    : Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        goal_basketball = !goal_basketball;
                                      });
                                    }
                                ),
                                decoration: BoxDecoration(
                                  border: new Border.all(color: Colors.blueAccent, width: 1.0),
                                  borderRadius: new BorderRadius.circular(30.0),
                                  color: Colors.blueAccent,
                                ),
                              ),  
                          ),
                        ),
                      ])
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
                    Expanded(
                      flex: 1,
                      child:Center(
                       child:new Text("Filters",
                       style: TextStyle(
                       fontSize: 20,
                       color: Colors.black,
                      ),
                     ),
                     ),
                    ),
                  //margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  new IconButton(
                  icon: new Icon(Icons.close, color: Colors.black38),
                  //onPressed: () => _handleSubmitted(_textController.text)),
                  ),
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