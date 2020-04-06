import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
//import 'assets:
    //- assets/images/puneeth.jpgpackage:intl/intl_browser.dart';
Random random = new Random();

void main() {
  runApp(new FriendlychatApp());
}
const String _name = "Puneeth";
class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
      primaryColor: Color(0xFF4267B2),
      ),
      title: "Friendlychat",
      home: new Scaffold(
        appBar: chatAppBar(),
        body: ChatScreen(),
      ),
    );
  }
  Widget chatAppBar() {
  return new AppBar(
  
  title:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Container(
                //margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.white70),                                //new
                  //onPressed: () => _handleSubmitted(_textController.text)),
                       ),
                   ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/puneeth.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              Column(children: <Widget>[
              Row(
                //ROW 1
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child:new Text("Puneeth",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    ),
                  ),
                ],
              ),
              Row(//ROW 2
                  children: [
                Container(
                  //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Text("online",
                  style: TextStyle(
                      fontSize: 10,
                    ),
                  textAlign: TextAlign.start,
                  ),
                ),
              ]),
            ],),],),);
      }
}

class ChatScreen extends StatefulWidget {                    
  @override                                                        
  State createState() => new ChatScreenState();                    
} 
DateTime now = DateTime.now();
// Add the ChatScreenState class definition in main.dart.
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController, this.sent,});         
  final String text;
  final AnimationController animationController;
  final sent; 
  String formattedDate = DateFormat('kk:mm').format(now);
  //double width = MediaQuery.of(context).size.width;                  
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(                                    
    sizeFactor: new CurvedAnimation(                              
        parent: animationController, curve: Curves.easeOut),
    axisAlignment: 0.0,                                           
    child: new Container(                                    
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*new Container(
              margin: const EdgeInsets.only(right:10.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),*/
            ConditionalBuilder(
            condition: sent == 0,
            builder: (context) {
              return new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Card(
                  color: Color(0xFF4267B2),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  new Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: new EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: new Text(text,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                  ),
                  new Container(
                  //margin: const EdgeInsets.symmetric(horizontal:),
                  //padding: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child:
                  new Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                   new Container(
                      child:Text(
                  formattedDate,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color:Colors.white70,
                    fontSize: 11,
                    
                  ),
                ),
                   ),
                  ],),
                  )
                  ],
                  )),
                ),
                
              ],
            ),
          );
          },
          ),
          ConditionalBuilder(
            condition: sent == 1,
            builder: (context) {
              return new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Card(
                  color: Colors.grey[200],
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  new Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: new EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: new Text(text, textAlign: TextAlign.start,),
                  ),
                  new Container(
                  //margin: const EdgeInsets.symmetric(horizontal:),
                  //padding: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child:
                  new Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                   new Container(
                      child:Text(
                  formattedDate,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color:Colors.grey[400],
                    fontSize: 11,
                    
                  ),
                ),
                   ),
                  ],),
                  )
                  ],
                  )),
                ),
                
              ],
            ),
          );
          },
          ),
          ],
        ),
      ),
    );
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin { 
  final List<ChatMessage> _messages = <ChatMessage>[];
  //final List<ChatMessage1> _messages1 = <ChatMessage1>[];       
  final TextEditingController _textController = new TextEditingController();
  @override                                                       
  Widget build(BuildContext context) {
  return new Scaffold(
    //appBar: new AppBar(title: new Text("Friendlychat")),
    body: new Column(                                        
      children: <Widget>[                                   
        new Flexible(                                       
          child: new ListView.builder(                       
            padding: new EdgeInsets.all(8.0),               
            reverse: true,                                  
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,                    
          ),
        ),
        new Divider(height: 1.0),                           
        new Container(                                      
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor),
          child: _buildTextComposer(),                       
        ),
      ],
    ),
  );
}

Widget _buildTextComposer() {
  return new Container(
    color: Colors.grey[200],
    height: 55,
    //margin: const EdgeInsets.symmetric(horizontal: 8.0),
    child: new Row(
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 2.0),
          child: new IconButton(
            icon: new Icon(Icons.add, color: Colors.grey[600],),                                //new
            onPressed: () => _handleSubmitted(_textController.text)),
        ),
        new Expanded(
          child: new TextField(
          scrollPadding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration(
              hintText: "Send a message",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: const BorderSide(color: Colors.white, width: 10.0),
                ),
              ),
          ),
        ),
        new Container(
          margin: new EdgeInsets.symmetric(horizontal: 4.0),
          child: new IconButton(
            icon: new Icon(Icons.send, color: Colors.lightBlue[600],),                                //new
            onPressed: () => _handleSubmitted(_textController.text)),
        ),
      ],
    ),
  );
}
void _handleSubmitted(String text) {
  _textController.clear();
  int randomNumber;
  randomNumber = random.nextInt(2);
  ChatMessage message = new ChatMessage(
    text: text,
    animationController: new AnimationController(
      duration: new Duration(milliseconds: 700), 
      vsync: this,                               
    ),
    sent: randomNumber,
  );
  /*ChatMessage1 message1 = new ChatMessage1(
    text1: text,
    animationController1: new AnimationController(
      duration: new Duration(milliseconds: 700), 
      vsync: this,                               
    ),
  );*/
  setState(() {
    _messages.insert(0, message);
    //_messages1.insert(1, message1);
  });
  message.animationController.forward();
  //message1.animationController1.forward();
}
@override
void dispose() {
  for (ChatMessage message in _messages)
    message.animationController.dispose();
  /*for (ChatMessage1 message in _messages1)
    message.animationController1.dispose();*/
  super.dispose(); 
}   
}

