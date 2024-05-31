import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DraggableTextPage(),
    );
  }
}

class DraggableTextPage extends StatefulWidget {
  @override
  _DraggableTextPageState createState() => _DraggableTextPageState();
}

class _DraggableTextPageState extends State<DraggableTextPage> {
  Offset position = Offset(100, 100);
  
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Text'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Draggable(
              feedback: Material(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.blue.withOpacity(0.5),
                  child: Text(
                    textController.text,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
              ),
              childWhenDragging: Container(),
              onDragEnd: (detail) {
                setState(() {
                  position = detail.offset;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.blue,
                child: Text(
                  textController.text,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  // Trigger rebuild to update draggable text
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
